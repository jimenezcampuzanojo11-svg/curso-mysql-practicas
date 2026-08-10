#catorceabo codigo sql

create database registros 
character set utf8mb4 collate utf8mb4_spanish_ci;
use registros;

create table Estudiante(
Id INT primary key auto_increment,
Nombre VARCHAR(30) ,
Promedio DECIMAL(3,1) not null,
Materia_Reprobada ENUM('Español','Quimica','Datos','Programacion','Historia'),
Boleta CHAR(10) unique,
Calificacion_Extra SMALLINT default'0');

insert into Estudiante (Nombre, Promedio, Materia_Reprobada, Boleta, Calificacion_Extra) values
('Joshua', 7.4, 'Datos', '2025090515', 4),
('Ian', 6.5, 'Datos', '2025090213', 0),
('Miguel', 6.7, 'Programacion', '2025090553', 5),
('Alberto', 5.0, 'Quimica', '2025090511', 0),
('Samuel', 7.0, 'Historia', '2025090108', 6),
('Alan', 7.2, 'Español', '2025090230', 5),
('Zadquiel', 8.9, 'Historia', '2025090703', 6),
('Coroy', 9.5, 'Datos', '2025090709', 7),
('Mario', 6.9, 'Programacion', '2025090010', 8),
('Serrrano', 4.5, 'Historia', '2025090609', 1);

select Nombre, Promedio from Estudiante where materia_reprobada='Datos';

select Nombre, Materia_Reprobada as Reprobada, Calificacion_Extra as Extra 
from Estudiante where Calificacion_Extra >= '5';

select*from Estudiante where Materia_Reprobada='Historia' and Promedio>5;

select Nombre, Promedio from Estudiante order by Promedio desc; 

select Nombre, Boleta from Estudiante where Promedio>= 6.0 and Promedio<=7.5;

select count(Id) as cantidad from Estudiante;

select max(promedio) as Alto, min(promedio) as Bajo from Estudiante;

select Materia_Reprobada, count(Id) as Reprobados from Estudiante group by Materia_Reprobada;

select Nombre, Promedio, Calificacion_Extra as Extra from Estudiante;