select empl.EMPLOYEE_ID,
       empl.FIRST_NAME,
       (select max(MAX_SALARY) from jobs) max_salary,
       SALARY as                          empl_salary
from EMPLOYEES empl


select empl.EMPLOYEE_ID,
       empl.FIRST_NAME,
       (select max(MAX_SALARY) from jobs where empl.JOB_ID = jobs.JOB_ID) max_salary,
       SALARY as                                                          empl_salary
from EMPLOYEES empl
where SALARY < (select max(MAX_SALARY) from jobs where empl.JOB_ID = jobs.JOB_ID)
