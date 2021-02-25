select *
from TEST_CONSTRAINT_FK_DETAIL_TABLE
where MASTER_ID = 'prog';

--  ORA-02292: integrity constraint (HR.FK_DETAIL_MASTER_ID) violated - child record found
delete
from TEST_CONSTRAINT_FK_MASTER_TABLE
where ID = 'prog';

create table test_constraint_fk_options
(
    id         varchar2(10) primary key,
    name       varchar2(50),
    min_salary numeric(6),
    max_salary numeric(6)
);

insert into test_constraint_fk_options(id, name, min_salary, max_salary)
VALUES ('prog', 'Programmer', 4000, 7990);
insert into test_constraint_fk_options(id, name, min_salary, max_salary)
VALUES ('rnd', 'Research and Development', 6000, 9990);
insert into test_constraint_fk_options(id, name, min_salary, max_salary)
VALUES ('arch', 'System Architect', 10000, 19990);
insert into test_constraint_fk_options(id, name, min_salary, max_salary)
VALUES ('dba', 'Database Administrator', 8000, 15990);
insert into test_constraint_fk_options(id, name, min_salary, max_salary)
VALUES ('env', 'System Environments', 10000, 25990);

commit;

create table test_constraint_fk_options_set_null
(
    id         varchar2(10) primary key,
    first_name varchar2(50)            not null,
    master_id  varchar2(10)
        constraint fk_constraint_detail_master_id
            references test_constraint_fk_options (id)
                on delete set null,
    salary     numeric(8, 2) default 0 not null
);

insert into test_constraint_fk_options_set_null(id, first_name, master_id, salary)
values ('01', 'Dimas Maryanto', 'rnd', 9000);
insert into test_constraint_fk_options_set_null(id, first_name, master_id, salary)
values ('02', 'Muhamad Yusuf', 'prog', 8000);

commit;

select *
from test_constraint_fk_options;

select *
from test_constraint_fk_options_set_null;

delete
from test_constraint_fk_options
where id = 'rnd';

commit;


create table test_constraint_fk_options_cascade
(
    id         varchar2(10) primary key,
    first_name varchar2(50)            not null,
    master_id  varchar2(10)
        constraint fk_constraint_option_cascade
            references test_constraint_fk_options (id)
                on delete cascade,
    salary     numeric(8, 2) default 0 not null
);

insert into test_constraint_fk_options_cascade(id, first_name, master_id, salary)
values ('01', 'Dimas Maryanto', 'arch', 9000);
insert into test_constraint_fk_options_cascade(id, first_name, master_id, salary)
values ('02', 'Muhamad Yusuf', 'prog', 8000);

commit;

select *
from test_constraint_fk_options_cascade;

delete
from test_constraint_fk_options
where id = 'arch';

commit;
