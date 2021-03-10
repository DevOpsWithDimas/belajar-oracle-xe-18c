create table costumer_gender
(
    id   char(1)      not null primary key,
    name varchar2(20) not null
);

insert into costumer_gender(id, name)
values ('L', 'Laki - Laki');
insert into costumer_gender(id, name)
values ('P', 'Perempuan');

create table test_bitmap_index_table
(
    id            varchar2(64) default sys_guid() primary key,
    nama          varchar2(50),
    jenis_kelamin char(1)
        constraint fk_cs_gender references costumer_gender (id)
            on delete set null,
    telp          varchar2(20) not null,
    status        varchar2(10) default 'single'
);

insert into test_bitmap_index_table(nama, jenis_kelamin, telp)
values ('Dimas Maryanto', 'L', '082111234');
insert into test_bitmap_index_table(nama, jenis_kelamin, telp, status)
values ('Muhamad Yusuf', 'L', '082111235', 'menikah');
insert into test_bitmap_index_table(nama, jenis_kelamin, telp, status)
values ('Dewi', 'P', '082111236', 'menikah');
insert into test_bitmap_index_table(nama, jenis_kelamin, telp)
values ('Putri', 'P', '082111237');
insert into test_bitmap_index_table(nama, jenis_kelamin, telp, status)
values ('Rega', 'L', '082111238', 'menikah');

commit;

select *
from test_bitmap_index_table;


create bitmap index idx_bitmap_jk
    on test_bitmap_index_table (jenis_kelamin);

create bitmap index idx_bitmap_jk_and_status
    on test_bitmap_index_table (jenis_kelamin, status);


select *
from test_bitmap_index_table m
         left join costumer_gender cg on cg.id = m.jenis_kelamin
where cg.name = 'Laki - Laki';


create bitmap index idx_bitmap_join_jk
    on test_bitmap_index_table (d.name)
    from test_bitmap_index_table m, costumer_gender d
        where m.jenis_kelamin = d.id;
