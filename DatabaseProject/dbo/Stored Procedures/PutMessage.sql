CREATE PROCEDURE [dbo].[PutMessage]  (@msg varchar(400))
as
begin
  RAISERROR(@msg, 16, 1)
end
