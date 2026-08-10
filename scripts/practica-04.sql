#Cuatro programa sql

create database cambios
character set utf8mb4 collate utf8mb4_spanish_ci;
use cambios;

create table materias(
id_materia INT primary key,
dificultad TINYINT default '0',
nombre VARCHAR(25) not null
);

show tables;
show columns from materias;
show create table materias;

rename table materias to materia;
alter table materia add profesor VARCHAR(30) not null;

show columns from materia;

alter table materia change profesor profesores VARCHAR(30) not null;
alter table materia drop column profesores;

drop database cambios;
