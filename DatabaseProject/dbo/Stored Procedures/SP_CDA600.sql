CREATE PROCEDURE [dbo].[SP_CDA600]  (
  @prc            varchar(20),
  @pid            varchar(20),
  @cust           varchar(20),
  @cust_name      varchar(200),
  @full_name      varchar(200),
  @local_name     varchar(200),
  @cust_kind      varchar(20),
  @cust_class     varchar(20),
  @tax_no         varchar(40),
  @country        varchar(20),
  @province       varchar(20),
  @district       varchar(20),
  @zip            varchar(20),
  @address1       varchar(400),
  @address2       varchar(400),
  @chief_id       varchar(20),
  @chief_name     varchar(400),
  @tel            varchar(40),
  @mobile         varchar(40),
  @fax            varchar(40),
  @date_create    varchar(20),
  @date_start     varchar(20),
  @date_end       varchar(20),
  @status         varchar(20),
  @charge_emp     varchar(20),
  @cust_group     varchar(20),
  @cust_invoice   varchar(20),
  @ship_to        varchar(20),
  @basic_curr     varchar(20),
  @bank           varchar(20),
  @bank_account   varchar(40),
  @credit_days    varchar(20),
  @credit_amount  varchar(20),
  @deleted        varchar(20),
  @cid            varchar(40))
as
begin
--  declare @dio_weight decimal(22,3) = 0 --convert(decimal(22,3),isnull(@inout_weight,0))
--  declare @dpack_weight decimal(22,3) = 0 --convert(decimal(22,3),isnull(@packing_weight,0))
--  declare @dqty decimal(22,3) = convert(decimal(22,3),isnull(@packing_qty,0))
--  declare @dprice decimal(22,3) = convert(decimal(22,3),isnull(@unit_price,0))
  if @prc='I'
    INSERT INTO CDA600
        (cust,cust_name,full_name,local_name,cust_kind,cust_class,tax_no,country,province,district,
         zip,address1,address2,chief_id,chief_name,tel,mobile,fax,-- date_create,date_start,date_end,
         status,charge_emp,
         cust_group,cust_invoice,ship_to,
         basic_curr,bank,bank_account,credit_days,credit_amount,deleted,
         cid,cdt,mid,mdt)
    VALUES
        (@cust,@cust_name,@full_name,@local_name,@cust_kind,@cust_class,@tax_no,@country,@province,@district,
         @zip,@address1,@address2,@chief_id,@chief_name,@tel,@mobile,@fax,-- @date_create,@date_start,@date_end,
         @status,@charge_emp,
         @cust_group,@cust_invoice,@ship_to,
         @basic_curr,@bank,@bank_account,@credit_days,@credit_amount,isnull(@deleted,'0'),
         @cid,getdate(),@cid,getdate())
  
  if @prc='U'
    UPDATE CDA600
       SET  -- cust          = @cust         ,
            cust_name     = @cust_name    ,
            full_name     = @full_name    ,
            local_name    = @local_name   ,
            cust_kind     = @cust_kind    ,
            cust_class    = @cust_class   ,
            tax_no        = @tax_no       ,
            country       = @country      ,
            province      = @province     ,
            district      = @district     ,
            zip           = @zip          ,
            address1      = @address1     ,
            address2      = @address2     ,
            chief_id      = @chief_id     ,
            chief_name    = @chief_name   ,
            tel           = @tel          ,
            mobile        = @mobile       ,
            fax           = @fax          ,
--            date_create   = @date_create  ,
--            date_start    = @date_start   ,
--            date_end      = @date_end     ,
            status        = @status       ,
            charge_emp    = @charge_emp   ,
            cust_group    = @cust_group   ,
            cust_invoice  = @cust_invoice ,
            ship_to       = @ship_to      ,
            basic_curr    = @basic_curr   ,
            bank          = @bank         ,
            bank_account  = @bank_account ,
            credit_days   = @credit_days  ,
            credit_amount = @credit_amount,
            deleted       = isnull(@deleted,'0'),
            mid           = @cid,
            mdt           = getdate()          
      WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDA600
       SET deleted = '1'
     WHERE pid = @pid;
end
;
