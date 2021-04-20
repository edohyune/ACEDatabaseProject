CREATE procedure [dbo].[rpIOAcc] (@company varchar(10), @smm varchar(10), @sty varchar(10))
As
Begin
  declare @yymm varchar(10)
  declare @ii int = 0

  declare curA cursor for
  select top 10000000 yymm
    from (
          select yymm=dbo.fcDate2Str(dateadd(month,mm,@smm+'-01'),'tm')
            from (
                  select mm=row_number() over (partition by 1 order by code) - 1
                    from cda300
                 ) a
         ) a
   where yymm<=dbo.fcDate2Str(getdate(),'tm')
   order by yymm

  open curA
  -- SELECT @@CURSOR_ROWS

  while @ii<=@@CURSOR_ROWS
  begin
    fetch next from curA into @yymm

    if @sty='AB' or @sty='ALL'
      exec dbo.rpACBalance @company,@yymm

    if @sty='AT' or @sty='ALL'
      exec dbo.rpACTB @company,@yymm

    set @ii = @ii + 1
  end

  close curA
  deallocate curA
End
