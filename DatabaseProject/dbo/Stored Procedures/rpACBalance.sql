CREATE PROCEDURE [dbo].[rpACBalance]
As
  declare @company varchar(20)='10', @yymm varchar(20)='%'
  
  delete aca300
   where isnull(bgflag,'.') <> '*';
   
-- select * from aca300
  insert into aca300
        (company, plant, slip_no, slip_seq, offset, offset_seq,
         vendor, acc, idate, ddate, iamt, oamt, invoice, rmks)
  select company, plant, slip_no, slip_seq,
         offset=isnull(offset,slip_no), offset_seq=isnull(offset_seq,slip_seq),
         vendor, acc, idate, ddate,
         iamt=(case when dc=yn_dc and dc='D' then dr
                    when dc=yn_dc and dc='C' then cr else 0 end),
         oamt=(case when dc<>yn_dc and dc='D' then dr
                    when dc<>yn_dc and dc='C' then cr else 0 end),
         invoice, rmks-- , dr, cr, dc, yn_dc
    from (
          select a.company, a.plant,
                 a.slip_no, slip_seq=right('000'+a.seq,3),
                 offset=left(a.offset,14), offset_seq=right(a.offset,3),
                 a.vendor, a.acc, a.dr, a.cr, a.rmks,
                 idate=isnull(a.cfm_date,a.slip_date),
                 ddate=a.rmks_date2,
                 invoice=a.rmks_no1,
                 dc=(case when isnull(dr,0)=0 then 'C' else 'D' end),
                 b.yn_dc
            from aca100 a
            join cdc100 b on a.acc=b.acc and b.yn_balance=1
--           where slip_no='20200131AA0021'
         ) a
;
-- 
  -- Closed
-- 
  update a
     set a.closed='1'
    from aca300 a
    join (
          select slip_no,slip_seq
            from aca300
           group by slip_no,slip_seq
          having sum(iamt)=sum(oamt)
         ) b on a.slip_no=b.slip_no and a.slip_seq=b.slip_seq;
-- 
  -- Update detail info by master
-- 
  update a
     set ddate=idate
    from aca300 a
   where ddate is null;
  update a
    set a.ddate=b.ddate,
        a.invoice=b.invoice
   from aca300 a
   join (select slip_no, slip_seq, ddate, invoice, offset, offset_seq
           from aca300
          where slip_no=offset
            and slip_seq=offset_seq) b on a.offset=b.slip_no and a.offset_seq=b.slip_seq;
-- 
  -- AP
-- 
--  insert aca300
--  select company='10', plant, slip_no, seq, slip_no, seq, vendor, account, slip_date, slip_date, iamt=dr, oamt=0, invoice=null, rnks='[CTU BEGIN] '+remark, closed='0','*'
--    from (
--          select slip_no=c02, Slip_Date=c03, Seq=c04, Account=c05, DR=replace(c06,',',''), Remark=c07, Vendor=c08, BankAcc=c09, Offset=c10, Cost=c11, Account_Name=c12, rmks_code5=c13, Plant='01'
--            from xtmp
--           where c01='AP' and c02<>'*'
--  --          and c02='20191227AP0001' -- slip_no
--         ) a
;
-- with ss as (          select slip_no=c02, Slip_Date=c03, Seq=c04, Account=c05, DR=replace(c06,',',''), Remark=c07, Vendor=c08, BankAcc=c09, Offset=c10, Cost=c11, Account_Name=c12, rmks_code5=c13, Plant='01'
--            from xtmp
--           where c01='AP' and c02<>'*'
-- )  
-- select slip_no,seq,count(*)
-- from ss
-- group by slip_no,seq
-- having count(*)>1
--  -- 
--  --AR
--  -- 
--  insert aca300
--  select company='10', plant, slip_no, seq, slip_no, seq, vendor, account, slip_date, slip_date, iamt=amt, oamt=0, invoice=null, rnks='[CTU BEGIN] '+remark, closed='0','*'
--    from (
--          select slip_no=c02, Slip_Date=c03, Seq=right('000'+c15,3), Account=c13, amt=replace(c09,',',''), Remark=isnull(c11,'.'),
--                 Vendor=c12, BankAcc=null, Offset=null, Cost=null, Account_Name=null, rmks_code5=c04, Plant='01'
--            from xtmp
--           where c01='AR' and c02<>'*'
--         ) a
-- ;
-- with ss as (
--          select slip_no=c02, Slip_Date=c03, Seq=right('000'+c15,3), Account=c13, amt=replace(c09,',',''), Remark=isnull(c11,'.'),
--                 Vendor=c12, BankAcc=null, Offset=null, Cost=null, Account_Name=null, rmks_code5=c04, Plant='01'
--            from xtmp
--  where c01='AR' and c02<>'*'
-- )  
-- select slip_no,seq,count(*)
-- from ss
-- group by slip_no,seq
-- having count(*)>1

-- 
  -- Acc balance others
--  -- 
--  insert aca300
--  select company='10', plant, slip_no, seq, slip_no, seq, vendor, account, slip_date, slip_date,
--         iamt=cast(dr as decimal(22,3))+cast(cr as decimal(22,3)), oamt=0, invoice=null, rnks='[CTU BEGIN] '+remark, closed='0','*'
--    from (
--          select slip_no=c02, Slip_Date=c03, Seq=right('000'+c04,3), Account=c05, dr=replace(c06,',',''), cr=replace(c07,',',''), Remark=isnull(c08,'.'),
--                 Vendor=c09, BankAcc=null, Offset=null, Cost=null, Account_Name=null, rmks_code5=null, Plant='01'
--            from xtmp
--           where c01='AX' and c02<>'*'
--         ) a
-- ;
-- select * from aca210;
-- 
-- 
-- delete aca210;
-- ;
-- insert into aca210
-- select company='10', plant='01', yy='2019', acc=c02, bankacc=c07, dr=replace(isnull(c04,0),',',''), cr=0 --replace(isnull(c05,0),',','')
--  from xtmp
-- where c01='TB' and c02<>'*'
-- ;
-- 
-- 
-- select *, coaName=ctu.dbo.fcCoaName(acc)
--  from aca210
-- where yy='2019'
