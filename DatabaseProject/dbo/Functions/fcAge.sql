CREATE function [dbo].[fcAge] (@dt_chick date, @dt date)
    returns int
as
begin
    declare @age int

--    select @age=age
--      from ftAge(@dt_chick,@dt)
--     where ymd=@dt

    return @age;
end
