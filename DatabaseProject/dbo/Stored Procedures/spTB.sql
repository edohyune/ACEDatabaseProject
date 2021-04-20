CREATE PROCEDURE [dbo].[spTB] @company varchar(10), @yymm varchar(10), @tbType varchar(10)
as
--  SET NOCOUNT ON
--  SET LOCK_TIMEOUT 1000
--  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
  
--  declare @company varchar(20)='10', @yymm varchar(20)='2020-01', @tbType varchar(10)='TB'
  
  IF object_id('tempdb.dbo.#tmpTB', 'U') IS NOT NULL
    drop table #tmpTB
  
  select a.acc, b.yn_keyin, dc=b.yn_dc, b.yn_balance, yn_sum=b.yn_amt, accup=b.memo, b.lvl,
         bgDR=sum(bgDR),
         dr=sum(dr),
         edDr=sum(case when b.yn_dc='D' then bgDR+dr-cr else 0 end),
         bgCR=sum(bgCR),
         cr=sum(cr),
         edCr=sum(case when b.yn_dc='C' then bgCR+Cr-Dr else 0 end)
    into #tmpTB
    from (
          -- beg
          select ACC, bgDR=isnull(DR,0), bgCR=isnull(CR,0), dr=0, cr=0
            from aca210
           where company=@company
             and yy=left(@yymm,4)
--             and yy=left(@yymm,4)-1
           union all
          -- transaction
          select ACC, 0,0, DR=sum(isnull(dr,0)), CR=sum(isnull(cr,0))
            from aca200
           where 1=1
           and company=@company
           and YMD between left(@yymm,4)+'-01-01' and eomonth(@yymm+'-01') 
           group by ACC
           union all
          select ACC, 0,0,0,0
            from cdc100
           where deleted=0
         ) a
    left join cdc100 b on a.ACC =b.acc 
   where a.acc < (case when @tbType='TB' then '9' else '4' end)
   group by a.ACC, b.yn_keyin, b.yn_dc, b.yn_balance, b.yn_amt, b.memo, b.lvl
  
--  select err='',
--         strName=space((b.lvl-1)*5)+b.accEname,
--                 a.acc, b.accEname,
--                 bgDR=sum(bgDR), dr=sum(dr),
--                 edDr=sum(edDr), bgCR=sum(bgCR),
--                 cr=sum(cr), edCr=sum(edCr),
--                 cff=(select cr from #tmpTB where acc=b.chkAcc),
--                 b.yn_keyin, b.lvl, b.yn_balance, b.yn_amt, accup=b.memo, b.chkAcc
--    from (
--          select acc,bgDR,dr,edDr,bgCR,cr,edCr	
--            from #tmpTB 
--           union all
--          select acc,0,0,0,0,0,0
--            from cda200
--         ) a
--    join cda200 b on a.acc=b.acc
--   group by a.acc, b.accEname, b.lvl, b.yn_keyin, b.yn_balance, b.yn_amt, b.memo, b.chkAcc
--   order by a.acc
-- 
--  return
  ;
  select err=(case when chkAcc is not null and dr<>cff then 'ERR.Sales'
                   else 'OK'
              end),
         a.*
    from (
          select strName=space((b.lvl-1)*5)+b.accEname,
                 a.acc, b.accEname,
                 bgDR=sum(bgDR), dr=sum(dr),
                 edDr=sum(edDr), bgCR=sum(bgCR),
                 cr=sum(cr), edCr=sum(edCr),
                 cff=(select cr from #tmpTB where acc=b.chkAcc),
                 b.yn_keyin, b.lvl, b.yn_balance, b.yn_amt, accup=b.memo, b.chkAcc
            from (
                  select acc, bgDR, dr, edDr, bgCR, cr, edCr
                    from #tmpTB
                   union all
                  select b.argacc,sum(bgdr),sum(dr),sum(eddr),sum(bgcr),sum(cr),sum(edcr)
                    from #tmpTB a
                    join (
                          select b.acc, a.accup, b.argacc
                            from #tmpTB a
                            cross Apply ftCOATree(a.acc) b
                           where a.lvl=1 and a.yn_sum=1
                         ) b on a.acc=b.acc 
                   where yn_sum=0 and yn_keyin=1
                   group by b.argacc
                   union all
                  select b.argacc,sum(bgdr),sum(dr),sum(eddr),sum(bgcr),sum(cr),sum(edcr)
                    from #tmpTB a
                    join (
                          select b.acc, a.accup, b.argacc
                            from #tmpTB a
                            cross Apply ftCOATree(a.acc) b
                           where a.lvl=2 and a.yn_sum=1
                         ) b on a.acc=b.acc 
                   where yn_sum=0 and yn_keyin=1
                   group by b.argacc
                   union all
                  select b.argacc,sum(bgdr),sum(dr),sum(eddr),sum(bgcr),sum(cr),sum(edcr)
                    from #tmpTB a
                    join (
                          select b.acc, a.accup, b.argacc
                            from #tmpTB a
                            cross Apply ftCOATree(a.acc) b
                           where a.lvl=3 and a.yn_sum=1
                         ) b on a.acc=b.acc 
                   where yn_sum=0 and yn_keyin=1
                   group by b.argacc
                   union all
                  select b.argacc,sum(bgdr),sum(dr),sum(eddr),sum(bgcr),sum(cr),sum(edcr)
                    from #tmpTB a
              join (
                          select b.acc, a.accup, b.argacc
                            from #tmpTB a
                            cross Apply ftCOATree(a.acc) b
                           where a.lvl=4 and a.yn_sum=1
                         ) b on a.acc=b.acc 
                   where yn_sum=0 and yn_keyin=1
                   group by b.argacc
                   union all
                  select b.argacc,sum(bgdr),sum(dr),sum(eddr),sum(bgcr),sum(cr),sum(edcr)
                    from #tmpTB a
                    join (
                          select b.acc, a.accup, b.argacc
                            from #tmpTB a
                            cross Apply ftCOATree(a.acc) b
                           where a.lvl=5 and a.yn_sum=1
                         ) b on a.acc=b.acc 
                   where yn_sum=0 and yn_keyin=1
                   group by b.argacc
               ) a
            join cda200 b on a.acc=b.acc
           group by a.acc, b.accEname, b.lvl, b.yn_keyin, b.yn_balance, b.yn_amt, b.memo, b.chkAcc
         ) a
  ;
