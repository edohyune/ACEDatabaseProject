CREATE PROCEDURE [dbo].[SP_CDA300]  (
  @prc            varchar(20),
  @pid            varchar(20),
	@gcode          varchar(20),
	@code           varchar(20),
	@code_name      varchar(200),
	@ds01           varchar(40),
	@ds02           varchar(40),
	@ds03           varchar(40),
	@ds04           varchar(40),
	@ds05           varchar(40),
	@ds06           varchar(40),
	@ds07           varchar(40),
	@ds08           varchar(40),
	@ds09           varchar(40),
	@ds10           varchar(40),
	@deleted        varchar(1),
	@memo           varchar(200),
	@cid            varchar(20))
as
begin
  if @prc='I'
		INSERT INTO CDA300
				(gcode,code,code_name,ds01,ds02,ds03,ds04,ds05,ds06,ds07,ds08,ds09,ds10,deleted,memo,cid,cdt,mid,mdt,bcode)
    VALUES
				(@gcode,@code,@code_name,@ds01,@ds02,@ds03,@ds04,@ds05,@ds06,@ds07,@ds08,@ds09,@ds10,
				 isnull(@deleted,'0'),@memo,@cid,getdate(),@cid,getdate(),@gcode+@code)
  
  if @prc='U'
    UPDATE CDA300
       SET  gcode     = @gcode,
						code      = @code,
						code_name = @code_name,
						ds01      = @ds01,
						ds02      = @ds02,
						ds03      = @ds03,
						ds04      = @ds04,
						ds05      = @ds05,
						ds06      = @ds06,
						ds07      = @ds07,
						ds08      = @ds08,
						ds09      = @ds09,
						ds10      = @ds10,
						deleted   = isnull(@deleted,'0'),
						memo      = @memo,
						mid       = @cid,
						mdt       = getdate(),
						bcode     = @gcode+@code
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDA300
       SET deleted = '1'
     WHERE pid = @pid;
end
;
