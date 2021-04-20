CREATE PROCEDURE [dbo].[SP_KKA100]  (
  @prc            varchar(20),
	@pid						varchar(20), 
	@prj_no         varchar(20), 
	@prj_name       varchar(200), 
	@prj_sdate      varchar(40),
	@prj_edate      varchar(40), 
	@curr           varchar(40), 
	@amt_cntr       varchar(40), 
	@memo           varchar(200))
as
begin
  if @prc='I'
    INSERT INTO KKA100
				(prj_no, prj_name, prj_sdate, prj_edate, prj_period, curr, amt_cntr, memo)
    VALUES
				(@prj_no, @prj_name, @prj_sdate, @prj_edate, datediff(m,@prj_sdate+'-01',@prj_edate+'-01')+1, @curr, @amt_cntr, @memo)
  
  if @prc='U'
    UPDATE KKA100
       SET prj_no = @prj_no,
           prj_name = @prj_name,
           prj_sdate = @prj_sdate,
           prj_edate = @prj_edate,
           prj_period = datediff(m,@prj_sdate+'-01',@prj_edate+'-01')+1,
           curr = @curr,
           amt_cntr = @amt_cntr,
           memo = @memo
     WHERE pid = @pid
	
  if @prc='D'
    DELETE KKA100
     WHERE pid = @pid
end
