CREATE TABLE test_constraint_notnull
(
    product_no  integer                NOT NULL,
    name        varchar2(50)           NOT NULL,
    price       number(8, 2) default 0 NOT NULL,
    category_id varchar2(64)
);

insert into test_constraint_notnull(product_no, name, price)
values (1, 'Macbook Pro 13" (2017)', 25000);

commit;

-- insert into test_constraint_notnull(product_no, name, price)
-- values (2, null, 25000);

update test_constraint_notnull
set category_id = '0'
where category_id is null;

commit;

select * from test_constraint_notnull
where category_id is null;


alter table test_constraint_notnull
    modify category_id varchar2(64) default '' not null;
