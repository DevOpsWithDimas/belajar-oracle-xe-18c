select employee_id,
       first_name,
       department_id,
       salary
from employees
where NOT (department_id = 90);


select employee_id,
       first_name,
       department_id,
       salary
from employees
where FIRST_NAME not like '_a%';


select employee_id,
       first_name,
       department_id,
       salary
from employees
where SALARY not between 4000 and 12000;


select employee_id,
       first_name,
       COMMISSION_PCT,
       salary
from employees
where COMMISSION_PCT is not null;

select employee_id,
       first_name,
       department_id,
       salary
from employees
where DEPARTMENT_ID not in (90, 50, 80, 60);


select EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
from EMPLOYEES emp
where not exists(
        select 1
        from DEPARTMENTS dep
        where emp.DEPARTMENT_ID = dep.DEPARTMENT_ID
    );
