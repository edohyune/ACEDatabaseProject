create PROCEDURE [dbo].[SP_MMA100]  (
  @prc            varchar(20),
  @pid            varchar(20),
  @company        varchar(20),
  @por_no         varchar(20),
  @por_date       date,
  @req_id         varchar(20),
  @seq            varchar(20),
  @matl           varchar(20),
  @qty            int,
  @qty_box        int,
  @plant          varchar(20),
  @delivery_place varchar(20),
  @delivery_time  varchar(20),
  @delivery_date  date,
  @memo           varchar(max),
  @status         varchar(1),
  @po_no          varchar(20),
  @cid            varchar(20),
  @cdt            date,
  @mid            varchar(20),
  @mdt            date)
as
begin
  exec putMessage 'EE'

end
;