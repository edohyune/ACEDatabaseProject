CREATE PROCEDURE [dbo].[SP_CDA330]  (
  @prc            varchar(20),
	@pid						varchar(20),
	@deleted				varchar(1),
  @prod           varchar(20),
  @prod_name      varchar(80),
  @goods          varchar(20),
  @goods_type     varchar(20),
  @sex            varchar(1),
  @grade          varchar(10),
  @unit           varchar(10),
  @cl_price       varchar(20),
  @inout_weight   varchar(40),
  @packing_unit   varchar(40),
  @packing_qty    varchar(40),
  @packing_weight varchar(40),
  @unit_price     varchar(40),
  @cl_goods       varchar(40),
  @cost           varchar(40),
  @accDR          varchar(40),
  @accCR          varchar(40),
  @memo           varchar(400),
  @cid            varchar(40))
as
begin
  declare @dio_weight decimal(22,3) = 0 -- convert(decimal(22,3),isnull(@inout_weight,0))
  declare @dpack_weight decimal(22,3) = 0 -- convert(decimal(22,3),isnull(@packing_weight,0))
  declare @dqty decimal(22,3) = convert(decimal(22,3),isnull(@packing_qty,0))
  declare @dprice decimal(22,3) = convert(decimal(22,3),isnull(@unit_price,0))
  
  if @prc='I'
    INSERT INTO CDA500
				(deleted,prod,prod_name,goods,goods_type,sex,grade,unit,cl_price,
         inout_weight,packing_unit,packing_qty,packing_weight,unit_price,
         cl_goods,cost,accDR,accCR,cid,cdt,mid,mdt,memo)
    VALUES
				(isnull(@deleted,'0'),@prod,@prod_name,@goods,@goods_type, @sex,@grade,@unit,@cl_price,
         @dio_weight,@packing_unit,@dqty,@dpack_weight,@dprice,
         @cl_goods,@cost,@accDR,@accCR,@cid,getdate(),@cid,getdate(),@memo)
  
  if @prc='U'
    UPDATE CDA500
       SET  deleted				 = isnull(@deleted,'0'),
            prod           = @prod           ,
            prod_name      = @prod_name      ,
            goods          = @goods          ,
            goods_type     = @goods_type,
            sex            = @sex            ,
            grade          = @grade          ,
            unit           = @unit           ,
            cl_price       = @cl_price       ,
            inout_weight   = @dio_weight,
            packing_unit   = @packing_unit   ,
            packing_qty    = @dqty,
            packing_weight = @dpack_weight,
            unit_price     = @dprice,
            cl_goods       = @cl_goods       ,
            cost           = @cost           ,
            accDR          = @accDR          ,
            accCR          = @accCR          ,
            mid            = @cid            ,
            mdt            = getdate(),
            memo           = @memo           
     WHERE pid = @pid;
	
  if @prc='D'
    UPDATE CDA500
       SET deleted = '1'
     WHERE pid = @pid;
end
;
