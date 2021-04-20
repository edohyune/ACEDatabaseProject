CREATE PROCEDURE [dbo].[sp_ACA100Copy] 
  @company varchar(20), 
  @org_no varchar(20), 
  @target_class varchar(20), 
  @target_date varchar(20), 
  @copyType varchar(20), 
  @cid varchar(20),
  @target_no varchar(50) output
as
begin
  declare @sclass varchar(50)
  
-- 
  -- Get Slip Class
-- 
  select @sclass=code
    from uv_code
   where gcode='AA10'
     and code_name=@target_class
  
-- 
  -- Numbering
-- 
  declare @tbl Table (pno varchar(50))
  insert @tbl Exec spGetNumber @company,'*',@sclass,@target_date
  select @target_no=pno from @tbl
  
-- 
  -- Copy Slip
-- 
  insert into aca100
  select slip_no=@target_no, seq, slip_class=@sclass, slip_date=@target_date, cfm_date=null, acc,
         dr=(case when @copyType='Copy' then dr else cr end),
         cr=(case when @copyType='Copy' then cr else dr end),
         plant, ecost, dept, empno, vendor, bankacc, offset=null, rmks, 
         curr, curr_rate, curr_amt, 
         rmks_qty1, rmks_qty2, rmks_qty3, 
         rmks_unit1, rmks_unit2, 
         rmks_rate1, rmks_rate2, 
         rmks_amt1, rmks_amt2, rmks_amt3, 
         rmks_date1, rmks_date2, 
         rmks_code1, rmks_code2, rmks_code3, rmks_code4, rmks_code5, 
         rmks_no1, rmks_no2, rmks_no3, rmks_no4, rmks_no5=@org_no, 
         auto_slip, deleted='0', @cid, getdate(), @cid, getdate(),
         company
    from aca100
   where company=@company
     and slip_no=@org_no

--  declare @target_no varchar(40)
--  exec sp_ACA100Copy '10','20200720AA0013','AA','2020-08-21','Copy',1,@target_no output
--  print @target_no
end
;
