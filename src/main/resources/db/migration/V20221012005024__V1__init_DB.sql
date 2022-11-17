--create sequence hibernate_sequence start 1 increment 1;

/*create table category
(
    id            int8 not null,
    category_name varchar(255),
    primary key (id)
);*/

/*create table comment
(
    id         int8 not null,
    text       varchar(2048),
    product_id int8,
    user_id    int8,
    primary key (id)
);*/

/*create table comparison
(
    id int8 not null,
    primary key (id)
);*/

/*create table product
(
    id            int8 not null,
    brand_name    varchar(255),
    description   varchar(255),
    filename      varchar(255),
    name          varchar(255),
    price         float4,
    shop_name     varchar(255),
    shop_url      varchar(255),
    category_id   int8,
    comparison_id int8,
    primary key (id)
);*/

/*create table user_role
(
    user_id int8 not null,
    roles   varchar(255)
);*/

/*create table usr
(
    id       int8 not null,
    email    varchar(255),
    password varchar(255),
    username varchar(255),
    primary key (id)
);*/

/*alter table if exists comment
    add constraint comment_product_fk foreign key (product_id) references product;

alter table if exists comment
    add constraint comment_user_fk foreign key (user_id) references usr;

alter table if exists product
    add constraint product_category_fk foreign key (category_id) references category;

alter table if exists product
    add constraint product_comparison_fk foreign key (comparison_id) references comparison;

alter table if exists user_role
    add constraint user_role_user_fk foreign key (user_id) references usr;*/