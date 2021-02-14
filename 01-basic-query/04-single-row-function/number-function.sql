select coalesce(commission_pct, 0) as commision_pct,
       salary                      as gaji,
       mod(2, 4)                   as sisa_bagi,
       power((salary / 1000), 2)   as pangkat,
       sqrt(50)                    as akar
from employees;
