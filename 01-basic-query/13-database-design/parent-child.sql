create table menu
(
    id          varchar2(64) default sys_guid() primary key,
    nama        varchar2(100) not null,
    description varchar2(4000),
    parent_id   varchar2(64)
        constraint fk_menu_id references menu (id) on delete cascade
);

insert into menu (id, nama, parent_id)
values ('p', 'Belanja', null);
insert into menu (id, nama, parent_id)
values ('komputer-laptop', 'Komputer & Laptop', 'p');
insert into menu (id, nama, parent_id)
values ('motherboard', 'Motherboard', 'komputer-laptop');
insert into menu (id, nama, parent_id)
values ('vga', 'VGA Card', 'komputer-laptop');
insert into menu (id, nama, parent_id)
values ('ram', 'RAM Komputer & Laptop', 'komputer-laptop');
insert into menu (id, nama, parent_id)
values ('elektronik', 'Elektronik', 'p');

insert into menu(id, nama)
values ('tagihan', 'Tagihan');
insert into menu (id, nama, parent_id)
values ('bpjs-ketenagakerjaan', 'Bayar BPJS Kesehatan & Ketenagakerjaan', 'tagihan');
insert into menu (id, nama, parent_id)
values ('pln', 'Beli Token & Bayar Tagihan Listrik', 'tagihan');

commit;

select child.id child_id, child.nama child_name, parent.id parent_id, parent.nama parent_name
from menu child
         left join menu parent on child.parent_id = parent.id
order by child_id;

select id                           as menu_id,
       nama                         as menu_name,
       connect_by_root nama         as root_name,
       sys_connect_by_path(id, '/') as url,
       to_char(LEVEL)                  peringkat,
       to_char(CONNECT_BY_ISLEAF)   as is_leaf,
       to_char(CONNECT_BY_ISCYCLE)  as is_cycle
from menu
start with parent_id is null
connect by nocycle prior id = parent_id
order siblings by nama;
