select distinct POLICY_NAME
from AUDIT_UNIFIED_POLICIES
where POLICY_NAME like 'ORA%';


select *
from AUDIT_UNIFIED_ENABLED_POLICIES
where POLICY_NAME like 'ORA_%';

noaudit policy ORA_SECURECONFIG;

audit policy ORA_ACCOUNT_MGMT;

create user dimas_m identified by dimas_m
    default tablespace users
    quota 10 m on users
    account unlock;

create user c##dimas_m identified by dimas_m
    default tablespace users
    quota 10 m on users
    account unlock;

select *
from UNIFIED_AUDIT_TRAIL
order by event_timestamp desc
    fetch FIRST 10 rows ONLY;

