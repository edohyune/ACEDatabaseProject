CREATE PROCEDURE [dbo].[SP_SYS900]  (
  @prc            varchar(20),
  @pid	varchar(50),
  @frm	varchar(50),
  @reqUser	varchar(50),
  @title	text,
  @contents	text,
  @status	varchar(50),
  @memo	text,
  @reqDate	varchar(50),
  @dlvDate	varchar(50),
  @cfmDate	varchar(50),
  @prcDate	varchar(50),
  @tstDate	varchar(50),
  @finDate	varchar(50),
  @cid varchar(20))
as
begin
  if @prc='I'
		INSERT INTO SYS900 (frm, reqUser, title, contents, status, memo, reqDate, dlvDate, cfmDate, prcDate, tstDate, finDate, cid, cdt, mid, mdt)
    VALUES (@frm, @cid, @title, @contents, @status, @memo, getdate(), null, null, null, null, null, @cid, getdate(), @cid, getdate())
  
  if @prc='U'
    UPDATE SYS900				
       SET  frm	=	@frm	,
          	-- reqUser	=	@reqUser	,
          	title	=	@title	,
          	contents	=	@contents	,
          	status	=	@status	,
          	memo	=	@memo	,
          	reqDate	=	convert(date,left(@reqDate,10)),
          	dlvDate	=	convert(date,left(@dlvDate,10)),
          	cfmDate	=	convert(date,left(@cfmDate,10)),
          	prcDate	=	convert(date,left(@prcDate,10)),
          	tstDate	=	convert(date,left(@tstDate,10)),
          	finDate	=	convert(date,left(@finDate,10))	,
          	mid	=	@cid	,
          	mdt	=	getdate()
     WHERE pid = @pid;				
  
  if @prc='D'
    DELETE SYS900
     WHERE pid = @pid;
end
;
