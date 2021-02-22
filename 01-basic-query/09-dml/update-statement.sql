select * from REGIONS where REGION_ID = 15;

update REGIONS
set REGION_NAME = 'Oceania'
where REGION_ID = 15;


select * from EMPLOYEES where COMMISSION_PCT is null;


update EMPLOYEES
set COMMISSION_PCT = 0.1
where COMMISSION_PCT is null;
