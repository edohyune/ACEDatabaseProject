CREATE PROCEDURE [dbo].[SP_CDA800]  (
  @prc        varchar(20),
  @pid        varchar(20),
  @dept	      varchar(10),
  @dept_name  varchar(40),
  @dept_type	varchar(20),
  @inDept     varchar(10),
  @memo			  varchar(200),
  @dept_head	varchar(200),
  @deleted		varchar(1),
  @plant		  varchar(20),
  @goods		  varchar(20),
  @lvl		    varchar(20),
  @cid		    varchar(20))
as
begin
  if @prc='I'
    INSERT INTO CDA800
           (dept,dept_name,dept_type,inDept,memo,dept_head,deleted,plant,goods,lvl,cid,cdt,mid,mdt)
    VALUES (@dept,@dept_name,@dept_type,@inDept,@memo,@dept_head,isnull(@deleted,'0'),@plant,@goods,@lvl,
            @cid, getdate(), @cid, getdate())
  
  if @prc='U'
    UPDATE CDA800
       SET dept       = @dept,
           dept_name  = @dept_name,
           dept_type  = @dept_type,
           inDept     = @inDept,
           memo       = @memo,
           dept_head  = @dept_head,
           deleted    = isnull(@deleted,'0'),
           plant      = @plant,
           goods      = @goods,
           lvl        = @lvl,
           mid        = @cid,
           mdt        = getdate()
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDA800
       SET deleted = '1'
     WHERE pid = @pid;
end
;
