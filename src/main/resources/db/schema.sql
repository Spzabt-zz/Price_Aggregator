CREATE TABLE category
(
    id            BIGSERIAL   NOT NULL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE product
(
    id            BIGSERIAL      NOT NULL PRIMARY KEY,
    name          VARCHAR(500)   NOT NULL,
    picture       VARCHAR(255)   NOT NULL,
    brand_name    VARCHAR(100)   NOT NULL,
    price         NUMERIC(10, 2) NOT NULL,
    description   VARCHAR(1000)  NOT NULL,
    shop_name     VARCHAR(100)   NOT NULL,
    category_id   INTEGER        NOT NULL REFERENCES category (id)
);

CREATE TABLE usr
(
    id       BIGSERIAL    NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email    VARCHAR(100) NOT NULL,
    password VARCHAR(50)  NOT NULL,
    role     VARCHAR(5)   NOT NULL
);

insert into category (id, category_name) values (1, 'Motherboards');
insert into category (id, category_name) values (2, 'Processors');
insert into category (id, category_name) values (3, 'Memory');
insert into category (id, category_name) values (4, 'Video cards');
insert into category (id, category_name) values (5, 'External Hard Drives');
insert into category (id, category_name) values (6, 'SSD');
insert into category (id, category_name) values (7, 'Internal Power Supplies');
insert into category (id, category_name) values (8, 'Fans & Cooling');
insert into category (id, category_name) values (9, 'Computer Cases');

