-- sama dengan in predicates
select emp1.EMPLOYEE_ID, emp1.FIRST_NAME, emp1.SALARY, emp1.MANAGER_ID
from EMPLOYEES emp1
where emp1.SALARY = any (
    select round(avg(j.max_salary)) as gaji_rata
    from jobs j
    group by j.job_id
    having avg(j.max_salary) < 20000
)
order by emp1.SALARY;

select emp1.EMPLOYEE_ID, emp1.FIRST_NAME, emp1.SALARY, emp1.MANAGER_ID
from EMPLOYEES emp1
where emp1.SALARY < any (
    select round(avg(j.max_salary)) as gaji_rata
    from jobs j
    group by j.job_id
    having avg(j.max_salary) < 20000
)
order by emp1.SALARY;

select emp.EMPLOYEE_ID as id, emp.FIRST_NAME as name, emp.SALARY, emp.JOB_ID job
from EMPLOYEES emp
where SALARY > any (
    select round(avg(j.max_salary))
    from jobs j
    group by j.job_id
    having avg(j.max_salary) < 20000
)
order by SALARY;
