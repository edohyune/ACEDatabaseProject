CREATE FUNCTION [dbo].[fc_deptName] (@company varchar(40), @dept varchar(40)) returns varchar(400)
as
begin
  declare @codeName varchar(200)
  
  select @codeName=code_name
    from CDA300
   where gcode='CD05'
     and code=@dept
     
--  select @codeName=(case @val when 0 then code_name
--                              when 1 then ds01
--                              when 2 then ds02
--                              when 3 then ds03
--                              when 4 then ds04
--                              when 5 then ds05
--                              when 6 then ds06
--                              when 7 then ds07
--                              when 8 then ds08
--                              when 9 then ds09
--                              when 10 then ds10
--                              when 99 then memo end)
--    from sys300
--   where bcode=@baseCode
  
  return isnull(@codeName,@dept)
end
;
