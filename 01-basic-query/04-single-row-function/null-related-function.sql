select EMPLOYEE_ID                                             as emp_id,
       FIRST_NAME                                              as name,
       coalesce(COMMISSION_PCT, 0)                             as commission_pct,
       nvl(to_char(MANAGER_ID), 'Tidak Memiliki Manager')      as manager_id,
       SALARY                                                  as salary,
       nvl2(COMMISSION_PCT, SALARY +(SALARY * COMMISSION_PCT), SALARY) as income
from EMPLOYEES
-- where COMMISSION_PCT >= .2; -- gimana klo dibandingkan dengan ini?
where lnnvl(COMMISSION_PCT >= .2);
