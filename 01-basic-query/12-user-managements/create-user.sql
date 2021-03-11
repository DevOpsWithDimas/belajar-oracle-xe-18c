select sys_context('userenv', 'con_name') from dual;

select * from USER_TABLESPACES;

create user toko_online
    identified by toko_online
    default tablespace users
    quota 10 M on users
    account unlock;

select * from dba_users where USERNAME = 'TOKO_ONLINE';

grant create session to toko_online;
