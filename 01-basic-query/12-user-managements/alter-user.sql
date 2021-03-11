alter user TOKO_ONLINE
    account lock;

select * from DBA_USERS where USERNAME = 'TOKO_ONLINE';

alter user TOKO_ONLINE
    IDENTIFIED by toko_online
    account unlock;

alter profile DEFAULT limit PASSWORD_REUSE_TIME unlimited;
alter profile DEFAULT limit password_life_time unlimited;

select * from DBA_TS_QUOTAS where TABLESPACE_NAME = 'USERS';

alter user TOKO_ONLINE
    default tablespace users
    quota unlimited on users;
