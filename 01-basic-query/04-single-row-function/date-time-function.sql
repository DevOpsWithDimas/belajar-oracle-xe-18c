select add_months(date '2021-02-14', 1)                         as add_months_fun,
       current_date                                             as current_date_fun,
       current_timestamp                                        as current_timestamp_fun,
       sysdate                                                  as sysdate_fun,
       systimestamp                                             as systimestamp_fun,
       months_between(date '2021-02-14', date '2021-03-31')     as months_between_fun,
       to_char(date '2021-02-14', 'DD/MON/YYYY')                 as to_char_fun,
       to_timestamp('14/02/21 07:01:00', 'DD/MM/YY HH24:mi:ss') as to_timestamp_fun,
       to_date('14/02/2021', 'DD/MM/YYYY')                      as to_date_fun
from dual;
