select EMPLOYEE_ID, FIRST_NAME, SALARY
from EMPLOYEES
where SALARY between 4000 and 6000;

select EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
from EMPLOYEES
where HIRE_DATE between date '2008-01-01' and date '2008-12-31';

select employee_id,
       first_name,
       substr(FIRST_NAME, 2, 1) as first_char_at_first_name,
       salary,
       HIRE_DATE,
       department_id
from employees
where substr(FIRST_NAME, 2, 1) between 'a' and 'i';
