select DEPARTMENT_ID, JOB_ID, count(*) as jumlah_empl, sum(SALARY) total_gaji
from EMPLOYEES
group by DEPARTMENT_ID, JOB_ID
having sum(SALARY) >= 2000;


select DEPARTMENT_ID, JOB_ID, count(*) as jumlah_empl, sum(SALARY) total_gaji
from EMPLOYEES
where JOB_ID in ('FI_MGR', 'AC_MGR', 'IT_PROG')
group by DEPARTMENT_ID, JOB_ID
having sum(SALARY) >= 20000;
