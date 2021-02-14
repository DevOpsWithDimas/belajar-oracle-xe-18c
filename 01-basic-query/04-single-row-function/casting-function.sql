select cast('12-FEB-2021' as Date)                                 varchar_date,
       cast('12-aa-2021' as Date default null on conversion error) varchar_date_error,
       cast('010' as number)                                       varchar_number,
       cast('0a10' as number default null on conversion error)     varchar_number_error,
       cast(20 as varchar2(5))                   as                number_varchar,
       cast((date '2021-02-01') as varchar2(20)) as                date_varchar,
       cast((date '2021-02-01') as timestamp)    as                date_timestamp
from DUAL;
