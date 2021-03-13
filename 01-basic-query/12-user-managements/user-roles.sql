create user sales
    identified by sales2018
    default tablespace users
    quota 10 m on users
    account unlock;

grant connect, resource, exp_full_database
    to sales;

select * from DBA_ROLES;

select *
from DBA_ROLE_PRIVS
where GRANTEE = 'SALES';


create user offices
    identified by project2018
    default tablespace users
    quota 10 m on users
    account unlock;

create role app_developer
    NOT IDENTIFIED;

grant connect, resource, exp_full_database, imp_full_database
    to app_developer;

grant app_developer
    to offices, sales;


select ROLE_ID, PASSWORD_REQUIRED, AUTHENTICATION_TYPE, ORACLE_MAINTAINED
from DBA_ROLES
where ROLE IN ('APP_DEVELOPER')
ORDER BY ROLE;

select GRANTEE, GRANTED_ROLE, DEFAULT_ROLE
from DBA_ROLE_PRIVS
WHERE GRANTEE = 'OFFICES';

select GRANTED_ROLE, ADMIN_OPTION, DEFAULT_ROLE
from DBA_ROLE_PRIVS
where GRANTEE in ('APP_DEVELOPER');

select *
from ROLE_SYS_PRIVS
where ROLE in (select GRANTED_ROLE
               from DBA_ROLE_PRIVS
               where GRANTEE in ('APP_DEVELOPER'));

revoke app_developer
    from OFFICES;


drop role app_developer;
