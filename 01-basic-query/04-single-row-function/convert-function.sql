select ascii('a')                                                                as ascii_fun,
       ASCIISTR('ABÄCDE')                                                        as asciistr_fun,
       UNISTR('AB\FFFD\FFFDCDE')                                                 as unistr_fun,
       bin_to_num(1, 1, 1, 0)                                                    as bintonum_fun,
       to_char(current_date, 'DD/MON/YYYY HH12:mi:ss')                           as tochar_date_fun,
       to_char(2000000, 'L999G999G999D99MI')                                     as tochar_currency_fun,
       to_number('2.000.000,00' DEFAULT 0 ON CONVERSION ERROR, '999G999G999D99') as tonumber_fun,
       to_date('14/02/2021 07:01:00', 'DD/MM/YYYY HH24:mi:ss')                   as todate_fun
from DUAL;
