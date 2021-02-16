select location.LOCATION_ID,
       location.STREET_ADDRESS,
       location.POSTAL_CODE,
       location.CITY,
       location.STATE_PROVINCE,
       location.COUNTRY_ID,
       country.COUNTRY_NAME
from LOCATIONS location
         join COUNTRIES country on location.COUNTRY_ID = country.COUNTRY_ID

select d.department_id                   as dep_id,
       d.department_name                 as dep_name,
       nvl2(
               to_char(d.MANAGER_ID),
               e.FIRST_NAME || ' ' || e.LAST_NAME,
               'Tidak Memiliki Manager') as empl_name
from employees e
         inner join departments d on (d.MANAGER_ID = e.EMPLOYEE_ID)
order by dep_id;
