CREATE PROCEDURE [dbo].[sp_xxx]  (@id1 varchar(20), @id2 varchar(20), @id3 varchar(20))
as
begin
  declare @msg varchar(200)
  set @msg = 'aaaaaaa ' + @id1

--  RAISERROR(@msg, 16, 1)
  SELECT * FROM SYS100;
end
