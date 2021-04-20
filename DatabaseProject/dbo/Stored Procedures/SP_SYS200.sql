CREATE PROCEDURE [dbo].[SP_SYS200]  (
  @prc                  varchar(20),
  @pid                  varchar(20),
  @sys                  varchar(20),
  @frm                  varchar(20),
  @wkset                varchar(20),
  @memo                 varchar(200),
  @wktype               varchar(20),
  @grid_name            varchar(200),
  @chkNew               varchar(1),
  @chkDelete            varchar(1),
  @chkUpdate            varchar(1),
  @chkUse               varchar(1),
  @chkShowFooter        varchar(1),
  @chkShowGroupPanel    varchar(1),
  @chkEditable          varchar(1),
  @chkOptionsFind       varchar(1),
  @chkColumnAutoWidth   varchar(1),
  @chkEvenRow           varchar(1))
as
begin
--  exec putMessage @frm
  
  if @prc='I'
    INSERT INTO SYS200
           (sys,frm,wkset,memo,wktype,grid_name,
            chkNew,chkDelete,chkUpdate,chkUse,
            chkShowFooter,chkShowGroupPanel,chkEditable,
            chkOptionsFind,chkColumnAutoWidth, chkEvenRow)
    VALUES (@sys,@frm,@wkset,@memo,@wktype,@grid_name,
            isnull(@chkNew,1),isnull(@chkDelete,1),isnull(@chkUpdate,1),isnull(@chkUse,1),
            isnull(@chkShowFooter,0),isnull(@chkShowGroupPanel,0),isnull(@chkEditable,1),
            isnull(@chkOptionsFind,0),isnull(@chkColumnAutoWidth,1),isnull(@chkEvenRow,1))
  
  if @prc='U'
    UPDATE SYS200
       SET sys                 = @sys,
           frm                 = @frm,
           wkset               = @wkset,
           memo                = @memo,
           wktype              = @wktype,
           grid_name           = @grid_name,
           chkNew              = isnull(@chkNew,1),
           chkDelete           = isnull(@chkDelete,1),
           chkUpdate           = isnull(@chkUpdate,1),
           chkUse              = isnull(@chkUse,1),
           chkShowFooter       = isnull(@chkShowFooter,0),
           chkShowGroupPanel   = isnull(@chkShowGroupPanel,0),
           chkEditable         = isnull(@chkEditable,1),
           chkOptionsFind      = isnull(@chkOptionsFind,0),
           chkColumnAutoWidth  = isnull(@chkColumnAutoWidth,1),
           chkEvenRow          = isnull(@chkEvenRow,1)
     WHERE pid = @pid;
  
  if @prc='D'
    DELETE SYS200
     WHERE pid = @pid;
end
;
