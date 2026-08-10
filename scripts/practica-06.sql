#Sextor programa sql

create database Datos 
character set utf8mb4 collate utf8mb4_spanish_ci;
use Datos;

create table instrumentos(
id INT primary key auto_increment,
complementos VARCHAR(30) unique,
tipo ENUM('Cuerdas','Electronico','Bateria') not null);

show create database Datos;
show tables;
show columns from instrumentos;

rename table instrumentos to Instrumento;

alter table Instrumento add año_creacion DATE default (00-00-0000);

show columns from Instrumento;

alter table Instrumento add nombre CHAR(30) unique after id;
alter table Instrumento change nombre Nombre VARCHAR(30);
alter table Instrumento drop column año_creacion;

insert into Instrumento (Nombre,complementos,tipo) values
('Guitarra', 'pua','Cuerdas'),
('Piano', 'cable','Electronico'),
('Bateria', 'baquetas', 'Bateria'),
('Flauta','ninguno','Electronico');

drop database Datos;