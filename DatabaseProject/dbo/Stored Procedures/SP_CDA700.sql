CREATE PROCEDURE [dbo].[SP_CDA700]  (
  @prc        varchar(20),
  @pid        varchar(20),
  @bank_acc	  varchar(40),
  @bank			  varchar(20),
  @bank_class	varchar(20),
  @depositor  varchar(200),
  @curr			  varchar(20),
  @closed	    varchar(1),
  @baseAcc		varchar(1),
  @acc		    varchar(20),
  @plant		  varchar(20),
  @remark		  varchar(200),
  @cid		    varchar(20))
as
begin
  if @prc='I'
    INSERT INTO CDA700
           (bank_acc, bank, bank_class, depositor, curr, closed, baseAcc, acc, plant, remark, cid, cdt, mid, mdt)
    VALUES (@bank_acc, @bank, @bank_class, @depositor, @curr, isnull(@closed,'0'), isnull(@baseAcc,'0'), @acc, @plant, @remark,
            @cid, getdate(), @cid, getdate())
  
  if @prc='U'
    UPDATE CDA700
       SET bank_acc   = @bank_acc,
           bank       = @bank,
           bank_class = @bank_class,
           depositor  = @depositor,
           curr       = @curr,
           closed     = isnull(@closed,'0'),
           baseAcc    = isnull(@baseAcc,'0'),
           acc        = @acc,
           plant      = @plant,
           remark     = @remark,
           mid        = @cid,
           mdt        = getdate()
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDA700
       SET closed = '1'
     WHERE pid = @pid;
end
;
