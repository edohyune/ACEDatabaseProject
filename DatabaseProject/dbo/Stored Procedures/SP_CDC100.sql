CREATE PROCEDURE [dbo].[SP_CDC100]  (
  @prc           varchar(20),
  @pid           varchar(20),
  @acc           varchar(20),
  @accEname      varchar(400),
  @accKname      varchar(400),
  @accXname      varchar(400),
  @yn_dc         varchar(1),
  @yn_keyin      varchar(1),
  @yn_budget     varchar(1),
  @yn_dept       varchar(1),
  @yn_vendor     varchar(1),
  @yn_staff      varchar(1),
  @yn_bank       varchar(1),
  @yn_costCenter varchar(1),
  @yn_balance    varchar(1),
  @yn_curr       varchar(1),
  @yn_date1      varchar(1),
  @yn_date2      varchar(1),
  @yn_qty        varchar(1),
  @yn_rate       varchar(1),
  @yn_amt        varchar(1),
  @yn_keyno      varchar(1),
  @lvl           varchar(3),
  @memo          varchar(400),
  @bs1           varchar(400),
  @bs2           varchar(400),
  @accType       varchar(200),
  @moc1          varchar(400),
  @moc2          varchar(400),
  @deleted       varchar(1),
  @chkAcc        varchar(200),
  @cid           varchar(40) )
as
begin
  if @prc='I'
    INSERT INTO CDC100
           (acc,accEname,accKname,accXname,yn_dc,yn_keyin,yn_budget,yn_dept,yn_vendor,yn_staff,yn_bank,
            yn_costCenter,yn_balance,yn_curr,yn_date1,yn_date2,yn_qty,yn_rate,yn_amt,yn_keyno,lvl,memo,
            bs1,bs2,accType,moc1,moc2,deleted,
            cid,cdt,mid,mdt,chkAcc)
    VALUES (@acc,@accEname,@accKname,@accXname,@yn_dc,
            isnull(@yn_keyin,'1'),isnull(@yn_budget,'0'),isnull(@yn_dept,'0'),isnull(@yn_vendor,'0'),
            isnull(@yn_staff,'0'),isnull(@yn_bank,'0'),isnull(@yn_costCenter,'0'),isnull(@yn_balance,'0'),
            isnull(@yn_curr,'0'),isnull(@yn_date1,'0'),isnull(@yn_date2,'0'),isnull(@yn_qty,'0'),
            isnull(@yn_rate,'0'),isnull(@yn_amt,'0'),isnull(@yn_keyno,'0'),
            @lvl,@memo,@bs1,@bs2,@accType,@moc1,@moc2,isnull(@deleted,'0'),
            @cid, getdate(), @cid, getdate(),@chkAcc)
  
  if @prc='U'
    UPDATE CDC100
       SET acc           = @acc          ,
            accEname      = @accEname     ,
            accKname      = @accKname     ,
            accXname      = @accXname     ,
            yn_dc         = @yn_dc        ,
            yn_keyin      = isnull(@yn_keyin,'1'),
            yn_budget     = isnull(@yn_budget,'0'),
            yn_dept       = isnull(@yn_dept,'0'),
            yn_vendor     = isnull(@yn_vendor,'0'),
            yn_staff      = isnull(@yn_staff,'0'),
            yn_bank       = isnull(@yn_bank,'0'),
            yn_costCenter = isnull(@yn_costCenter,'0'),
            yn_balance    = isnull(@yn_balance,'0'),
            yn_curr       = isnull(@yn_curr,'0'),
            yn_date1      = isnull(@yn_date1,'0'),
            yn_date2      = isnull(@yn_date2,'0'),
            yn_qty        = isnull(@yn_qty,'0'),
            yn_rate       = isnull(@yn_rate,'0'),
            yn_amt        = isnull(@yn_amt,'0'),
            yn_keyno      = isnull(@yn_keyno,'0'),
            lvl           = @lvl          ,
            memo          = @memo         ,
            bs1           = @bs1          ,
            bs2           = @bs2          ,
            accType       = @accType      ,
            moc1          = @moc1         ,
            moc2          = @moc2         ,
            deleted       = isnull(@deleted,'0'),
            mid        = @cid,
            mdt        = getdate(),
            chkAcc        = @chkAcc                   
     WHERE pid = @pid;
  
  if @prc='D'
    UPDATE CDC100
       SET deleted = '1'
     WHERE pid = @pid;
end
;
