drop database if exists kirjakauppa;

create database kirjakauppa;

use kirjakauppa;

create table tuoteryhma (
    id int primary key auto_increment,
    name varchar(50) not null
);

create table tuote (
    id int primary key auto_increment,
    name varchar(100) not null,
    price double (10,2) not null,
    image varchar(50),
    category_id int not null,
    index category_id(category_id),
    foreign key (category_id) references tuoteryhma(id)
        on delete restrict
);

create table tilaus (
    tilausnro int primary key,
    astunnus varchar(6) not null,
    tilauspvm datetime,
    tapa varchar(1) not null,
    tila varchar(1) null,
    foreign key (astunnus) references asiakas(astunnus)
);

create table tilausrivi (
    
);