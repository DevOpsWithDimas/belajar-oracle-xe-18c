create sequence test_partitioned increment by 1 start with 1;

create table bikes_no_partitioned
(
    id               integer default test_partitioned.nextval not null primary key,
    name             varchar2(100)                            not null,
    brand            varchar2(50)                             not null,
    dealer_name      varchar2(50)                             not null,
    wheels           integer default 2                        not null,
    cc               integer default 125,
    machine_type     varchar2(100),
    single_seater    integer default 0,
    front_break_type varchar2(20),
    rear_break_type  varchar2(20)
);

begin
    for idx in 1..100
        loop
            insert into bikes_no_partitioned(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'ASTRA_HONDA');

            insert into bikes_no_partitioned(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'MERDEKA_MOTOR');

            insert into bikes_no_partitioned(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'BINTANG_REJEKI_MOTOR');
        end loop;
end;
delete
from bikes_no_partitioned;

commit;

explain plan for
select *
from bikes_no_partitioned;


select *
from table ( DBMS_XPLAN.DISPLAY('PLAN_TABLE') );


create table bikes
(
    id               integer default test_partitioned.nextval not null primary key,
    name             varchar2(100)                            not null,
    brand            varchar2(50)                             not null,
    dealer_name      varchar2(50)                             not null,
    wheels           integer default 2                        not null,
    cc               integer default 125,
    machine_type     varchar2(100),
    single_seater    integer default 0,
    front_break_type varchar2(20),
    rear_break_type  varchar2(20)
) partition by list
(
    dealer_name
)
(
    partition honda values ('ASTRA_HONDA', 'MERDEKA_MOTOR', 'ACEH_HOTOR', 'DAYA_MOTOR'),
    partition kawasaki values ('CITRAKARYA_PRATANA', 'BINTANG_TERANG'),
    partition yamaha values ('JPM_RANCAEKEK', 'SURYA_PUTRA_PADALARANG', 'GERBANG_CAHAYA', 'BINTANG_REJEKI_MOTOR')
);

begin
    for idx in 1..100
        loop
            insert into bikes(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'ASTRA_HONDA');

            insert into bikes(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'MERDEKA_MOTOR');

            insert into bikes(name, brand, dealer_name)
            values (sys_guid(), sys_guid(), 'BINTANG_REJEKI_MOTOR');
        end loop;
end;

commit;

explain plan for select *
from bikes;


select *
from ALL_PART_TABLES
where TABLE_NAME = 'BIKES';

select *
from ALL_TAB_PARTITIONS
where TABLE_NAME = 'BIKES';

select *
from ALL_TAB_SUBPARTITIONS
where TABLE_NAME = 'BIKES';
