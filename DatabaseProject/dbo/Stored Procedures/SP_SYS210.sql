CREATE PROCEDURE [dbo].[SP_SYS210]  (
  @prc           varchar(20),
  @pid           varchar(20),
  @sys           varchar(20),
  @frm           varchar(20),
  @wkset         varchar(20),
  @seq           varchar(20),
  @field         varchar(20),
  @title         varchar(200),
  @field_type    varchar(20),
  @width         varchar(20),
  @visible       varchar(1),
  @necessary     varchar(1),
  @allowedit     varchar(1),
  @fixing        varchar(1),
  @groupping     varchar(1),
  @suppress      varchar(1),
  @band_title1   varchar(200),
  @band_title2   varchar(200),
  @Pop           varchar(200),
  @sum_type      varchar(200),
  @format_type   varchar(200),
  @align_text    varchar(1),
  @align_title   varchar(1),
  @default_value varchar(200),
  @backColor     varchar(80),
  @color         varchar(80))
as
begin
--  exec putMessage @frm
  
  if @prc='I'
    INSERT INTO SYS210
           (sys,frm,wkset,seq,field,title,field_type,width,
            visible,necessary,allowedit,fixing,groupping,suppress,
            band_title1,band_title2,Pop,sum_type,format_type,
            align_text,align_title,default_value,backColor,color)
    VALUES (@sys,@frm,@wkset,@seq,@field,@title,@field_type,isnull(@width,20),
            isnull(@visible,1),isnull(@necessary,1),isnull(@allowedit,1),isnull(@fixing,0),
            isnull(@groupping,0),isnull(@suppress,0),
            @band_title1,@band_title2,@Pop,@sum_type,isnull(@format_type,0),
            isnull(@align_text,1),isnull(@align_title,3),@default_value, @backColor, @color)
  
  if @prc='U'
    UPDATE SYS210
       SET sys           = @sys          ,
           frm           = @frm          ,
           wkset         = @wkset        ,
           seq           = @seq          ,
           field         = @field        ,
           title         = @title        ,
           field_type    = @field_type   ,
           width         = isnull(@width,20),
           visible       = isnull(@visible,1),
           necessary     = isnull(@necessary,0),
           allowedit     = isnull(@allowedit,1),
           fixing        = isnull(@fixing,0),
           groupping     = isnull(@groupping,0),
           suppress      = isnull(@suppress,0),
           band_title1   = @band_title1  ,
           band_title2   = @band_title2  ,
           Pop           = @Pop          ,
           sum_type      = @sum_type     ,
           format_type   = isnull(@format_type,0),
           align_text    = isnull(@align_text,1),
           align_title   = isnull(@align_title,3),
           default_value = @default_value,
           backColor     = @backColor,
           color         = @color
     WHERE pid = @pid;
  
  if @prc='D'
    DELETE SYS210
     WHERE pid = @pid;
end
;
