CREATE TABLE test_constraint_check
(
    nik           varchar2(64),
    nama          varchar2(100),
    saldo         numeric(8, 2)
        constraint ck_saldo_always_abs check ( saldo >= 0 ),
    jenis_kelamin char(1)
        constraint ck_jk check ( jenis_kelamin in ('L', 'P') )
);

insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010101', 'Dimas Maryanto', 0, 'L');
insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010102', 'Muhamad Yusuf', 0, 'L');
insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010103', 'Putri', 0, 'P');

commit;

select *
from test_constraint_check;

insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010103', 'Nilai Saldo null', null, 'P');

insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010103', 'Nilai jenis kelamin null', 0, null);

insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010103', 'Nilai jenis kelamin salah', 0, 'l');

insert into test_constraint_check(nik, nama, saldo, jenis_kelamin)
values ('6201010103', 'Nilai Saldo minus', -1, 'P');


CREATE TABLE test_constraint_check_multi_columns
(
    product_id integer,
    name       varchar2(50),
    price      numeric(8, 2),
    discount   numeric(2, 2)
        constraint ck_discount_between check ( discount between 0 and 1 ),
    constraint ck_price_and_discount check ( price >= 10000 and discount >= 0.1 )
);

insert into test_constraint_check_multi_columns(product_id, name, price, discount)
VALUES (1, 'Macbook Pro 13" (2017)', 25000, .2);

commit;

select *
from test_constraint_check_multi_columns;


insert into test_constraint_check_multi_columns(product_id, name, price, discount)
VALUES (1, 'Test discount null', 25000, null);

insert into test_constraint_check_multi_columns(product_id, name, price, discount)
VALUES (1, 'Test price lower than', 9000, .2);

insert into test_constraint_check_multi_columns(product_id, name, price, discount)
VALUES (1, 'Test price discount lower than', 10000, .01);

commit;

-- ORA-02251: subquery not allowed here
CREATE TABLE test_constraint_check_subquery
(
    nik    varchar2(64),
    nama   varchar2(100),
    job_id varchar2(10),
    salary numeric(8, 2)
        constraint ch_salary_job check ( salary >= (select MAX_SALARY
                                                    from jobs job
                                                    where job.JOB_ID = job_id) )
);

-- ORA-02438: Column check constraint cannot reference other columns
CREATE TABLE test_constraint_check_subquery
(
    nik    varchar2(64),
    nama   varchar2(100),
    job_id varchar2(10),
    min_salary numeric(8, 2),
    salary numeric(8, 2)
        constraint ch_salary_job check ( salary >= min_salary )
);
