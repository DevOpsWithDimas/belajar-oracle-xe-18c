create sequence seq_test_from_zero
    start with 1
    increment by 1
    minvalue 0
    nocycle;

select *
from USER_SEQUENCES;


select seq_test_from_zero.currval sekarang,
       seq_test_from_zero.nextval berikutnya
from DUAL;


create sequence seq_table_ex
    start with 1
    increment by 1
    nocycle
    nocache;

create table test_using_seq
(
    id            integer default seq_table_ex.nextval,
    nama          varchar2(50) not null,
    jenis_kelamin char(1)
        constraint ck_jk_test_seq check ( jenis_kelamin in ('L', 'P') ),
    constraint pk_test_using_seq primary key (id)
);

-- using default keyword
insert into test_using_seq(id, nama, jenis_kelamin)
values (default, 'Dimas Maryanto', 'L');

-- without column
insert into test_using_seq(nama, jenis_kelamin)
values ('Dimas Maryanto', 'L');

-- without column
insert into test_using_seq(nama, jenis_kelamin)
values ('Dimas Maryanto', 'l');

select * from test_using_seq;


drop sequence seq_test_from_zero;
