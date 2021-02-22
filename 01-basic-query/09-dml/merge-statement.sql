merge into REGIONS rg
using (select :reg_id   as region_id,
              :reg_name as region_name
       from DUAL) du
on (rg.REGION_ID = du.region_id)
when matched then
    update
    set rg.REGION_NAME = du.region_name
    where rg.REGION_ID = du.region_id
when not matched then
    insert (REGION_ID, REGION_NAME)
    values (du.region_id, du.region_name);


select * from REGIONS;
