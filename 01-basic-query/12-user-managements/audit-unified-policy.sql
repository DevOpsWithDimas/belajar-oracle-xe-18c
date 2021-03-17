select *
from AUDIT_UNIFIED_POLICIES
where lower(policy_name) in ('aud_up_del_hr_employees');


select *
from AUDIT_UNIFIED_ENABLED_POLICIES;


create audit policy aud_up_del_hr_employees
    actions update on hr.EMPLOYEES,
        delete on hr.EMPLOYEES;

audit policy aud_up_del_hr_employees
by TOKO_ONLINE, SALES;

select dbusername, sql_text
from UNIFIED_AUDIT_TRAIL
order by event_timestamp desc;
