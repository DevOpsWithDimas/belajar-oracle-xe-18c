select DEPARTMENT_ID as dep_id,
       DEPARTMENT_NAME  dep_name,
       LOCATION_ID   as "Kode Lokasi"
from DEPARTMENTS;

select dep.DEPARTMENT_ID as dep_id,
       dep.DEPARTMENT_NAME as dep_name,
       dep.MANAGER_ID as man_id
from DEPARTMENTS dep;
