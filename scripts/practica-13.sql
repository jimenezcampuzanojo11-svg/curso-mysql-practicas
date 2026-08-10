#Terceabo programa sql

create database Consultas
character set utf8mb4 collate utf8mb4_spanish_ci;
use Consultas;

create table Restaurante(
id_Restaurante INT primary key auto_increment,
Nombre_Chef VARCHAR(30) unique,
Calificacion DECIMAL(3,1) not null,
Platillo_estrella ENUM('Ensalada','Tacos','Sushi','Pizza','Mariscos'),
Fecha_inaguracion DATE null,
Personal SMALLINT default'20');

insert into Restaurante (Nombre_Chef, Calificacion, Platillo_estrella, Fecha_inaguracion, Personal) values
('Alfonso', 10.0, 'Ensalada', '2019-07-09', 25),
('Ramsey', 9.5, 'Mariscos', '2018-08-22', 100),
('Herrera', 6.7, 'Pizza', '2020-10-01', 35),
('Tellez', 5.0, 'Ensalada', '2015-05-11', 60),
('Poncho', 7.0, 'Tacos', '2013-11-08', 10),
('Paulina', 8.2, 'Sushi', '2009-12-30', 37),
('Betty', 8.9, 'Sushi', '2012-07-03', 21),
('Benito', 7.5, 'Mariscos', '2019-07-09', 5),
('Juan', 9.9, 'Tacos', '2010-10-10', 40),
('Isaias', 4.5, 'Pizza', '2007-06-09', 1);

select*from Restaurante;

select Platillo_estrella from Restaurante;
select Nombre_Chef, Calificacion from Restaurante;
select Platillo_estrella as Platillo, Fecha_inaguracion as Fecha from Restaurante;
select*from Restaurante where Calificacion>5 and Calificacion<10;

select count(id_Restaurante) as id from Restaurante group by Platillo_estrella;
select min(Calificacion) as Mediocre, max(Calificacion) as Excelencia from Restaurante;
select*from Restaurante limit 5;
select*from Restaurante limit 5,3;

select*from Restaurante order by Personal desc;
select*from Restaurante order by Personal asc;

delete from Restaurante where id_Restaurante='10';
delete from Restaurante where Platillo_estrella='Ensalada';

select*from Restaurante;

select*from Restaurante limit 7;
select*from Restaurante limit 2,5;
select*from Restaurante order by Calificacion desc;
select*from Restaurante order by Calificacion asc;
select*from Restaurante where Calificacion<9 and Calificacion>4;

select max(Calificacion) as maximo, min(Calificacion) as minimo from Restaurante;
select count(id_Restaurante) as cantidad from Restaurante group by Platillo_estrella;

select Nombre_Chef as Chef, Calificacion, Platillo_estrella as PE from Restaurante;
select Nombre_Chef as Chef, Calificacion from Restaurante where Calificacion>6;

drop database Consultas;