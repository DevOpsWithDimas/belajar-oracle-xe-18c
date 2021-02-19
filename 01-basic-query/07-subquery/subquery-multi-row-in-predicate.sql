select emp1.EMPLOYEE_ID, emp1.FIRST_NAME, emp1.SALARY, emp1.MANAGER_ID
from EMPLOYEES emp1
where emp1.SALARY in (
    select distinct min(emp2.SALARY) min_salary
    from EMPLOYEES emp2
    group by emp2.MANAGER_ID
)
order by emp1.SALARY desc;
