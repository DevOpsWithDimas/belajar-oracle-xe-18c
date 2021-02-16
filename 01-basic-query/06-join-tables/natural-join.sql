select *
from LOCATIONS;

select *
from COUNTRIES
where COUNTRY_ID = 'IT';


select *
from LOCATIONS
         natural join COUNTRIES;

select *
from LOCATIONS
         natural join COUNTRIES
         natural join REGIONS;
