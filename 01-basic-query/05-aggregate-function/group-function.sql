select sum(SALARY)
from EMPLOYEES
where DEPARTMENT_ID = 90;

select SALARY
from EMPLOYEES
where DEPARTMENT_ID = 90;

select round(avg(salary), 2)  as rata2_gaji,
--        count only unique value of job_id in employees
       count(distinct job_id) as jml_job_id_unique,
--        count all rows in employees
       count(*)               as count_all,
--        min & max => number type
       max(salary)            as max_salary,
       min(salary)            as min_salary,
--        min & max => date & time type
       max(HIRE_DATE)         as max_hire_date,
       min(HIRE_DATE)         as min_hire_date,
       sum(salary)            as sum_salary
from employees;

select distinct JOB_ID
from EMPLOYEES;

select HIRE_DATE
from EMPLOYEES;
