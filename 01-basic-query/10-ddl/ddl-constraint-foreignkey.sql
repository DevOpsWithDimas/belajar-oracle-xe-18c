create table test_constraint_fk_master_table
(
    id         varchar2(10) primary key,
    name       varchar2(50),
    min_salary numeric(6),
    max_salary numeric(6)
);

insert into test_constraint_fk_master_table(id, name, min_salary, max_salary)
VALUES ('prog', 'Programmer', 4000, 7990);
insert into test_constraint_fk_master_table(id, name, min_salary, max_salary)
VALUES ('rnd', 'Research and Development', 6000, 9990);
insert into test_constraint_fk_master_table(id, name, min_salary, max_salary)
VALUES ('arch', 'System Architect', 10000, 19990);
insert into test_constraint_fk_master_table(id, name, min_salary, max_salary)
VALUES ('dba', 'Database Administrator', 8000, 15990);
insert into test_constraint_fk_master_table(id, name, min_salary, max_salary)
VALUES ('env', 'System Environments', 10000, 25990);

commit;

select * from test_constraint_fk_master_table where id = 'pm';


create table test_constraint_fk_detail_table
(
    id         varchar2(10) primary key,
    first_name varchar2(50)            not null,
    master_id  varchar2(10)
        constraint fk_detail_master_id references test_constraint_fk_master_table (id),
    salary     numeric(8, 2) default 0 not null
);

insert into test_constraint_fk_detail_table(id, first_name, master_id, salary)
values ('01', 'Dimas Maryanto', 'dba', 11520);
insert into test_constraint_fk_detail_table(id, first_name, master_id, salary)
values ('02', 'Hari Sapto Adi', 'arch', 19000);
insert into test_constraint_fk_detail_table(id, first_name, master_id, salary)
values ('03', 'Abdul', 'prog', 7000);
insert into test_constraint_fk_detail_table(id, first_name, master_id, salary)
values ('04', 'Muhamad Yusuf', 'rnd', 8500);

commit ;

--  ORA-02291: integrity constraint (HR.FK_DETAIL_MASTER_ID) violated - parent key not found
insert into test_constraint_fk_detail_table(id, first_name, master_id, salary)
values ('05', 'Muhamad Purwadi', 'pm', 12000);
