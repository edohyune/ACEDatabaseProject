CREATE procedure [dbo].[cp_depreciation] @company varchar(20), @yymm varchar(20)
as

--  declare @company varchar(20)='10', @yymm varchar(20)='2020-01'

  declare @lmm varchar(10), @last_dt date
  set @lmm=dbo.fcdate2str(@yymm+'-01', 'lm')
  set @last_dt=eomonth(@yymm+'-01')

  -- -------------------------------------------------------------- 
  -- Update Install Date
  -- -------------------------------------------------------------- 
  update a
     set a.install_date=b.dateOrg
    from ada100 a
    join (
           select pno,dateOrg=min(issue_date)
             from ada200
            where issue_class='11'
            group by pno
         ) b on b.pno=a.pno
   where a.company=@company
     and a.install_date<>b.dateOrg

  -- -------------------------------------------------------------- 
  -- Get Target
  -- -------------------------------------------------------------- 
  IF object_id('tempdb.dbo.#tmpDP', 'U') IS NOT NULL
    DROP TABLE #tmpDP

  select a.pno,a.asset, ltime=a.years*12, a.install_date,
         amtTarget=isnull(b.amtTarget,0),
         mmSeq=(select count(*) from ada300 c where c.pno=a.pno and yymm<@yymm)+1,
         DP=cast(0 as decimal(22,3)), finalDP=cast(0 as decimal(22,3)),
         tmDP=cast(0 as decimal(22,3))
    into #tmpDP
    from ada100 a
    left join (
           select pno,
                  qty=sum(case when issue_class like '1%' then issue_qty else 0 - issue_qty end),
                  amtTarget=sum(case when issue_class like '1%' then issue_amount else 0 - issue_amount end)
             from ada200
            where issue_date <= @last_dt
            group by pno
         ) b on b.pno=a.pno
   where a.company=@company
     and a.years<>0


-- 
  -- 당월상각액
-- 
  update #tmpDP
     set DP=round(amtTarget/ltime,0),
     		 finalDP=amtTarget-1000

  update #tmpDP
     set tmDP=(case when ltime=mmSeq then finalDP else DP end)

-- 
  -- 당월 취득자산은 상각안함
-- 
  delete #tmpDP
   where left(install_date,7)=@yymm

-- select * from #tmpDP
-- select * from ada300

  -- -------------------------------------------------------------- 
  -- Make Depreciation
  -- -------------------------------------------------------------- 
  delete a
    from ada300 a
    join ada100 b on b.pno=a.pno
   where b.company = @company
     and a.yymm = @yymm

  insert ada300 (pno, yymm, elasped_months, depreciation)
  select pno, @yymm, mmSeq, tmDP
   from #tmpDP

-- --------- --------------------------------------------------------------
  -- Make Slip Depreciation
-- --------- --------------------------------------------------------------
  declare @slip_no varchar(100), @slip_date date, @slip_class varchar(10), @cnt int

  set @slip_date = eomonth(@yymm+'-01')
  set @slip_class = 'CL'
  set @slip_no = convert(varchar(10),@slip_date,112) + @slip_class + '5100'

  delete aca100
   where company=@company
     and slip_no=@slip_no

  IF object_id('tempdb.dbo.#tmpCL5100', 'U') IS NOT NULL
    DROP TABLE #tmpCL5100

  select company=@company, slip_no=@slip_no, slip_class=@slip_class, slip_date=@slip_date, plant, ecost,
         seq=row_number() over (partition by 1 order by asset_class),
         accDR, accCR, amt=sum(dp),
         rmks = 'Depreciation Monthly'
    into #tmpCL5100
    from (
          select b.asset_class,b.asset,b.asset_name,b.plant,b.ecost,
                 accDR=dbo.fcGetCode('A01A',b.ecost,'1'),
                 accCR=dbo.fcGetCode('A01',b.asset_class,'1'),
                 accCRDisposal=dbo.fcGetCode('A01',b.asset_class,'2'),
                 emm=a.elasped_months,dp=a.depreciation
            from ada300 a
            join ada100 b on b.pno=a.pno
           where b.company=@company
             and a.yymm=@yymm
         ) a
   group by plant, asset_class, accDR, accCR, ecost

-- select * from #tmpCL5100
-- 
-- select * from ada100


-- 
  -- DR
-- 
  insert into aca100
        (company, plant, slip_no, seq, slip_class, slip_date, cfm_date,
         acc, dr, cr, ecost, vendor, rmks, rmks_code1, rmks_code5,
         auto_slip, cid, cdt, mid, mdt)
  select company, plant, slip_no, seq=right('000'+convert(varchar(10),seq),3),
         slip_class, slip_date, slip_date,
         AccDR, DR=amt, cr=0,
         ecost=(case when ecost='1' then 'B07200' else 'B07300' end),
         'CCXX01', rmks, plant, 'INDIR',
         1, 1, getdate(), 1, getdate()
    from #tmpCL5100

-- 
  -- CR
-- 
  select @cnt=max(seq)
    from aca100
   where company=@company
     and slip_no=@slip_no

  insert into aca100
        (company, plant, slip_no, seq, slip_class, slip_date, cfm_date,
         acc, dr, cr, ecost, vendor, rmks, rmks_code1, rmks_code5,
         auto_slip, cid, cdt, mid, mdt)
  select company, plant, slip_no, seq=right('000'+convert(varchar(10),seq+@cnt),3),
         slip_class, slip_date, slip_date,
         AccCR, dr=0, cr=amt,
         ecost=(case when ecost='1' then 'B07200' else 'B07300' end),
         'CCXX01', rmks, plant, 'INDIR',
         1, 1, getdate(), 1, getdate()
    from #tmpCL5100
