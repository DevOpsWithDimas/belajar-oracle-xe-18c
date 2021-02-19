select emp.EMPLOYEE_ID,
       emp.FIRST_NAME,
       emp.SALARY                       as employee_salary,
       (select j1.JOB_TITLE
        from jobs j1
        where emp.JOB_ID = j1.JOB_ID)   as job_title,
       (select j2.MIN_SALARY
        from jobs j2
        where j2.JOB_ID = emp.JOB_ID)   as min_salary_by_job,
       (select min(emp.SALARY)
        from EMPLOYEES emp1
        where emp.JOB_ID = emp1.JOB_ID) as min_salary_by_emp
from EMPLOYEES emp
where SALARY >= 12000;

-- ORA-01427: single-row subquery returns more than one row
-- select emp.EMPLOYEE_ID,
--        emp.FIRST_NAME,
--        emp.SALARY                       as employee_salary,
--        (select j1.JOB_TITLE
--         from jobs j1)   as job_title
-- from EMPLOYEES emp
-- where SALARY >= 12000;

-- ORA-00913: too many values
-- select emp.EMPLOYEE_ID,
--        emp.FIRST_NAME,
--        emp.SALARY                       as employee_salary,
--        (select j1.JOB_TITLE, j1.MIN_SALARY
--         from jobs j1
--            where j1.JOB_ID = emp.JOB_ID)   as job_title
-- from EMPLOYEES emp
-- where SALARY >= 12000;
