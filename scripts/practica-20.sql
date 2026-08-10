#20 programa sql

create database Variable
character set utf8mb4 collate utf8mb4_spanish_ci;
use Variable;

create table Alumnos(
id INT primary key auto_increment,
Nombre VARCHAR(30),
Boleta CHAR(10) unique,
Año_nacimiento YEAR not null,
Calificacion DECIMAL(3,1),
Reprobada TEXT null);

alter table Alumnos add Apellido VARCHAR(30);
alter table Alumnos change Apellido Apellidos VARCHAR(30);
alter table Alumnos drop Apellidos;

show create database Variable;
show create table Alumnos;
show tables;
show columns from Alumnos;

insert into Alumnos (Nombre, Boleta, Año_nacimiento, Calificacion, Reprobada) values
('Juan Pérez', '2024010201', 2005, 8.5, 'No'),
('María López', '2024010202', 2006, 9.2, 'No'),
('Carlos Gómez', '2024010203', 2004, 5.4, 'Sí'),
('Ana Martínez', '2024010204', 2005, 10.0, 'No'),
('Luis Rodríguez', '2024010205', 2006, 6.1, 'No'),
('Sofía Hernández', '2024010206', 2005, 4.5, 'Sí'),
('Diego Flores', '2024010207', 2004, 7.8, 'No'),
('Laura Ramírez', '2024010208', 2006, 8.9, 'No'),
('Pedro Castillo', '2024010209', 2005, 5.0, 'Sí'),
('Elena Morales', '2024010210', 2005, 9.5, 'No');

insert into Alumnos values
(11,'Juan Pérez', '2027010207', 2005, 8.5, 'No');

update Alumnos set Nombre='Juanito Perez', Año_nacimiento='2026' where id between 10.5 and 11;

delete from Alumnos where id='11';

select*from Alumnos;

create view vista_Alumnos as
select*from Alumnos order by Calificacion desc;

select*from vista_Alumnos;

update vista_Alumnos set Calificacion=Calificacion-0.1 where id='4';

select*from vista_Alumnos;

delete from vista_Alumnos;

 insert into Alumnos (Nombre, Boleta, Año_nacimiento, Calificacion, Reprobada) values
('Juan Pérez', '2024010201', 2005, 8.5, 'No'),
('María López', '2024010202', 2006, 9.2, 'No'),
('Carlos Gómez', '2024010203', 2004, 5.4, 'Sí'),
('Ana Martínez', '2024010204', 2005, 10.0, 'No'),
('Luis Rodríguez', '2024010205', 2006, 6.1, 'No'),
('Sofía Hernández', '2024010206', 2005, 4.5, 'Sí'),
('Diego Flores', '2024010207', 2004, 7.8, 'No'),
('Laura Ramírez', '2024010208', 2006, 8.9, 'No'),
('Pedro Castillo', '2024010209', 2005, 5.0, 'Sí'),
('Elena Morales', '2024010210', 2005, 9.5, 'No');

alter view vista_Alumnos as
select*from Alumnos order by Calificacion desc;

select*from vista_Alumnos;
select Nombre, Boleta as Identificador, Calificacion from vista_Alumnos 
where Año_nacimiento between 2005 and 2010;
select count(Reprobada) as reprobados from vista_Alumnos where Reprobada='Si';
select count(Reprobada), Reprobada  as cuenta from vista_Alumnos group by Reprobada;

set @variable ='6';

select @variable as variable;

select count(*) as cuenta from vista_Alumnos where Calificacion>@variable;

select count(*) into @Aprobados from vista_Alumnos where Calificacion>@variable;

select @Aprobados;

drop database Variable;