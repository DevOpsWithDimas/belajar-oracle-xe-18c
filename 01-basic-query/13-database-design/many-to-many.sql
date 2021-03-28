create table categories
(
    id          integer primary key,
    nama        varchar2(100) not null,
    description varchar2(1000)
);

insert into categories(id, nama)
values (10, 'Smartphone');
insert into categories(id, nama)
values (20, 'Personal Computer');
insert into categories(id, nama)
values (21, 'Component Computer');
insert into categories(id, nama)
values (22, 'Accessories Computer');

create table items
(
    id          varchar2(64)   default sys_guid() primary key,
    nama        varchar2(100)            not null,
    description varchar2(4000),
    price       numeric(12, 2) default 0 not null,
    discount    numeric(1, 2)  default 0 not null
);

insert into items(id, nama, description, price, discount)
values ('mbp13-touchbar', 'Macbook Pro 13 inch (Touchbar)', 'Intel Core i5-7860, 8gb RAM, 256 Flash Storage', 25000000,
        0);
insert into items(id, nama, description, price, discount)
values ('ipp11', 'iPad Pro 11 inch', 'Processor: A12, Ram: 4GB, Storage: 64GB, Wifi+Celular', 15000000, 0);
insert into items(id, nama, description, price, discount)
values ('ipn7+', 'iPhone 7 Plus', 'Processor: A10 Fusion, Ram: 2GB, Storage: 32GB', 8000000, 0);
insert into items(id, nama, description, price, discount)
values ('iwatch', 'Apple Watch 5th gen', 'Processor: S5, Ram: 1GB, Storage: 32GB, Wifi-Only', 8000000, 0);

create table item_categories
(
    id          varchar2(64) default sys_guid() primary key,
    item_id     varchar2(64) not null
        constraint fk_item_category_item_id references items (id)
            on delete cascade,
    category_id integer      not null
        constraint fk_item_category_category_id references categories (id)
            on delete cascade,
    constraint uq_item_category unique (item_id, category_id)
);

insert into item_categories(item_id, category_id)
values ('mbp13-touchbar', 20);
insert into item_categories(item_id, category_id)
values ('ipp11', 10);
insert into item_categories(item_id, category_id)
values ('ipp11', 20);
insert into item_categories(item_id, category_id)
values ('ipn7+', 10);
insert into item_categories(item_id, category_id)
values ('iwatch', 10);

commit;

select i.id item_id, i.nama item_name, c2.id category_id, c2.nama category_name
from items i
         left join item_categories ic on i.id = ic.item_id
         left join categories c2 on ic.category_id = c2.id
order by item_id;


select c.id category_id, c.nama category_name, i.id item_id, i.nama item_name
from categories c
         left join item_categories ic on c.id = ic.category_id
         left join items i on ic.item_id = i.id
order by category_id;
