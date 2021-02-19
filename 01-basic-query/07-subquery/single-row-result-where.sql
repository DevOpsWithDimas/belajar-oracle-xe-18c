select emp1.EMPLOYEE_ID,
       emp1.FIRST_NAME,
       emp1.SALARY,
       emp1.JOB_ID,
       (select job.JOB_TITLE from JOBS job where emp1.JOB_ID = job.JOB_ID) as job_title
from EMPLOYEES emp1
where SALARY >= (select avg(emp2.SALARY)
                 from EMPLOYEES emp2
                 where emp1.JOB_ID = emp2.JOB_ID);

select job_id,avg(emp2.SALARY)
from EMPLOYEES emp2
group by job_id;
