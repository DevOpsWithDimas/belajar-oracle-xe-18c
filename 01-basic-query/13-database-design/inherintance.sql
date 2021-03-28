create or replace type kendaraan_type as object
(
    id                    integer,
    name                  varchar2(100),
    brand                 varchar2(50),
    wheels                integer,
    machine_type          varchar2(100),
    created_by            varchar2(100),
    created_datetime      timestamp,
    last_updated_by       varchar2(100),
    last_updated_datetime timestamp
) not final;

create or replace type motorcycle_type under kendaraan_type
(
    single_seater    integer,
    front_brake_type varchar2(20),
    rear_breke_type  varchar2(20)
) not final;

create or replace type car_type under kendaraan_type
(
    passenger integer
) not final;

create table bmw_motorad of motorcycle_type
(
    id primary key
);
create table astra_honda of motorcycle_type
(
    id primary key
);

create table honda_indonesia of car_type
(
    id primary key
);
create table bmw of car_type
(
    id primary key
);

select * from USER_TYPES;

select * from USER_OBJECT_TABLES;

insert into astra_honda(id, NAME, BRAND, WHEELS, MACHINE_TYPE, SINGLE_SEATER, FRONT_BRAKE_TYPE, REAR_BREKE_TYPE)
values (1, 'CBR 150-rr', 'HONDA', 2, 'DOHC 1 Cylinder', 0, 'Double disk Cakram', 'Single disk Cakram');

insert into astra_honda(id, NAME, BRAND, WHEELS, MACHINE_TYPE, SINGLE_SEATER, FRONT_BRAKE_TYPE, REAR_BREKE_TYPE)
values (2, 'CBR 250-rr', 'HONDA', 2, 'DOHC 2 Cylinder', 1, 'Double disk Cakram', 'Single disk Cakram');

commit;

select * from astra_honda;

drop table bmw_motorad cascade constraints;
drop table honda_indonesia cascade constraints;
drop table bmw cascade constraints;

drop type car_type FORCE;
drop type motorcycle_type force ;
