CREATE TABLE [dbo].[ACA100] (
    [pid]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [slip_no]    VARCHAR (20)    NOT NULL,
    [seq]        VARCHAR (4)     NOT NULL,
    [slip_class] VARCHAR (20)    NULL,
    [slip_date]  DATE            NULL,
    [cfm_date]   DATE            NULL,
    [acc]        VARCHAR (20)    NULL,
    [dr]         NUMERIC (22, 3) NULL,
    [cr]         NUMERIC (22, 3) NULL,
    [plant]      VARCHAR (4)     NULL,
    [ecost]      VARCHAR (20)    NULL,
    [dept]       VARCHAR (20)    NULL,
    [empno]      VARCHAR (20)    NULL,
    [vendor]     VARCHAR (20)    NULL,
    [bankacc]    VARCHAR (40)    NULL,
    [offset]     VARCHAR (20)    NULL,
    [rmks]       VARCHAR (500)   NULL,
    [curr]       VARCHAR (20)    NULL,
    [curr_rate]  NUMERIC (22, 3) NULL,
    [curr_amt]   NUMERIC (22, 3) NULL,
    [rmks_qty1]  NUMERIC (22, 3) NULL,
    [rmks_qty2]  NUMERIC (22, 3) NULL,
    [rmks_qty3]  NUMERIC (22, 3) NULL,
    [rmks_unit1] VARCHAR (20)    NULL,
    [rmks_unit2] VARCHAR (20)    NULL,
    [rmks_rate1] NUMERIC (22, 3) NULL,
    [rmks_rate2] NUMERIC (22, 3) NULL,
    [rmks_amt1]  NUMERIC (22, 3) NULL,
    [rmks_amt2]  NUMERIC (22, 3) NULL,
    [rmks_amt3]  NUMERIC (22, 3) NULL,
    [rmks_date1] DATE            NULL,
    [rmks_date2] DATE            NULL,
    [rmks_code1] VARCHAR (200)   NULL,
    [rmks_code2] VARCHAR (200)   NULL,
    [rmks_code3] VARCHAR (200)   NULL,
    [rmks_code4] VARCHAR (200)   NULL,
    [rmks_code5] VARCHAR (200)   NULL,
    [rmks_no1]   VARCHAR (MAX)   NULL,
    [rmks_no2]   VARCHAR (200)   NULL,
    [rmks_no3]   VARCHAR (200)   NULL,
    [rmks_no4]   VARCHAR (200)   NULL,
    [rmks_no5]   VARCHAR (200)   NULL,
    [auto_slip]  VARCHAR (1)     NULL,
    [deleted]    VARCHAR (1)     NULL,
    [cid]        VARCHAR (20)    NULL,
    [cdt]        DATETIME        NULL,
    [mid]        VARCHAR (20)    NULL,
    [mdt]        DATETIME        NULL,
    [company]    VARCHAR (10)    NULL,
    CONSTRAINT [PK_ACA100] PRIMARY KEY CLUSTERED ([slip_no] ASC, [seq] ASC)
);


GO
CREATE TRIGGER [dbo].[TG_ACA100] ON [dbo].[ACA100]
WITH EXEC AS CALLER
AFTER INSERT, UPDATE, DELETE
AS
  
-- -------------------------------------------------- 
-- update가 아닌 온전한 삭제인 경우만 상쇄전표 존재check함
-- -------------------------------------------------- 
if not exists (select 1 from deleted join inserted on 1=1)
begin
  if exists ( 
              select 1
                from uv_aca300 a
                join (
                      select company,offSlip=slip_no+seq,orgSlip=offset
                        from deleted
                     ) b on a.company=b.company and a.offSlip=b.offSlip and a.orgSlip=b.orgSlip
               where a.orgSlip=a.offSlip

--              select 1
--                from aca300 a
--                join deleted b on b.company=a.company and a.offset=left(b.offset,14) and a.offset_seq=right(b.offset,3)
--               where not (a.offset=a.slip_no and a.offset_seq=a.slip_seq)
              )
    begin
      exec putMessage '', 'Can not delete. There is an settled slip. [TG_ACA100]'
      ROLLBACK TRANSACTION
      return
    end
end
  
-- -------------------------------------------------- 
-- Temp Table
-- -------------------------------------------------- 
if exists (select 1 from inserted)
begin
--  drop table #tmpACA100
  select a.company, a.slip_no, a.seq, a.acc,
         dc=(case when isnull(a.dr,0)=0 then 'C' else 'D' end),
         a.ecost, a.dept, a.empno, a.vendor, a.bankacc, a.offset, a.curr, -- a.rmks_date2,
         b.yn_dc, b.yn_keyin, b.yn_budget, b.yn_dept, b.yn_vendor, b.yn_staff,
         b.yn_bank, b.yn_costCenter, b.yn_balance, b.yn_curr, b.yn_date1, b.yn_date2,
         b.yn_qty, b.yn_rate, b.yn_amt, b.yn_keyno,
         errMsg=(case when isnull(b.yn_keyin,'0')='0'                      then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] This account is not allowed to edit.'
                      when b.yn_dept='1' and isnull(a.dept,'*')='*'        then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Dept.'
                      when b.yn_vendor='1' and isnull(a.vendor,'*')='*'    then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Vendor.'
                      when b.yn_staff='1' and isnull(a.empno,'*')='*'      then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Staff.'
                      when b.yn_bank='1' and isnull(a.bankacc,'*')='*'     then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Bank Account.'
                      when b.yn_costCenter='1' and isnull(a.ecost,'*')='*' then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Cost-Center.'
                      when b.yn_curr='1' and isnull(a.curr,'*')='*'        then 'ERR ['+a.slip_no+'-'+a.seq+ '/' +a.acc+'] Invalid Currency.'
                      else '0' end)
    into #tmpACA100
    from inserted a
    left join cdc100 b on a.acc = b.acc
--    from aca100 a
--    left join cda200 b on a.acc = b.acc
--   where slip_no='20200131AB0029'
;  
  -- -------------------------------------------------- 
  -- Error Check
  -- -------------------------------------------------- 
  declare @msg varchar(max)=''
  
  if exists (select 1 from #tmpACA100 where errMsg like 'ERR%')
  begin
    select @msg=errMsg from #tmpACA100 where errMsg like 'ERR%'
    exec putMessage '', @msg
    ROLLBACK TRANSACTION
    return
  end
  ;
  -- -------------------------------------------------- 
  -- 계정잔액
  -- -------------------------------------------------- 
  if exists (select 1 from #tmpACA100 where yn_balance='1' and dc<>yn_dc and isnull(offset,'*')='*')
  begin
    select @msg = '['+slip_no+'-'+seq+ '/' +acc+ '] Invalid Offset Slip.' from #tmpACA100 where yn_balance='1' and dc<>yn_dc and isnull(offset,'*')='*'
    exec putMessage '', @msg
    ROLLBACK TRANSACTION
    return
  end
  
  if exists (select 1 from #tmpACA100 where yn_balance='1' and dc<>yn_dc)
  begin
    -- drop table #tmpACC
    
    select a.slip_no,a.slip_seq,a.offset,a.offset_seq,a.acc,a.vendor, vslip_no=b.slip_no, vslip_seq=b.seq, vslip_acc=b.acc, vslip_vendor=b.vendor
      into #tmpACC
      from aca300 a
      join (select company, 
                   slip_no,
                   seq,
                   acc,
                   vendor,
                   offset=left(offset,14),
         offset_seq=right(offset,3)
              from #tmpACA100
             where yn_balance='1' and dc<>yn_dc) b on a.company=b.company and a.offset=b.offset and a.offset_seq=b.offset_seq
    
-- 
    -- 원전표의 계정과 거래처가 다르면 오류
-- 
    if exists (
                select 1
                  from #tmpACC
                 where slip_no=vslip_no 
                   and slip_seq=vslip_seq
                   and not (acc=vslip_acc and vendor=vslip_vendor)
              )
    begin
      select @msg='['+vslip_no+'-'+vslip_seq+'] Not Same Account / Vendor with Original Slip.'
        from #tmpACC
       where slip_no=vslip_no 
         and slip_seq=vslip_seq
         and not (acc=vslip_acc and vendor=vslip_vendor)
    
      exec putMessage '', @msg
      ROLLBACK TRANSACTION
      return
    end
  
-- 
    -- 원전표를 찾을 수 없으면 오류
-- 
    if not exists (select 1 from #tmpACC)
    begin
        select @msg = '['+slip_no+'-'+seq+ '/' +acc+ '] Not exists Offset Slip (B).('+offset+')' from #tmpACA100 where yn_balance='1' and dc<>yn_dc
        exec putMessage '', @msg
        ROLLBACK TRANSACTION
        return
    end
  end
end
  
-- -------------------------------------------------- 
-- Summary TB
-- -------------------------------------------------- 
merge aca200 as a
using (
        select company, plant, ymd, acc, bankacc, dr=sum(dr), cr=sum(cr)
          from (
                select company, plant, ymd=cfm_date, acc, bankacc=isnull(bankacc,'*'), dr=isnull(dr,0), cr=isnull(cr,0)
                  from inserted
                 where cfm_date is not null
                 union all
                select company, plant, ymd=cfm_date, acc, bankacc=isnull(bankacc,'*'), 0-isnull(dr,0), 0-isnull(cr,0)
                  from deleted
                 where cfm_date is not null
               ) a
         group by company, plant, ymd, acc, bankacc
       ) as b on (a.company=b.company and a.plant=b.plant and a.ymd=b.ymd and a.acc=b.acc and a.bankacc=b.bankacc)
when matched then
  update set
    a.dr=a.dr+b.dr,
    a.cr=a.cr+b.cr
when not matched then
  insert (company, plant, ymd, acc, bankacc, dr, cr)
  values (b.company, b.plant, b.ymd, b.acc, b.bankacc, b.dr, b.cr);
  
-- -------------------------------------------------- 
-- AC Balance
-- -------------------------------------------------- 
if exists (select 1 from deleted)
begin
  delete a
    from aca300 a
    join deleted b on b.company=a.company and b.slip_no=a.slip_no and b.seq=a.slip_seq
end
if exists (select 1 from inserted)
begin
  insert into aca300
        (company, plant, slip_no, slip_seq, offset, offset_seq,
         vendor, acc, idate, ddate, iamt, oamt, invoice, rmks)
  select company, plant, slip_no, slip_seq, isnull(offset,slip_no), isnull(offset_seq,slip_seq),
         vendor, acc, idate, ddate,
         iamt=(case when dc=yn_dc and dc='D' then dr
                    when dc=yn_dc and dc='C' then cr else 0 end),
         oamt=(case when dc<>yn_dc and dc='D' then dr
                    when dc<>yn_dc and dc='C' then cr else 0 end),
         invoice, rmks-- , dr, cr, dc, yn_dc
    from (
          select a.company, a.plant,
                 a.slip_no, slip_seq=a.seq,
                 offset=left(a.offset,14), offset_seq=right(a.offset,3),
                 a.vendor, a.acc, a.dr, a.cr, a.rmks,
                 idate=a.cfm_date,
                 ddate=a.rmks_date2,
                 invoice=a.rmks_no1,
                 dc=(case when isnull(a.dr,0)=0 then 'C' else 'D' end),
                 b.yn_dc
            from aca100 a
            join cdc100 b on a.acc=b.acc and b.yn_balance=1
            join inserted c on c.company=a.company and c.slip_no=a.slip_no and c.seq=a.seq
           ) a
-- 
  -- Close
-- 
  select offset, offset_seq
    into #tmpACA300
    from aca300 a
   where exists (select 1 from inserted where company=a.company and slip_no=a.slip_no and seq=a.slip_seq)
  
  update a
     set a.closed='1'
    from aca300 a
    join (
          select a.offset,a.offset_seq
            from aca300 a
            join #tmpACA300 b on b.offset=a.offset and b.offset_seq=a.offset_seq
           group by a.offset,a.offset_seq
          having sum(iamt)=sum(oamt)
         ) b on a.offset=b.offset and a.offset_seq=b.offset_seq
  
-- 
  -- Update detail info
-- 
  update a
    set a.ddate=b.ddate,
        a.invoice=b.invoice
   from aca300 a
   join (
         select a.slip_no, a.slip_seq, a.ddate, a.invoice
           from aca300 a
           join #tmpACA300 b on b.offset=a.offset and b.offset_seq=a.offset_seq
          where a.slip_no=a.offset
        ) b on a.offset=b.slip_no and a.offset_seq=b.slip_seq
end
