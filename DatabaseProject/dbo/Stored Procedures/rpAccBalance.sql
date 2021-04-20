CREATE PROCEDURE [dbo].[rpAccBalance]
@company varchar(2), @yymm varchar(10)
WITH EXEC AS CALLER
AS
Begin
  -- ----------------------------------------------------------------------- 
  -- TB
  -- ----------------------------------------------------------------------- 
  delete aca200
   where company=@company
     and ymd like @yymm+'%'
  
  insert into aca200
  select company, plant, ymd, acc, bankacc, dr=sum(dr), cr=sum(cr)
    from (
          select company, plant, ymd=slip_date, acc, bankacc=isnull(bankacc,'*'), dr=isnull(dr,0), cr=isnull(cr,0)
            from aca100
           where company=@company
             and slip_date like @yymm+'%'
         ) a
   group by company, plant, ymd, acc, bankacc
  -- ----------------------------------------------------------------------- 
  -- Balance
  -- ----------------------------------------------------------------------- 
  -- drop table #tmpAca100
  select a.company, a.plant, org_slip=a.slip_no+a.seq, off_slip=a.offset,
         a.vendor, a.acc, b.accEname,
         idate=a.slip_date,
         ddate=(case when slip_class='MA' then (select distinct dateadd(d,isnull(payment,0),po_date) from mma100 where po_no=a.rmks_no2)
                     when slip_class='SS' then (select distinct due_date from sda200 where invoice_no=a.rmks_no1)
                end),
         a.curr, amt=isnull(a.dr,0)+isnull(a.cr,0),
         invoice=a.rmks_no1, cntlno=a.rmks_no2, a.rmks,
         dc=(case when dr=0 then 'C' else 'D' end),
         b.yn_dc
    into #tmpAca100
    from aca100 a
    join cdc100 b on a.acc=b.acc
   where b.yn_balance=1
     and company=@company
     and slip_date like @yymm+'%'

  delete aca300
   where company=@company
     and idate like @yymm+'%'

-- 
  -- 발생
-- 
  insert into aca300
  select company, plant, org_slip, off_slip=org_slip,
         vendor, acc, idate, ddate,
         curr, amt, oamt=0,
         invoice, cntlno, rmks
    from #tmpAca100
   where dc=yn_dc

-- 
  -- 상쇄
-- 
  insert into aca300
  select company, plant, org_slip, off_slip,
         vendor, acc, idate, ddate,
         curr, iamt=0, oamt=amt,
         invoice, cntlno, rmks
    from #tmpAca100 a
   where dc<>yn_dc
End;
