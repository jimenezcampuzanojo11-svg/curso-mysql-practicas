#Septimo programa sql

create database ClasesMusica 
character set utf8mb4 collate utf8mb4_spanish_ci;
use ClasesMusica;

create table alumno (
id_alumnos SMALLINT primary key auto_increment,
nombre_alumno VARCHAR(30) not null,
grupo CHAR(4) default '4IM1',
año_nacimiento DATE);

create table instrumentos (
id_instrumento SMALLINT primary key auto_increment,
nombre_instrumento VARCHAR(25) not null,
tipo ENUM('Cuerdas','Electronico','Otro'),
hora_fabricacion TIME);

show create database ClasesMusica; 
show create table alumno;
show create table instrumentos;

rename table alumno to Alumnos;
rename table instrumentos to Instrumento;

alter table Alumnos change id_alumnos ID_Alumno SMALLINT;
alter table Instrumento change id_instrumento ID_instrumentos SMALLINT;

show tables;
show columns from Alumnos;
show columns from Instrumento;

alter table Alumnos add ID_instrumentos SMALLINT after ID_Alumno;
alter table Instrumento add ID_Alumno SMALLINT after ID_instrumentos;

alter table Alumnos drop column grupo; 
alter table Instrumento drop column tipo;

alter table Alumnos add grupo CHAR(4) default '4IM1';
alter table Instrumento add tipo ENUM('Cuerdas','Electronico','Otro');

insert into Alumnos (ID_Alumno, ID_instrumentos, nombre_alumno, año_nacimiento,grupo) values 
(1, 1, 'Juan', '2009-07-04', '3IM8');

insert into Instrumento (ID_instrumentos, ID_Alumno, nombre_instrumento, hora_fabricacion,tipo) values 
(1, 1, 'Bateria', '09:52:45', 'Otro');

alter table Alumnos add constraint fk_ID_instrumentos foreign key (ID_instrumentos)
references Instrumento (ID_instrumentos) on delete cascade on update cascade;
drop database ClasesMusica;