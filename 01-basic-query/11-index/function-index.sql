SELECT employee_id,
       last_name,
       first_name,
       12 * salary * commission_pct AS "ANNUAL SAL"
FROM employees
WHERE (12 * salary * commission_pct) < 30000
ORDER BY "ANNUAL SAL" DESC;



CREATE INDEX idx_emp_total_sal
    ON employees (12 * salary * commission_pct, salary);

select *
from EMPLOYEES
where upper(FIRST_NAME) = 'STEVEN';

create index idx_emp_upper_firstname
on EMPLOYEES (upper(FIRST_NAME));
