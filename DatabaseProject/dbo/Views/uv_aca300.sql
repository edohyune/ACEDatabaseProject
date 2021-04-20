CREATE view [dbo].[uv_aca300]
as
select company, plant,
       orgslip=offset+offset_seq,
       offslip=slip_no+slip_seq,
       slip_no, slip_seq, offset, offset_seq,
       vendor, acc, idate, ddate, iamt, oamt, invoice, rmks, closed, bgflag
  from aca300
;
