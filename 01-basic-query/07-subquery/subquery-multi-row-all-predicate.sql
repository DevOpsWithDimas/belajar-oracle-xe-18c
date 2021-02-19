select emp.EMPLOYEE_ID as id, emp.FIRST_NAME as name, emp.SALARY, emp.JOB_ID job
from EMPLOYEES emp
where SALARY < ALL (
    select distinct SALARY
    from EMPLOYEES
    where DEPARTMENT_ID = 30
)
order by SALARY;


select emp.EMPLOYEE_ID as id, emp.FIRST_NAME as name, emp.SALARY, emp.JOB_ID job
from EMPLOYEES emp
where SALARY > ALL (
    select distinct SALARY
    from EMPLOYEES
    where DEPARTMENT_ID = 30
)
order by SALARY;
