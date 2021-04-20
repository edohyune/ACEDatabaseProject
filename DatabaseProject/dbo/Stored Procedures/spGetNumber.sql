create procedure [dbo].[spGetNumber] (@company varchar(20), @plant varchar(20), @cd varchar(20), @dt date)
As 
Begin
  declare @maxNo int

  -- set @company='10'
  
  select @maxNo=pno+1
    from cdc900
   where company=@company
     and plant=@plant
     and sys=@cd
     and pdate=@dt
  -- --------------------------------------
  -- Editing Number
  -- --------------------------------------
	if @maxNo is null
    begin
      insert into cdc900
      values (@company, @plant, @cd, @dt, 1)
      
  	  select @maxNo = 1
    end
  else
    begin
      update cdc900
         set pno=@maxNo
       where company=@company
         and plant=@plant
         and sys=@cd
         and pdate=@dt
    end;

  select codeNo = convert(varchar(8),@dt,112) + @cd + right('0000000' + convert(nvarchar(30), convert(int,isnull(@maxNo,0)) ) ,4)
End
