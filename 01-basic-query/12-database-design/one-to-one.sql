create table addresses
(
    id           varchar2(64) default sys_guid()
        constraint pk_address primary key,
    alamat       varchar2(255) not null,
    provinsi_id  varchar2(64)  not null,
    kota_id      varchar2(64)  not null,
    kecamatan_id varchar2(64)  not null,
    kelurahan_id varchar2(64)  not null,
    kode_pos     varchar2(6)
);

create sequence seq_seller
    increment by 1
    start with 1
    nocycle
    nocache;

create table sellers
(
    id        integer default seq_seller.nextval
        constraint pk_seller primary key,
    nama      varchar2(100) not null,
    domain    varchar2(20)  not null
        constraint uq_domain unique,
    alamat_id varchar2(64)
        constraint uq_saler_address unique
        constraint fk_address_saler references addresses (id) on delete set null
);

insert into addresses(id, alamat, provinsi_id, kota_id, kecamatan_id, kelurahan_id, kode_pos)
values ('ibox', 'Jl. Bandengan Selatan No. 19-20 RT 05 RW 010', 'Jakarta', 'Jakarta Barat', 'Pekojan', '-', '-');

insert into sellers(nama, domain, alamat_id)
values ('iBox', 'ibox.co.id', 'ibox');
insert into sellers(nama, domain, alamat_id)
values ('Nvidia Geforce Official Store', 'nvidia.co.id', null);
insert into sellers(nama, domain, alamat_id)
values ('MSI Official Store', 'msi.co.id', null);


select *
from addresses;

select *
from sellers s
         left join addresses a on s.alamat_id = a.id;


update sellers set
alamat_id = 'ibox'
where id = 2;
