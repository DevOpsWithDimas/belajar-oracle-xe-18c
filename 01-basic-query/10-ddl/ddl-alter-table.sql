alter table TEST_TABLE2
    rename to table_with_default;

alter table TEST_TABLE
    add (category varchar2(50),
         stock integer default 0);

alter table TEST_TABLE
    drop column stock;

alter table TEST_TABLE
    set unused column category;

select * from USER_UNUSED_COL_TABS;

select * from TEST_TABLE;

update TEST_TABLE
set COMMISSION_PCT = 0.1;

alter table TEST_TABLE
    modify commission_pct number(4, 2);

alter table TEST_TABLE
    rename column commission_pct to commission;


alter table TEST_TABLE
    modify commission default 0;

