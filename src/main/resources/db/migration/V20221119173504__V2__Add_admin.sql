insert into usr (id, username, password, email)
values (1, 'admin', '123', 'some@gmail.com');

insert into user_role (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');