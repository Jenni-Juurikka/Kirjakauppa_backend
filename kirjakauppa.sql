<?php
drop database if exists kirjakauppa;
create database kirjakauppa;
use kirjakauppa;

create table category (
    id int primary key auto_increment,
    name varchar(50) not null
);

insert into category(name) value ('Shoes');
insert into category(name) value ('Pants');