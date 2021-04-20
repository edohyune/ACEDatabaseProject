CREATE PROCEDURE [dbo].[SP_CDA310]  (
  @prc            varchar(20),
	@pid						varchar(20), 
	@matl           varchar(20), 
	@matl_name      varchar(200), 
	@matl_class     varchar(40),
	@matl_grade     varchar(40), 
	@matl_spec      varchar(40), 
	@unit           varchar(40), 
	@box_qty        varchar(40), 
	@price          varchar(40), 
	@spare_part     varchar(40), 
	@last_takein    varchar(40), 
	@memo           varchar(200), 
	@deleted        varchar(40), 
	@trading_item	  varchar(40))
as
begin
  if @prc='I'
    INSERT INTO CDA400
				(matl,matl_name,matl_class,matl_grade,matl_spec,unit,box_qty,price,
				 spare_part,last_takein,memo,deleted,trading_item)
    VALUES
				(@matl,@matl_name,@matl_class,@matl_grade,@matl_spec,@unit,@box_qty,@price,
				 isnull(@spare_part,'0'),@last_takein,@memo,isnull(@deleted,'0'),@trading_item)
  
  if @prc='U'
    UPDATE CDA400
       SET  matl         = @matl        ,
						matl_name    = @matl_name   ,
						matl_class   = @matl_class  ,
						matl_grade   = @matl_grade  ,
						matl_spec    = @matl_spec   ,
						unit         = @unit        ,
						box_qty      = isnull(@box_qty,1),
						price        = isnull(@price,0),
						spare_part   = isnull(@spare_part,'0'),
						memo         = @memo        ,
						deleted      = isnull(@deleted,'0'),
						trading_item = @trading_item
     WHERE pid = @pid;
	
  if @prc='D'
    DELETE CDA400
     WHERE pid = @pid;
end
;
