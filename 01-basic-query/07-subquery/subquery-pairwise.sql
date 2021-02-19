select EMPLOYEE_ID, FIRST_NAME, SALARY, MANAGER_ID, JOB_ID
from EMPLOYEES empl1
where (empl1.MANAGER_ID, empl1.JOB_ID) in (
    select distinct empl2.MANAGER_ID, empl2.JOB_ID
    from EMPLOYEES empl2
    where empl2.SALARY >= 5000
)
