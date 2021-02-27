create table test_table_guid
(
    id    varchar2(64)  default sys_guid() primary key,
    nama  varchar2(50),
    price numeric(8, 2) default 0 not null
);

insert into test_table_guid(nama, price)
values ('Apple Macbook Pro 13 inch 2017', 28000);
insert into test_table_guid(nama, price)
values ('Apple Macbook Pro 13 inch 2018', 25000);

select * from test_table_guid;
