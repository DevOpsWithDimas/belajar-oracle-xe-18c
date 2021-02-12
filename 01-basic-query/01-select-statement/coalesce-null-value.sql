select EMPLOYEE_ID,
       COMMISSION_PCT,
       coalesce(COMMISSION_PCT, 0)          as coalesce_not_null,
       SALARY,
       SALARY * coalesce(COMMISSION_PCT, 0) as "jumlah_komisi",
       coalesce(MANAGER_ID, 0)
from EMPLOYEES;
