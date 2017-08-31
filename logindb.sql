create database logindb;
use logindb;

CREATE TABLE users (
    login VARCHAR(20) UNIQUE,
    pass VARCHAR(15),
    perm TEXT
);

insert into users (login, pass, perm) values ('user1', 'pass1', '100');
insert into users (login, pass, perm) values ('user2', 'pass2', '100');

insert into users (login, pass, perm) values ('admin1', 'pass1', '111');
insert into users (login, pass, perm) values ('admin2', 'pass2', '111');

select * from users;

select * from users where login = 'user1' and pass = 'pass1';

create table employee (
id int primary key auto_increment,
name varchar(25) not null,
last varchar(35) not null,
salary double default 1000
);

insert into employee (name, last, salary) values ('Jan', 'Kowalski', '2000');
insert into employee (name, last) values ('Janusz', 'Biznesu');

select * from employee;
