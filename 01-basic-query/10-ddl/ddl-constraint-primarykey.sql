CREATE TABLE test_constraint_pk
(
    product_no integer
        constraint pk_test primary key,
    name       varchar2(60) NOT NULL,
    price      numeric(8, 2)
);

insert into test_constraint_pk(product_no, name, price)
values (1, 'Apple Macbook Pro 13" (2017)', 28000);
insert into test_constraint_pk(product_no, name, price)
values (2, 'Apple iPad Pro 11" (2018)', 13000);
insert into test_constraint_pk(product_no, name, price)
values (3, 'Apple Pencil gen 2th', 2300);
insert into test_constraint_pk(product_no, name, price)
values (4, 'iPhone 7 Plus 36GB', 8999);
insert into test_constraint_pk(product_no, name, price)
values (5, 'Apple Airpods 2th', 2500);
insert into test_constraint_pk(product_no, name, price)
values (6, 'Apple Watch 5 series', 6500);
insert into test_constraint_pk(product_no, name, price)
values (7, 'Apple iPad 6 gen', 8500);

-- ORA-01400: cannot insert NULL into ("HR"."TEST_CONSTRAINT_PK"."PRODUCT_NO")
insert into test_constraint_pk(product_no, name, price)
values (null, 'Apple iPad 7 gen', 8500);

commit;

select *
from test_constraint_pk;


select *
from test_constraint_pk
where product_no = 7;

delete
from test_constraint_pk
where product_no = 7;

commit;

create table test_constraint_composite_pk
(
    version      integer,
    product_code varchar2(20),
    name         varchar2(60),
    price        numeric(8, 2),
    constraint pk_composite_product primary key (version, product_code)
);

insert into test_constraint_composite_pk(version, product_code, name, price)
values (2017, 'MBP13', 'Apple Macbook Pro 13" (2017)', 28000);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (2018, 'IPD11', 'Apple iPad Pro 11" (2018)', 13000);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (2, 'PCL2', 'Apple Pencil gen 2th', 2300);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (7, 'IPHONE', 'iPhone 7 Plus 36GB', 8999);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (2, 'AIRPODS', 'Apple Airpods 2th', 2500);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (5, 'WATCH', 'Apple Watch 5 series', 6500);
insert into test_constraint_composite_pk(version, product_code, name, price)
values (6, 'IPD', 'Apple iPad 6 gen', 8500);

commit;

select *
from test_constraint_composite_pk
where version = 2017
  and product_code = 'MBP13';


-- ORA-01400: cannot insert NULL into ("HR"."TEST_CONSTRAINT_COMPOSITE_PK"."VERSION")
insert into test_constraint_composite_pk(version, product_code, name, price)
values (null, 'MBP13', 'Apple Macbook Pro 13" (2018)', 28000);

-- ORA-01400: cannot insert NULL into ("HR"."TEST_CONSTRAINT_COMPOSITE_PK"."PRODUCT_CODE")
insert into test_constraint_composite_pk(version, product_code, name, price)
values (2018, null, 'Apple Macbook Pro 13" (2018)', 28000);

-- ORA-00001: unique constraint (HR.PK_COMPOSITE_PRODUCT) violated
insert into test_constraint_composite_pk(version, product_code, name, price)
values (2017, 'MBP13', 'Apple Macbook Pro 13" (2018)', 28000);
