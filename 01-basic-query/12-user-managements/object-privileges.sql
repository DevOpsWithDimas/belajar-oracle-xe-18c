grant select, references
    on hr.EMPLOYEES
    to TOKO_ONLINE;

select *
from DBA_TAB_PRIVS
where GRANTEE = 'TOKO_ONLINE'
order by TABLE_NAME, PRIVILEGE;


grant all on hr.DEPARTMENTS
    to TOKO_ONLINE;

grant select,update (salary, commission_pct) on hr.EMPLOYEES
    to TOKO_ONLINE;

revoke select on HR.EMPLOYEES from TOKO_ONLINE;

revoke all on HR.DEPARTMENTS
    from TOKO_ONLINE;
