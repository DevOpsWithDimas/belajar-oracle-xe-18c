select *
from DBA_SYS_PRIVS
where GRANTEE = 'TOKO_ONLINE';

grant create table,
    create sequence,
    create any index,
    create view,
    create procedure,
    create session
    to TOKO_ONLINE;

grant all privileges
    to TOKO_ONLINE;

revoke create view, create table, alter any table
    from TOKO_ONLINE;

revoke all privileges from TOKO_ONLINE;
