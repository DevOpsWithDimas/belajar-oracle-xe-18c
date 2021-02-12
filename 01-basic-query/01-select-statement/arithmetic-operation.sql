select (2 + 2) as tambah,
       (2 - 2) as kurang,
       (2 * 2) as kali,
       (2 / 2) as bagi
from dual;

select EMPLOYEE_ID,
       FIRST_NAME,
       SALARY                  as "gaji sebulan",
       SALARY * 12             as "gaji setahun",
       COMMISSION_PCT          as "komisi dlm persen",
       SALARY * COMMISSION_PCT as "jumlah komisi"
from EMPLOYEES;

select current_date                          as hari_ini,
       current_date - 2                      as lusa,
       current_date + 1                      as besok,
       date '2017-03-30' - date '2017-03-15' as jumlah_hari
from DUAL;

/*
 select current_date + date '2021-01-01' as besok
 from DUAL;
*/
