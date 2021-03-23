drop database if exists kirjakauppa;

create database kirjakauppa;

create table tuoteryhma (
    trnro smallint primary key auto_increment,
    trnimi varchar(20) not null 
);

create table tuote (
    tuotenro int primary key auto_increment,
    tuotenimi varchar(20) not null,
    hinta decimal(6, 2) not null,
    kustannus decimal(6, 2) not null,
    trnro smallint not null,
    foreign key (trnro) references tuoteryhma(trnro)
);