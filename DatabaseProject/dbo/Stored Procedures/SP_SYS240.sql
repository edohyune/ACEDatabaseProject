CREATE PROCEDURE [dbo].[SP_SYS240]  (
  @prc            varchar(20),
  @pid            varchar(20),
	@sys            varchar(20),
	@sqlid          varchar(40),
	@sqltxt         text,
	@memo           varchar(200))
as
begin
--  exec putmessage @sqltxt
  if @prc='I'
		INSERT INTO SYS240 (sys,sqlid,sqltxt,memo)
    VALUES (@sys,@sqlid,@sqltxt,@memo)
  
  if @prc='U'
    UPDATE SYS240
       SET  sys       = @sys,
						sqlid     = @sqlid,
						sqltxt    = @sqltxt,
						memo      = @memo
     WHERE pid = @pid;
  
  if @prc='D'
    DELETE SYS240
     WHERE pid = @pid;
end
;
