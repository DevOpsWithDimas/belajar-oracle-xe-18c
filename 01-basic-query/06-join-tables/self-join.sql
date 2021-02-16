select emp.EMPLOYEE_ID,
       emp.FIRST_NAME,
       man.EMPLOYEE_ID,
       man.FIRST_NAME
from EMPLOYEES emp
         full join EMPLOYEES man on (emp.MANAGER_ID = man.EMPLOYEE_ID)
