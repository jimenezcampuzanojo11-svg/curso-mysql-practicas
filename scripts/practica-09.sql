#Noveno codigo sql

create database ClaseAlumnos
character set utf8mb4 collate utf8mb4_spanish_ci;
use ClaseAlumnos;

show tables;
show columns from Clase;
show columns from Alumnos;

insert into Clase (nombre_clase, Profesor) values 
('Calculo','Amada'),
('Biologia','Sonia'),
('Algoritmia','Calvillo'),
('Programacion','Kike');

select*from ClaseAlumnos.Clase;

insert into Alumnos (id, nombre_alumno, Año_nacimiento) values
(1, 'Iker', '2009'), 
(2, 'Ian', '2009'),
(3, 'Alan', '2008'),
(4, 'Alberto', '2010');

select*from ClaseAlumnos.Alumnos;

alter table Alumnos drop constraint id;

drop database ClaseAlumnos;