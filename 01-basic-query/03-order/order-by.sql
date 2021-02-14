select EMPLOYEE_ID, FIRST_NAME, SALARY
from EMPLOYEES
where DEPARTMENT_ID = 90
order by SALARY asc;

select EMPLOYEE_ID, FIRST_NAME, JOB_ID as job, SALARY gaji
from EMPLOYEES
order by job, gaji asc;
