drop user TOKO_ONLINE cascade ;

select SID, SERIAL#, USERNAME
from V$SESSION
where USERNAME = 'TOKO_ONLINE';

alter system kill session '31, 2615';

