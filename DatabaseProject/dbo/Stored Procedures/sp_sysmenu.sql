CREATE PROCEDURE [dbo].[sp_sysmenu]  (@id varchar(20))
as
-- 
-- Menu
-- 
select c1=left(menu,3),
       c2=substring(menu,5,3),
       c3=substring(menu,9,3),
       c4=substring(menu,13,3),
       lvl=(case len(menu) when 3 then 1
                           when 7 then 2
                           when 11 then 3
                           when 15 then 4
                           when 19 then 5 else 6 end),
       menu, menu_name, frm=isnull(frm,'*'),
       ynUse=yn_Use, aquery='1', ainsert='1', adelete='1', asave='1', aprint='1', aexport='1'
  into #tmpMenu
  from CDA100
 where yn_Delete='0'
   and yn_Hide='0'
--   and yn_Use='1'
--   and yn_sys=(case when @id='ERP' then '1' else '0' end)
--   and id=@id
-- 
-- Menu Level for Navigator
-- 
select *
  from #tmpMenu a
 order by a.menu
-- 
-- Menu Level for Tree View
-- 
-- select ix1=isnull(b.ix1,'0'), ix2=isnull(c.ix2,'0'), ix3=isnull(d.ix3,'0'), ix4=isnull(e.ix4,'0'), a.*
--  from #tmpMenu a
--  left join (select ix1=row_number() over (partition by lvl      order by menu)-1, c1,          menu from #tmpMenu where lvl=1) b on b.c1=a.c1
--  left join (select ix2=row_number() over (partition by c1       order by menu),   c1,c2,       menu from #tmpMenu where lvl=2) c on c.c1=a.c1 and c.c2=a.c2
--  left join (select ix3=row_number() over (partition by c1,c2    order by menu),   c1,c2,c3,    menu from #tmpMenu where lvl=3) d on d.c1=a.c1 and d.c2=a.c2 and d.c3=a.c3
--  left join (select ix4=row_number() over (partition by c1,c2,c3 order by menu),   c1,c2,c3,c4, menu from #tmpMenu where lvl=4) e on e.c1=a.c1 and e.c2=a.c2 and e.c3=a.c3 and e.c4=a.c4
-- -- where a.menu < '700'
-- order by a.menu
;
