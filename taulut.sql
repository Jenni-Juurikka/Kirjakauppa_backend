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

CREATE TABLE asiakas (
astunnus CHAR(16),
asnimi CHAR(50),
puhelinro int(12),
osoite char(50),
postitmp CHAR(35),
postinro CHAR(5),
maa char(30),
asvuosi SMALLINT,
CONSTRAINT asiakas_pk PRIMARY KEY (astunnus),
CONSTRAINT asnimi_un UNIQUE (asnimi)
);

INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (1, 'Christian ja Judith','Marcus Barnes',5.00, 'img.png', 11);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (2, 'Sitten tuli Mo','Lavina Coenraad',4.00, 'img.png', 11);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (3, 'Joku kuten Kathy','Nirav Samo',49.00, 'img.png', 11);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (4, 'Hopeisen pianon kirous','Jessica Andrews',34.00, 'img.png', 12);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (5, 'Kadonnut veljen poika','Pilar Michaela',93.00, 'img.png', 12);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (6, 'Raadeltu banaani','Saku Dobromil',94.00, 'img.png', 12);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (7, 'Ruhjotut kädet','Iris Hawkins',10.00, 'img.png', 13);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (8, 'Lumottu ase','Svanhild Gil',50.00, 'img.png', 13);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (9, 'Mennyt rakastaja','Romulo Yuna',12.00, 'img.png', 13);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (10, 'Galaktiset intohimoiset kynttilänjalka sodat','Lorenzo Martin',21.00, 'img.png', 14);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (11, 'Pienet pistoolisodat','Jasmin Cynthia',78.00, 'img.png', 14);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (12, 'Vaaleanpunainen köysi','Viola Hormizd',100.00, 'img.png', 14);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (13, 'Viimeinen fantasia','Shiva Anderws',49.00, 'img.png', 15);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (14, 'Keijukainen, Reginald Greenway','Linus Jemma',38.00, 'img.png', 15);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (15, 'Hirven uni','Ingrid Valentinus',104.00, 'img.png', 15);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (16, 'Doris ja Tometta - Sharfootin peikonmetsästäjät','Lesley Ferrari Gordon',27.00, 'img.png', 16);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (17, 'Charity ja Slug – Earwax Cityn sankarit','Mijo Sosimo',37.00, 'img.png', 16);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (18, 'Garyn salaisuus','Hadubert Photina',107.00, 'img.png', 16);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (19, 'Darth, vamppyyrintappaja','George King',46.00, 'img.png', 17);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (20, 'Enkelin potku','Conrad Brady',77.00, 'img.png', 17);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (21, 'Salaperäinen, antava poliisi','Domitianus Cornelius',104.00, 'img.png', 17);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (22, '2033, Meritähden vuosi','Parthalan Duha',67.00, 'img.png', 18);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (23, 'Apinoiden vuosi','Pankaj Gaila',80.00, 'img.png', 18);
INSERT INTO `tuote`(`id`, `name`, `author`, `price`, `image`, `category_id`) VALUES (24, 'Totuus','Danai',109.00, 'img.png', 18);

INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (11,'Romanssi');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (12,'Kauhu');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (13,'Rikos');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (14,'Sci-fi');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (15,'Fantasia');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (16,'Lasten kirjallisuus');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (17,'Sarjakuvat');
INSERT INTO `tuoteryhma`(`id`, `name`) VALUES (18,'Dystopia');
