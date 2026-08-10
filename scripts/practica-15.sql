#Quinceabo programa sql

create database ConsultasAvanzadas
character set utf8mb4 collate utf8mb4_spanish_ci;
use ConsultasAvanzadas;

create table Estudiante(
Id INT primary key auto_increment,
Nombre VARCHAR(30) ,
Promedio DECIMAL(3,1) null,
Materia_Reprobada ENUM('Español','Quimica','Datos','Programacion','Historia'),
Boleta CHAR(10) unique,
Calificacion_Extra SMALLINT default'0');

insert into Estudiante (Nombre, Promedio, Materia_Reprobada, Boleta, Calificacion_Extra) values
('Joshua', 7.4, 'Datos', '2025090515', 4),
('Ian', 6.5, 'Datos', '2025090213', 6),
('Miguel', null, 'Programacion', '2025090553', 5),
('Alberto', 5.0, 'Quimica', '2025090511', 5),
('Samuel', 7.0, 'Historia', '2025090108', 6),
('Alan', null, 'Español', '2025090230', 5),
('Zadquiel', 8.9, 'Historia', '2025090703', 6),
('Coroy', 9.5, 'Datos', '2025090709', 7),
('Mario', null, 'Programacion', '2025090010', 8),
('Serrrano', 4.5, 'Historia', '2025090609', 0);

rename table Estudiante to Estudiantes;

select*from Estudiantes;

select*from Estudiantes order by Boleta desc;
select*from Estudiantes order by Promedio asc;
select*from Estudiantes where Calificacion_Extra between 6 and 10; 

select*from Estudiantes where Calificacion_Extra='6' or Calificacion_Extra='5';
select*from Estudiantes where Calificacion_Extra='6' and Calificacion_Extra='5';
select*from Estudiantes where Materia_Reprobada!='Historia';
select*from Estudiantes where Promedio is null;
select*from Estudiantes where Promedio is not null;
select*from Estudiantes where Boleta between 2025090515 and 2025090709;
select*from Estudiantes where Boleta between 2025090515 and 2025090709 order by Boleta asc;
select*from Estudiantes where Id in (3, 4, 5);
select*from Estudiantes where Calificacion_Extra=0+5;
select*from Estudiantes where Nombre like '%e%';
select*from Estudiantes where Nombre like 's%';
select*from Estudiantes where Nombre like '%o';

drop database ConsultasAvanzadas;
