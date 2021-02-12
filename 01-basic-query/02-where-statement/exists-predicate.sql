select EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
from EMPLOYEES emp
where exists(
              select 1
              from DEPARTMENTS dep
              where dep.DEPARTMENT_ID = emp.DEPARTMENT_ID
          );
