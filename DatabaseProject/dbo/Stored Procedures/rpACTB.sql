CREATE procedure [dbo].[rpACTB] (@company varchar(10), @yymm varchar(10))
As
Begin
  -- declare @yymm varchar(20)='2019-07'

-- 
  -- Summary TB
-- 
--  delete aca200
--   where company=@company
--     and ymd like @yymm+'%'
-- 
--  insert into aca200 (company, plant, ymd, acc, bankacc, dr, cr)
--  select company, plant, ymd, acc, bankacc, dr=sum(dr), cr=sum(cr)
--    from (
--          select company, plant, ymd=isnull(cfm_date,slip_date), acc, bankacc=isnull(bankacc,'*'), dr=isnull(dr,0), cr=isnull(cr,0)
--            from aca100
--           where company=@company
--             and isnull(cfm_date,slip_date) like @yymm+'%'
--         ) a
--   group by company, plant, ymd, acc, bankacc

  delete aca200

  insert into aca200 (company, plant, ymd, acc, bankacc, dr, cr)
  select company, plant, ymd, acc, bankacc, dr=sum(dr), cr=sum(cr)
    from (
          select company, plant, ymd=isnull(cfm_date,slip_date), acc, bankacc=isnull(bankacc,'*'), dr=isnull(dr,0), cr=isnull(cr,0)
            from aca100
           where cfm_date is not null
         ) a
   group by company, plant, ymd, acc, bankacc
END;
