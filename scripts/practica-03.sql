#Tercer programa sql 

create database tabla
character set utf8mb4 collate utf8mb4_spanish_ci;
use tabla;

create table peluches (
id_peluche INT primary key auto_increment,
tipo_tela VARCHAR(30) default 'normal',
poderes VARCHAR(25) not null
);

show tables;
show columns from peluches;
show create table peluches;

drop database tabla;