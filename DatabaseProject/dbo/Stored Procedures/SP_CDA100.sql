CREATE PROCEDURE [dbo].[SP_CDA100]  (
  @prc			 varchar(20),
  @pid			 varchar(20),
  @sys       varchar(10),
  @menu      varchar(20),
  @menu_name varchar(250),
  @frm       varchar(20),
  @yn_hide   varchar(1),
  @yn_use    varchar(1),
  @yn_delete varchar(1),
  @memo      varchar(400),
  @cid       varchar(100)    )
as
begin
  if @prc='I'
    INSERT INTO CDA100
           (sys,menu,menu_name,frm,yn_hide,yn_use,yn_delete,memo,
            cid,cdt,mid,mdt)
    VALUES (@sys,@menu,@menu_name,@frm,isnull(@yn_hide,'0'),isnull(@yn_use,'1'),isnull(@yn_delete,'0'),@memo,
            @cid,getdate(),@cid,getdate())
  
  if @prc='U'
		UPDATE CDA100
       SET sys       = @sys      ,
           menu      = @menu     ,
           menu_name = @menu_name,
           frm       = @frm      ,
           yn_hide   = isnull(@yn_hide,'0')  ,
           yn_use    = isnull(@yn_use,'1')   ,
           yn_delete = isnull(@yn_delete,'0'),
           memo      = @memo     ,
           mid       = @cid      ,
           mdt       = getdate()
     WHERE pid = @pid;
  
  if @prc='D'
		UPDATE CDA100
       SET yn_delete = '1',
           mid       = @cid      ,
           mdt       = getdate()
     WHERE pid = @pid;
end
