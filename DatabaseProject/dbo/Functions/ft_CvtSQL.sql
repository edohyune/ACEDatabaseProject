CREATE function ft_CvtSQL (@delimiter NVARCHAR(1), @usql NVARCHAR(MAX))
  returns @results table (
    item NVARCHAR(MAX)
)
as
begin

  SET @usql=substring(@usql, CHARINDEX(@delimiter, @usql), len(@usql))
  SET @usql=replace(@usql,',','')
  


  DECLARE @item NVARCHAR(MAX)
  DECLARE @idx INT
  
  
  
  WHILE LEN(@usql) > 0
  BEGIN
    SET @idx = PATINDEX('%' + @delimiter + '%', @usql)
      
    IF @idx > 0
      BEGIN
        SET @item = SUBSTRING(@usql, 0, @idx)
        SET @usql = SUBSTRING(@usql, LEN(@item + @delimiter) + 1, LEN(@usql))
      END
    ELSE
      BEGIN
        SET @item = @usql
        SET @usql = NULL
      END
  
    INSERT INTO @results ( item ) VALUES ( @item )
  END
  


   
  return
end
