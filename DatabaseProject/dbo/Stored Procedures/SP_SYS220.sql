CREATE PROCEDURE [dbo].[SP_SYS220]  (
  @prc            varchar(20),
  @pid            varchar(20),
	@sys            varchar(20),
	@frm            varchar(20),
	@sqlid          varchar(40),
	@sqltxt         text,
	@memo           text)
as
begin
--  exec putmessage @sqltxt
  if @prc='I' or @prc='U'
  begin
    if @sys='' or @sys is null
      exec PutMessage 'ooo'
    --,@frm,@sqlid,@sqltxt,@memo)
  end
  
  if @prc='I'
  begin
		INSERT INTO SYS220 (sys,frm,sqlid,sqltxt,memo)
    VALUES (@sys,@frm,@sqlid,@sqltxt,@memo)
  end
  
  if @prc='U'
  begin
    UPDATE SYS220
       SET  sys       = @sys,
            frm       = @frm,
						sqlid     = @sqlid,
						sqltxt    = @sqltxt,
						memo      = @memo
     WHERE pid = @pid;
  end
  
  if @prc='D'
  begin
    DELETE SYS220
     WHERE pid = @pid;
  end
end
;