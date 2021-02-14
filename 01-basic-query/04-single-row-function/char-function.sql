select ascii('a') as ascii_func,
       chr(97)    as char_func,
       ascii('A') as ascii2_func
from DUAL;

select FIRST_NAME, LAST_NAME,
       concat(FIRST_NAME, concat(' ', LAST_NAME)) as fullname,
       lower(FIRST_NAME) as lower_first_name,
       initcap(lower(FIRST_NAME)) as initcap_first_name,
       length(FIRST_NAME) as length_first_name,
       substr(FIRST_NAME, 1, 2) as substr_first_name
from EMPLOYEES;
