begin
    DBMS_FGA.ADD_POLICY(
            object_schema => 'HR',
            object_name => 'EMPLOYEES',
            policy_name => 'FGA_UPDATE_HR_EMPLOYEES_ON_SAL_COMM_PCT',
            audit_column => 'SALARY, COMMISSION_PCT',
            audit_condition => 'SALARY >= 10000',
            enable => true,
            statement_types => 'UPDATE'
        );
end;

-- specific for dba role
select *
from dba_audit_policies;

select *
from ALL_AUDIT_POLICIES;

select *
from USER_AUDIT_POLICIES;


select *
from CDB_FGA_AUDIT_TRAIL;

select *
from DBA_FGA_AUDIT_TRAIL
order by TIMESTAMP desc;

begin
    DBMS_FGA.DISABLE_POLICY(
            object_schema => 'HR',
            object_name => 'EMPLOYEES',
            policy_name => 'FGA_UPDATE_HR_EMPLOYEES_ON_SAL_COMM_PCT'
        );
end;


begin
    DBMS_FGA.ENABLE_POLICY(
            object_schema => 'HR',
            object_name => 'EMPLOYEES',
            policy_name => 'FGA_UPDATE_HR_EMPLOYEES_ON_SAL_COMM_PCT',
            enable => true
        );
end;


begin
    DBMS_FGA.DROP_POLICY(
            object_schema => 'HR',
            object_name => 'EMPLOYEES',
            policy_name => 'FGA_UPDATE_HR_EMPLOYEES_ON_SAL_COMM_PCT'
        );
end;
