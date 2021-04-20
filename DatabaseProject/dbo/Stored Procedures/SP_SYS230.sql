CREATE PROCEDURE [dbo].[SP_SYS230]  (
  @prc            varchar(20),
  @pid            varchar(20),
	@sys            varchar(20),
	@frm            varchar(40),
	@wkset          varchar(40),
	@sqltxt         text,
	@memo           text)
as
begin
--  exec putmessage @sqltxt
  if @prc='I'
		INSERT INTO SYS230 (sys,frm,wkset,sqltxt,memo)
    VALUES (@sys,@frm,@wkset,@sqltxt,@memo)
  
  if @prc='U'
    UPDATE SYS230
       SET  sys       = @sys,
						frm       = @frm,
						wkset     = @wkset,
						sqltxt    = @sqltxt,
						memo      = @memo
     WHERE pid = @pid;
  
  if @prc='D'
    DELETE SYS230
     WHERE pid = @pid;
end
;
