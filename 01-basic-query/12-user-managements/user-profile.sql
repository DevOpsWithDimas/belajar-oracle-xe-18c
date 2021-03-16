select *
from DBA_PROFILES
where PROFILE = 'DEFAULT'
order by PROFILE;

select *
from USER_RESOURCE_LIMITS;

select *
from USER_PASSWORD_LIMITS;

select *
from DBA_USERS_WITH_DEFPWD;

select USERNAME, PROFILE, ACCOUNT_STATUS, AUTHENTICATION_TYPE
from DBA_USERS
where USERNAME in ('SYSTEM', 'HR', 'SALES', 'OFFICES');


CREATE PROFILE secure_profile LIMIT
--     jumlah session yang bisa login dalam satu user
    SESSIONS_PER_USER 1
--     idle time per menit
    IDLE_TIME 30
--     max connect 600 menit
    CONNECT_TIME 600
--     valid password dalam sehari sebelum expired
    password_life_time 1
--     berapa kali password setelah digunakan
    password_reuse_max 3
    FAILED_LOGIN_ATTEMPTS 3
--     PL/SQL function untuk verify password
    PASSWORD_VERIFY_FUNCTION ora12c_verify_function;

create user dimas
    identified by NOLAN$n64
    default tablespace users
    quota 10 m on users
    profile secure_profile;

grant connect to dimas;

alter user dimas identified by NOLAN$n62 account unlock ;

alter profile secure_profile LIMIT
    SESSIONS_PER_USER 3
    FAILED_LOGIN_ATTEMPTS 5;

alter user SALES
    profile secure_profile;


drop profile secure_profile CASCADE ;

DROP PROFILE "DEFAULT" cascade ;
