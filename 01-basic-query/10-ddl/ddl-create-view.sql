create or replace view v_employee_on_dep90 as
select empl.EMPLOYEE_ID,
       empl.FIRST_NAME,
       empl.LAST_NAME,
       empl.email,
       empl.phone_number,
       empl.hire_date,
       empl.salary,
       coalesce(empl.commission_pct, 0) commission,
       empl.manager_id,
       job.job_id,
       job.job_title,
       job.min_salary as                job_min_salary,
       job.max_salary as                job_max_salary
from EMPLOYEES empl
         left join JOBS job on empl.JOB_ID = job.JOB_ID
where empl.DEPARTMENT_ID = 90;

select *
from USER_VIEWS;

select EMPLOYEE_ID, salary * commission as komisi
from v_employee_on_dep90;

update v_employee_on_dep90
set commission = 0.1
where EMPLOYEE_ID = 100;

create or replace view v_simple_empl_on_dep90 as
select *
from EMPLOYEES
where DEPARTMENT_ID = 90
with read only constraint ro_simple_empl_dep90;

update v_simple_empl_on_dep90
set commission_pct = null
where EMPLOYEE_ID = 100;

select *
from EMPLOYEES
where EMPLOYEE_ID = 100;

drop view v_employee_on_dep90 CASCADE CONSTRAINTS;

select * from RECYCLEBIN;
