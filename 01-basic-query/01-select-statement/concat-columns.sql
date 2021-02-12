select EMPLOYEE_ID as id,
       FIRST_NAME || ' ' || LAST_NAME as full_name,
       EMAIL || ', ' || FIRST_NAME || ' ' || LAST_NAME as "full"
from EMPLOYEES;
