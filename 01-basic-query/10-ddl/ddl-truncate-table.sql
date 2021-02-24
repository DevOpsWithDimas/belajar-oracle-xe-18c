create table deleted_emp as
select *
from EMPLOYEES;

create table TRUNCATE_EMP as
select *
from EMPLOYEES;

commit;

analyze table deleted_emp compute statistics;
analyze table truncate_emp compute statistics;

select TABLE_NAME, NUM_ROWS, ((BLOCKS * 8192) / 1024) as kb
from user_tables
where TABLE_NAME in ('DELETED_EMP', 'TRUNCATE_EMP');

delete from deleted_emp;
truncate table TRUNCATE_EMP;

commit;
