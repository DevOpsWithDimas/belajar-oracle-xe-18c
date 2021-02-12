select EMPLOYEE_ID, FIRST_NAME, JOB_ID
from EMPLOYEES
where FIRST_NAME like 'A%';

select EMPLOYEE_ID, FIRST_NAME, JOB_ID
from EMPLOYEES
where FIRST_NAME like '__e%';

SELECT first_name, last_name
FROM employees
WHERE REGEXP_LIKE (first_name, '^Ste(v|ph)en$');
