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
--category
insert into category (id, category_name) values (1, 'Motherboards');
insert into category (id, category_name) values (2, 'Processors');
insert into category (id, category_name) values (3, 'Memory');
insert into category (id, category_name) values (4, 'Video cards');
insert into category (id, category_name) values (5, 'External Hard Drives');
insert into category (id, category_name) values (6, 'SSD');
insert into category (id, category_name) values (7, 'Internal Power Supplies');
insert into category (id, category_name) values (8, 'Fans & Cooling');
insert into category (id, category_name) values (9, 'Computer Cases');

--brand
--mather board
insert into brand (id, brand_name, category_id) values (1, 'AMD', 1);
insert into brand (id, brand_name, category_id) values (2, 'ASRock', 1);
insert into brand (id, brand_name, category_id) values (3, 'ACER', 1);
insert into brand (id, brand_name, category_id) values (4, 'Gigabyte', 1);
--processor
insert into brand (id, brand_name, category_id) values (5, 'Intel', 2);
insert into brand (id, brand_name, category_id) values (6, 'AMD', 2);
--ram
insert into brand (id, brand_name, category_id) values (7, 'GSkill', 3);
insert into brand (id, brand_name, category_id) values (8, 'HyperX', 3);
insert into brand (id, brand_name, category_id) values (9, 'Kingston', 3);
insert into brand (id, brand_name, category_id) values (10, 'Samsung', 3);
--videocard
insert into brand (id, brand_name, category_id) values (11, 'MSI', 4);
insert into brand (id, brand_name, category_id) values (12, 'NVIDIA', 4);
insert into brand (id, brand_name, category_id) values (13, 'Sapphire', 4);
insert into brand (id, brand_name, category_id) values (14, 'AMD', 4);
insert into brand (id, brand_name, category_id) values (15, 'Gigabyte', 4);
--hard drive
insert into brand (id, brand_name, category_id) values (16, 'Seagate', 5);
insert into brand (id, brand_name, category_id) values (17, 'Toshiba', 5);
insert into brand (id, brand_name, category_id) values (18, 'Transcend', 5);
insert into brand (id, brand_name, category_id) values (19, 'WD', 5);
--ssd
insert into brand (id, brand_name, category_id) values (20, 'HyperX', 6);
insert into brand (id, brand_name, category_id) values (21, 'Kingston', 6);
insert into brand (id, brand_name, category_id) values (22, 'Samsung', 6);
insert into brand (id, brand_name, category_id) values (23, 'WD', 6);
insert into brand (id, brand_name, category_id) values (24, 'Seagate', 6);
--power sup
insert into brand (id, brand_name, category_id) values (25, 'AEROCOOL', 7);
insert into brand (id, brand_name, category_id) values (26, 'Chieftec', 7);
insert into brand (id, brand_name, category_id) values (27, 'CoolerMaster', 7);
insert into brand (id, brand_name, category_id) values (28, 'DeepCool', 7);
insert into brand (id, brand_name, category_id) values (29, 'Seasonic', 7);
insert into brand (id, brand_name, category_id) values (30, 'BeQuiet', 7);
--fan
insert into brand (id, brand_name, category_id) values (31, 'AEROCOOL', 8);
insert into brand (id, brand_name, category_id) values (32, 'CoolerMaster', 8);
insert into brand (id, brand_name, category_id) values (33, 'DeepCool', 8);
insert into brand (id, brand_name, category_id) values (34, 'BeQuiet', 8);
--case
insert into brand (id, brand_name, category_id) values (35, 'AEROCOOL', 9);
insert into brand (id, brand_name, category_id) values (36, 'CoolerMaster', 9);
insert into brand (id, brand_name, category_id) values (37, 'DeepCool', 9);

/*insert into brand (id, brand_name, category_id) values (6, 'SSD');
insert into brand (id, brand_name, category_id) values (7, 'Internal Power Supplies');
insert into brand (id, brand_name, category_id) values (8, 'Fans & Cooling');
insert into brand (id, brand_name, category_id) values (9, 'Computer Cases');*/

