CREATE FUNCTION [dbo].[fc_userName] (@id varchar(20)) returns varchar(400)
as
begin
  declare @userName varchar(200)
  
  select @userName=user_name
    from CDA200
   where id=@id
   
  return isnull(@userName,@id)
  
--  select pwd, pwd_yn, pwd_date, user_name, user_type, staff, language, company, plant, dept, sys, 
--         deleted, expire_date, memo
--  from sys200
--  where id='admin'
end
