insert into REGIONS(region_id, region_name)
VALUES (15, 'Asia Tenggara');

select * from REGIONS;


insert into DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
values (DEPARTMENTS_SEQ.nextval, 'Core Banking', 1700);

select * from DEPARTMENTS where DEPARTMENT_NAME = 'Core Banking';


insert into REGIONS(REGION_ID, REGION_NAME)
select 20, 'South-Eastern Asia ' from DUAL;


select * from REGIONS where REGION_ID = 20;
