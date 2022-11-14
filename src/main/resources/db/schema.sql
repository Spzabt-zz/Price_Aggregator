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
    /*video_card_id INTEGER        NOT NULL REFERENCES video_card (id),
    processors_id INTEGER        NOT NULL REFERENCES processors (id),*/
    category_id   INTEGER        NOT NULL REFERENCES category (id)
);

CREATE TABLE users
(
    id       BIGSERIAL    NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email    VARCHAR(100) NOT NULL,
    password VARCHAR(50)  NOT NULL,
    role     VARCHAR(5)   NOT NULL
);

