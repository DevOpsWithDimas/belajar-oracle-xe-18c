create table test_table
(
    kode           integer,
    nama           varchar2(50),
    tanggal_lahir  date,
    saldo          numeric(8, 2),
    commission_pct float,
    gender         char(1),
    active         number(1, 0),
    created_date   timestamp
);

insert into test_table(kode, nama, tanggal_lahir, saldo, commission_pct, gender, active, created_date)
values (1, 'Dimas Maryanto', date '1992-01-01', 0, 0.1, 'L', 1, current_timestamp);

commit;

select * from test_table;

create table divisi
as (select DEPARTMENT_ID, DEPARTMENT_NAME from DEPARTMENTS);

create table test_table2
(
    kode           integer,
    nama           varchar2(50),
    tanggal_lahir  date,
    saldo          numeric(8, 2) default 0,
    commission_pct float         default 0,
    gender         char(1),
    active         number(1, 0)  default 0,
    created_date   timestamp     default systimestamp
);

insert into test_table2(kode, nama, tanggal_lahir, gender, saldo)
values (1, 'Dimas Maryanto', date '1991-01-01', 'L', 10000);

commit;

select * from test_table2;
