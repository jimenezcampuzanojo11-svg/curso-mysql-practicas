#Decimo programa sql

create database ChefsPlatillos
character set utf8mb4 collate utf8mb4_spanish_ci;
use ChefsPlatillos;

create table cocinero(
id_chef TINYINT primary key auto_increment,
nombre_chef VARCHAR(30) not null,
apellido_chef VARCHAR(30) not null,
Edad SMALLINT default '18',
Telefono CHAR(14));

create table Platillo(
id_platillo TINYINT primary key auto_increment,
nombre_platillo ENUM('Tacos','Pizzas','Sopa','Sushis'),
Costo INT not null,
Año_creacion YEAR not null);

rename table cocinero to Chef;

alter table Chef drop column apellido_chef;
alter table Chef change Telefono Telefono Char(12) default '00_0000_0000';
alter table Chef add id_P TINYINT after id_chef;
alter table Platillo add id_C TINYINT after id_platillo;

alter table Chef add constraint fk_id_P foreign key (id_P)
references Platillo (id_platillo) on delete no action on update no action; 

alter table Platillo add constraint fk_id_C foreign key (id_C)
references Chef (id_chef) on delete restrict on update restrict;

alter table Chef drop constraint fk_id_P;

show create database ChefsPlatillos;
show create table Chef;
show create table Platillo;
show columns from Chef;
show columns from Platillo;

insert into Chef (id_P, nombre_chef, Edad, Telefono) values
(1, 'Juan', null, null),
(2, 'Pepe', '30', '55_5543_6578'),
(3, 'Samuel', '45', null),
(4, 'Herrera', null, '55_6565_0700');

insert into Platillo (id_C, nombre_platillo,Costo, Año_creacion) values
(1, 'Tacos', 150, '1909'),
(2, 'Pizzas', 120, '1978'),
(3, 'Sopa', 135, '1902'),
(4, 'Sushis', 170, '1950');

select*from Chef;
select*from Platillo;

set foreign_key_checks=0;

truncate table Chef;
truncate table Platillo;

select*from Chef;
select*from Platillo;

set foreign_key_checks=1;
drop database ChefsPlatillos;