create table orders
(
    id           varchar2(64) default sys_guid() primary key,
    cust_name    varchar2(100)                          not null,
    cust_addr    varchar2(64),
    cust_phone   varchar2(25),
    created_date timestamp    default current_timestamp not null
);

create table order_details
(
    id       varchar2(64)   default sys_guid() primary key,
    order_id varchar2(64)             not null
        constraint fk_order_dt_order_id
            references orders (id) on delete cascade,
    item     varchar2(100)            not null,
    price    numeric(12, 2) default 0 not null
        constraint ck_price_min check ( price >= 0 ),
    qty      integer        default 1 not null
        constraint ck_qty_min check ( qty >= 1 )
);

insert into orders(id, cust_name)
values ('1', 'Dimas Maryanto');
insert into orders(id, cust_name)
values ('2', 'Muhamad Yusuf');

insert into order_details(item, order_id, price, qty)
VALUES ('Macbook Pro 13"', '1', 25000000, 1);
insert into order_details(item, order_id, price, qty)
VALUES ('iPad Pro 11" (WIFI+Celular)', '1', 15000000, 1);
insert into order_details(item, order_id, price, qty)
VALUES ('Apple Pencil 2nd gen', '1', 2200000, 1);
insert into order_details(item, order_id, price, qty)
VALUES ('iPhone 7 Plus (32 GB)', '1', 2200000, 1);

insert into order_details(item, order_id, price, qty)
VALUES ('Macbook Pro 15"', '2', 34000000, 1);
insert into order_details(item, order_id, price, qty)
VALUES ('iPhone 5 (24 GB)', '2', 15000000, 1);

select *
from orders
where id = 1;


select *
from orders o
         left join order_details d on o.id = d.order_id
where o.id = 1;
