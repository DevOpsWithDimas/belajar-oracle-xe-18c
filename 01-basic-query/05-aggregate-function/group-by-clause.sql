select DEPARTMENT_ID              as dep_id,
       count(EMPLOYEE_ID)         as count_employees,
--        jumlah salary dalam setahun + commission
       sum(
               (salary * 12) + nvl2(COMMISSION_PCT, (SALARY * COMMISSION_PCT), 0)
           )                      as income_in_year,
--        rata2 gaji di setiap department
       round(avg(SALARY), 2)      as avg_salary_per_dep,
--        minimum gaji di setiap department
       min(salary)                as min_salary_per_dep,
--        maximum gaji di setiap department
       max(SALARY)                as max_salary_per_dep,
--        nilai median di setiap department
       median(SALARY)             as median_salary_per_dep,
--        nilai standard deviation di setiap department
       round(stddev(SALARY), 2)   as stddev_salary_per_dep,
--        nilai variance di setiap department
       round(variance(SALARY), 2) as variance_salary_per_dep
from EMPLOYEES
group by DEPARTMENT_ID;

select DEPARTMENT_ID              as dep_id,
       JOB_ID                     as job_id,
       count(EMPLOYEE_ID)         as count_employees,
--        jumlah salary dalam setahun + commission
       sum(
               (salary * 12) + nvl2(COMMISSION_PCT, (SALARY * COMMISSION_PCT), 0)
           )                      as income_in_year,
--        rata2 gaji di setiap department
       round(avg(SALARY), 2)      as avg_salary_per_dep,
--        minimum gaji di setiap department
       min(salary)                as min_salary_per_dep,
--        maximum gaji di setiap department
       max(SALARY)                as max_salary_per_dep,
--        nilai median di setiap department
       median(SALARY)             as median_salary_per_dep,
--        nilai standard deviation di setiap department
       round(stddev(SALARY), 2)   as stddev_salary_per_dep,
--        nilai variance di setiap department
       round(variance(SALARY), 2) as variance_salary_per_dep
from EMPLOYEES
group by DEPARTMENT_ID, JOB_ID
order by DEPARTMENT_ID desc ;
