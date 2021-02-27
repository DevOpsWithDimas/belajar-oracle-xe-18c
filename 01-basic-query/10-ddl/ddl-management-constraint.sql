select CONSTRAINT_TYPE, TABLE_NAME, CONSTRAINT_NAME, STATUS, VALIDATED
from USER_CONSTRAINTS
where TABLE_NAME like 'TEST%'
  and OWNER = user;


SELECT DBMS_METADATA.get_ddl('CONSTRAINT', constraint_name, owner)
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'CK_PRICE_AND_DISCOUNT';


alter table TEST_CONSTRAINT_CHECK_MULTI_COLUMNS
    disable constraint CK_PRICE_AND_DISCOUNT;

select CONSTRAINT_TYPE, TABLE_NAME, CONSTRAINT_NAME, STATUS, VALIDATED
from USER_CONSTRAINTS
where TABLE_NAME like 'TEST%'
  and OWNER = user
  and CONSTRAINT_NAME = 'CK_PRICE_AND_DISCOUNT';

insert into test_constraint_check_multi_columns(product_id, name, price, discount)
VALUES (1, 'Test price discount lower than', 10000, .01);

commit;

select *
from TEST_CONSTRAINT_CHECK_MULTI_COLUMNS
where PRODUCT_ID = 1;



alter table TEST_CONSTRAINT_CHECK_MULTI_COLUMNS
    enable novalidate constraint CK_PRICE_AND_DISCOUNT;

select *
from TEST_CONSTRAINT_CHECK_MULTI_COLUMNS
where PRICE <= 10000 and DISCOUNT <= 0.1;


alter table TEST_CONSTRAINT_CHECK_MULTI_COLUMNS
    drop constraint CK_PRICE_AND_DISCOUNT;

select * from RECYCLEBIN;
