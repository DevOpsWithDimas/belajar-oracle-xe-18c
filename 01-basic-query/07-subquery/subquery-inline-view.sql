select ROWNUM as rank, job_id, total_salary
from (select empl.JOB_ID job_id, sum(empl.SALARY) total_salary
      from EMPLOYEES empl
      group by empl.JOB_ID
      having avg(empl.SALARY) >= 12000
      order by total_salary desc
     )
where ROWNUM <= 5
order by rank;


select empl.EMPLOYEE_ID, empl.FIRST_NAME, empl.SALARY, empl1.avg_salary, empl.JOB_ID
from EMPLOYEES empl,
     (select JOB_ID as job_id, avg(SALARY) as avg_salary
      from EMPLOYEES
      group by JOB_ID) empl1
where empl.JOB_ID = empl1.job_id
  and empl.DEPARTMENT_ID in (30, 90);
