-- karyawan yang memiliki bawahan
select empl1.EMPLOYEE_ID, empl1.FIRST_NAME, empl1.SALARY
from EMPLOYEES empl1
where exists(
              select 1
              from EMPLOYEES empl2
              where empl2.MANAGER_ID = empl1.EMPLOYEE_ID
          );

-- karywan yang tidak memiliki bawahan
select empl1.EMPLOYEE_ID, empl1.FIRST_NAME, empl1.SALARY
from EMPLOYEES empl1
where not exists(
              select 1
              from EMPLOYEES empl2
              where empl2.MANAGER_ID = empl1.EMPLOYEE_ID
          );
