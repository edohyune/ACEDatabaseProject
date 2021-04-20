create procedure sp_table_comment
  @tbl varchar(50),
  @memo varchar(250)
as
if exists (
            select 1
              from (        
                    SELECT objtype, objname, name, value  
                      FROM ::fn_listextendedproperty (NULL, 'schema', 'dbo', 'table', default, default, default)
                   ) a
             where objname='sys100'
          )
  EXEC sp_updateextendedproperty 
      @name=N'ms_description',
      @value=@memo,
      @level0type=N'Schema',
      @level0name=N'dbo',
      @level1type=N'Table',
      @level1name=@tbl
else
  EXEC sp_addextendedproperty 
      @name=N'ms_description',
      @value=@memo,
      @level0type=N'Schema',
      @level0name=N'dbo',
      @level1type=N'Table',
      @level1name=@tbl;