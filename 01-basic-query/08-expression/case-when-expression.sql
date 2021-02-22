select employee_id    as kode_karyawan,
       commission_pct as komisi_dlm_percent,
       case
           when commission_pct is null
               then 'Tidak memiliki komisi'
           else
               to_char(
                       coalesce(commission_pct, 0) * salary,
                       '999G999G999D99')
           end        as komisi_dlm_dolar
from employees;


select EMPLOYEE_ID,
       FIRST_NAME,
       nvl2(COMMISSION_PCT, to_char(coalesce(commission_pct, 0) * salary, '999G999G999D99'), 'Tidak Memiliki Komisi')
from EMPLOYEES;


select employee_id    as kode_karyawan,
       commission_pct as komisi_dlm_percent,
       case
           when commission_pct is null
               then 'Tidak memiliki komisi'
           else
               case
                   when SALARY > 10000 then 'Komisi tidak null dan gaji lebih besar dari 10000'
                   else 'Komisi tidak null dan gaji lebih kecil dari 10000'
                   end
           end        as komisi_dlm_dolar
from employees;
