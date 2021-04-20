CREATE PROCEDURE [dbo].[SP_SYS100]  (
  @prc      varchar(20),
  @pid      varchar(20),
  @sys		  varchar(20),
  @frm			varchar(20),
  @frm_name	varchar(200),
  @memo			varchar(200),
  @mdl			varchar(20),
  @yn_hide	varchar(1),
  @yn_use		varchar(1))
as
begin
  if @prc='I'
    INSERT INTO SYS100
           (sys,frm,frm_name,memo,mdl,yn_hide,yn_use)
    VALUES (@sys,@frm,@frm_name,@memo,@mdl,isnull(@yn_hide,'0'),isnull(@yn_use,'1'))
  
  if @prc='U'
    UPDATE SYS100
       SET sys      = @sys,
           frm      = @frm,
           frm_name = @frm_name,
           memo     = @memo,
           mdl      = @mdl,
           yn_hide  = isnull(@yn_hide,0),
           yn_use   = isnull(@yn_use,1)
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE SYS100
       SET yn_use   = '1'
     WHERE pid = @pid;
end
;
