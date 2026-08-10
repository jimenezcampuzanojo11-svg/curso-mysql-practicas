#Octavo programa sql

create database ChikiPeluches
character set utf8mb4 collate utf8mb4_spanish_ci;
use ChikiPeluches;

create table Chiqui(
id_chiki TINYINT primary key auto_increment,
nombre CHAR(4) unique,
año_nacimiento YEAR);

create table Peluche(
id_peluche TINYINT primary key auto_increment,
nombre_peluche VARCHAR(20) default'Delfin',
color VARCHAR(20));

rename table Chiqui to Chiki;
rename table Peluche to Peluches;

alter table Chiki add id_P TINYINT after id_chiki;
alter table Peluches add id_C TINYINT after id_peluche;
alter table Chiki change nombre nombre_chiki CHAR(4) unique;
alter table Chiki drop column id_P;

insert into Chiki (nombre_chiki, año_nacimiento) values 
('Nube', '2023');
insert into Peluches (id_C, nombre_peluche, color) values
(1, 'Spiderman', 'Rojo'),
(1, 'Batman', 'Azul'),
(1, 'Superman', 'Azul');

show create database ChikiPeluches;
show create table Chiki;
show create table Peluches;
show tables;
show columns from Chiki;
show columns from Peluches;

select*from ChikiPeluches.Chiki;
select*from ChikiPeluches.Peluches;

alter table Peluches add constraint fk_id_C foreign key (id_C) 
references Chiki (id_chiki) on delete set null on update set null;

alter table Peluches drop constraint fk_id_C;

drop database ChikiPeluches;