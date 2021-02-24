CREATE TABLE test_constraint_unique
(
    product_no integer unique,
    name       varchar2(50),
    price      number(8, 2) default 0
);

insert into test_constraint_unique (product_no, name, price)
values (1, 'Apple Macbook Pro 13" (2017)', 28000);

commit ;

-- insert into test_constraint_unique (product_no, name, price)
-- values (1, 'Apple Macbook Pro 13" (2019)', 25000);

create table test_constraint_multi_unique
(
    product_code integer                      not null,
    product_type varchar2(5)                  not null,
    product_name varchar2(50),
    price        number(8, 2) default 0       not null,
    release_date date         default sysdate not null,
    constraint uq_product_id unique (product_code, product_type)
);

insert into test_constraint_multi_unique(product_code, product_type, product_name, price, release_date)
values (1, 'MBP13', 'Macbook Pro 13" (2017)', 28000, date '2016-08-01');
insert into test_constraint_multi_unique(product_code, product_type, product_name, price, release_date)
values (2, 'MBP13', 'Macbook Pro 13" (2018)', 25000, date '2017-09-23');

commit ;

insert into test_constraint_multi_unique(product_code, product_type, product_name, price, release_date)
values (2, 'MBP13', 'Macbook Pro 13" (2019)', 24000, date '2018-03-01');

select product_code, product_type, count(*) duplicate_count
from test_constraint_multi_unique
group by product_code, product_type
having count(*) >= 2;

alter table test_constraint_multi_unique
    add constraint uq_product_code unique (product_code, product_type);
