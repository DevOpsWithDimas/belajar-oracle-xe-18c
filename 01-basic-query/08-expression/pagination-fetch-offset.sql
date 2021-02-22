select *
from EMPLOYEES
order by EMPLOYEE_ID
    fetch FIRST 10 ROWS ONLY ;


select *
from EMPLOYEES
order by EMPLOYEE_ID
    fetch FIRST 10 percent ROWS ONLY ;


select *
from EMPLOYEES
order by EMPLOYEE_ID
    fetch next 10 ROWS ONLY ;


select *
from EMPLOYEES
order by EMPLOYEE_ID
    offset 100 rows ;

select EMPLOYEE_ID, FIRST_NAME, SALARY
from EMPLOYEES
order by EMPLOYEE_ID
offset :offset rows fetch next :limit rows only;
