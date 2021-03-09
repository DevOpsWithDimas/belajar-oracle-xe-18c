create table test_btree_indexes
(
    employee_id    varchar2(32) default sys_guid() primary key,
    first_name     varchar2(20),
    last_name      varchar2(25) not null,
    email          varchar2(25) not null,
    phone_number   varchar2(20),
    hire_date      date,
    job_id         varchar2(10),
    salary         numeric(8, 2),
    commission_pct numeric(2, 2),
    department_id  numeric(4)
);

begin
    for idx in 1..10000
        loop
            insert into test_btree_indexes(first_name, last_name, email, phone_number, hire_date, job_id, salary,
                                           commission_pct, department_id)
            SELECT FIRST_NAME,
                   LAST_NAME,
                   EMAIL,
                   PHONE_NUMBER,
                   HIRE_DATE,
                   JOB_ID,
                   SALARY,
                   COMMISSION_PCT,
                   DEPARTMENT_ID
            from EMPLOYEES;
        end loop;
    commit;
end ;

select to_char(count(*), '999G999G999')
from test_btree_indexes;

select *
from test_btree_indexes
where first_name like '%n%';

create index idx_test_by_name
    on test_btree_indexes (first_name);

select *
from test_btree_indexes
where department_id = 90
  and salary > 4000;


create index idx_test_by_depid_and_salary
    on test_btree_indexes (
                           department_id,
                           salary asc
        );
