CREATE PROCEDURE [dbo].[SP_CDA200]  (
  @prc            varchar(20),
  @pid            varchar(20),
  @id             varchar(20),
  @pwd            varchar(20),
  @pwd_yn         varchar(1),
  @pwd_date       varchar(40),
  @user_name      varchar(200),
  @user_type      varchar(20),
  @staff          varchar(20),
  @language       varchar(20),
  @company        varchar(20),
  @plant          varchar(20),
  @dept           varchar(20),
  @sys            varchar(20),
  @deleted        varchar(1),
  @expire_date    varchar(40),
  @memo           varchar(400),
  @cid            varchar(20),
  @bulletin_edate varchar(40),
  @frm_init       varchar(20),
  @skin           varchar(20))
as 
begin
  if @prc='I'
		INSERT INTO CDA200
				(id,pwd,pwd_yn,pwd_date,user_name,user_type,staff,language,
				 company,plant,dept,sys,deleted,expire_date,memo,cid,cdt,mid,mdt,
				 bulletin_edate,frm_init,skin)
    VALUES
				(@id,@pwd,@pwd_yn,@pwd_date,@user_name,@user_type,@staff,@language,
				 @company,@plant,@dept,@sys,isnull(@deleted,'0'),@expire_date,@memo,@cid,getdate(),@cid,getdate(),
				 @bulletin_edate,@frm_init,@skin)
  
  if @prc='U'
    UPDATE CDA200
       SET  id             = @id            ,
						pwd            = @pwd           ,
						pwd_yn         = @pwd_yn        ,
						pwd_date       = convert(date,left(@pwd_date,10)),
						user_name      = @user_name     ,
						user_type      = @user_type     ,
						staff          = @staff         ,
						language       = @language      ,
						company        = @company       ,
						plant          = @plant         ,
						dept           = @dept          ,
						sys            = @sys           ,
						deleted        = isnull(@deleted,'0'),
						expire_date    = convert(date,left(@expire_date,10)),
						memo           = @memo          ,
						mid            = @cid           ,
						mdt            = getdate(),
						bulletin_edate = convert(date,left(@bulletin_edate,10)),
						frm_init       = @frm_init,
						skin           = @skin
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDA200
       SET deleted = @deleted,
 					 mid     = @cid,
				 	 mdt     = getdate()
     WHERE pid = @pid;
end
;
