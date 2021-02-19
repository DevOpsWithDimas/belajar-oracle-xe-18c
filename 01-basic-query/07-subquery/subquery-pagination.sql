select EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
from (
         select row_number() over (order by ROWNUM) as no,
                empl.*
         from EMPLOYEES empl
         order by EMPLOYEE_ID
     )
where no between (:start + 1) and (:page * :limit);
