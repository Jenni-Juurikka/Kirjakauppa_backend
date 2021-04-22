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
    author varchar(100) not null,
    price double (10,2) not null,
    image varchar(50),
    category_id int not null,
    foreign key (category_id) references tuoteryhma(id)
);

CREATE TABLE asiakas (
    astunnus int primary key auto_increment,
    asnimi varchar(50) NOT null,
    salasana varchar(255),
    puhelinro int(12) NOT null,
    osoite varchar(50) NOT null,
    postitmp varchar(35) NOT null,
    postinro varchar(5) NOT null,
    maa varchar(30) NOT null
);

create table tilaus (
    tilausnro int primary key auto_increment,
    astunnus int not null,
    tilauspvm datetime default CURRENT_TIMESTAMP,
    foreign key (astunnus) references asiakas(astunnus)
);

CREATE TABLE tilausrivi (
    tilausnro int NOT NULL,
    rivinro int primary key auto_increment,
    tuotenro int,
    foreign key (tilausnro) REFERENCES tilaus(tilausnro),
    foreign key (tuotenro) REFERENCES tuote(id)
);

CREATE TABLE henkilosto (
    tunnus int primary key auto_increment,
    nimi char(30) not null,
    osoite char(50),
    postinro char(5),
    postitmp char(20),
    puhelinro int(12),
    rooli char(30)
);


INSERT INTO `tuoteryhma`(`name`) VALUES ('Romanssi');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Kauhu');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Rikos');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Sci-fi');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Fantasia');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Lasten kirjallisuus');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Sarjakuvat');
INSERT INTO `tuoteryhma`(`name`) VALUES ('Dystopia');

INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Christian ja Judith','Marcus Barnes',5.00, 'img_1.png', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`, `category_id`) VALUES ('Sitten tuli Mo','Lavina Coenraad',4.00, 'img_2".png', 1);
INSERT INTO `tuote`( `name`, `author`, `price`, `image`, `category_id`) VALUES ('Joku kuten Kathy','Nirav Samo',49.00, 'img_3.png', 1);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Hopeisen pianon kirous','Jessica Andrews',34.00, 'img_4.png', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Kadonnut veljen poika','Pilar Michaela',93.00, 'img_5.png', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Raadeltu banaani','Saku Dobromil',94.00, 'img_6.png', 2);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Ruhjotut kädet','Iris Hawkins',10.00, 'img_7.png', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Lumottu ase','Svanhild Gil',50.00, 'img_8.png', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Mennyt rakastaja','Romulo Yuna',12.00, 'img_9.png', 3);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Galaktiset intohimoiset kynttilänjalka sodat','Lorenzo Martin',21.00, 'img_10.png', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Pienet pistoolisodat','Jasmin Cynthia',78.00, 'img_11.png', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Vaaleanpunainen köysi','Viola Hormizd',100.00, 'img_12.png', 4);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Viimeinen fantasia','Shiva Anderws',49.00, 'img_13.png', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Keijukainen, Reginald Greenway','Linus Jemma',38.00, 'img_14.png', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Hirven uni','Ingrid Valentinus',104.00, 'img_15.png', 5);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Doris ja Tometta - Sharfootin peikonmetsästäjät','Lesley Ferrari Gordon',27.00, 'img_16.png', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Charity ja Slug – Earwax Cityn sankarit','Mijo Sosimo',37.00, 'img_17.png', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Garyn salaisuus','Hadubert Photina',107.00, 'img_18.png', 6);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Darth, vamppyyrintappaja','George King',46.00, 'img_19.png', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Enkelin potku','Conrad Brady',77.00, 'img_20.png', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Salaperäinen, antava poliisi','Domitianus Cornelius',104.00, 'img_21.png', 7);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('2033, Meritähden vuosi','Parthalan Duha',67.00, 'img_22.png', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Apinoiden vuosi','Pankaj Gaila',80.00, 'img_23.png', 8);
INSERT INTO `tuote`(`name`, `author`, `price`, `image`, `category_id`) VALUES ('Totuus','Danai Gizem',109.00, 'img_24.png', 8);


insert into asiakas(astunnus, asnimi, salasana, puhelinro, osoite, postitmp, postinro, maa) values 
('Jmankisenmaa', 'Joonas Mankisenmaa', '$2y$10$UwH5lbnWmABfLxUD9mCpOeDgyFZ0pjY02ADDfedYdUQr5kjvqyv2W', '0501233456778', 'Katukuja5', 'Michigan', '90420', 'Hell');


INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Jenni Juurikka', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joonas Mankisenmaa', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Joanna Turunen', 'Oulu', 'työntekijä');
INSERT INTO henkilosto (nimi, postitmp, rooli) 
    VALUES ('Valeria Velichko', 'Oulu', 'työntekijä');
