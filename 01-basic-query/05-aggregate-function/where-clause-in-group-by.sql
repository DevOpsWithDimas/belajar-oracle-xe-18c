
select DEPARTMENT_ID, JOB_ID, sum(SALARY) as total_gaji, count(*) as jumlah_empl
from EMPLOYEES
where SALARY between 1000 and 20000
group by DEPARTMENT_ID, JOB_ID;
