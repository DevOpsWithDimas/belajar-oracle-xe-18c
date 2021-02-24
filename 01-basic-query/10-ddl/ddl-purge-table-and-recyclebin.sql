create table need_to_drop
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

insert into need_to_drop(kode, nama, tanggal_lahir, saldo, commission_pct, gender, active, created_date)
values (1, 'Dimas Maryanto', date '1991-01-01', 10000, 0.1, 'L', 1, current_timestamp);
insert into need_to_drop(kode, nama, tanggal_lahir, saldo, commission_pct, gender, active, created_date)
values (2, 'Muhamad Yusuf', date '1990-01-01', 11000, 0.1, 'L', 1, current_timestamp);

commit;

select * from need_to_drop;

drop table need_to_drop;

select OBJECT_NAME, ORIGINAL_NAME, OPERATION, TYPE
from RECYCLEBIN;

select * from "BIN$vBkFT9kiByfgUwIAEqwRtw==$0";

flashback table need_to_drop to before drop ;

purge recyclebin ;

drop table need_to_drop purge ;
