#Diecisesavo programa sql

create database cuestionario
character set utf8mb4 collate utf8mb4_spanish_ci;
use cuestionario;

create table Maestro(
Id INT primary key auto_increment,
Nombre VARCHAR(30) ,
Calificacion DECIMAL(3,1) null,
Materia_Imparte ENUM('Español','Quimica','Datos','Programacion','Historia'),
Boleta CHAR(10) unique,
Salario FLOAT default'0');

insert into Maestro (Nombre, Calificacion, Materia_Imparte, Boleta, Salario) values
('Joshua', 7.4, 'Datos', '2025090515', 4000.00),
('Ian', 6.5, 'Datos', '2025090213', 6500.50),
('Miguel', 6.0, 'Programacion', '2025090553', 5700.10),
('Alberto', 5.0, 'Quimica', '2025090511', 5700.20),
('Samuel', 7.0, 'Historia', '2025090108', 6606.16),
('Alan', 7.9, 'Español', '2025090230', 5760.00),
('Zadquiel', 8.9, 'Historia', '2025090703', 6200.99),
('Coroy', 9.5, 'Datos', '2025090709', 7999.99),
('Mario', 3.0, 'Programacion', '2025090010', 8000.01),
('Serrrano', 4.5, 'Historia', '2025090609', 0.00);

select*from Maestro where Nombre like 'J%';

select*from Maestro where Salario>'6000.00';

select Nombre, Materia_Imparte as Materia, Calificacion from Maestro where Materia_Imparte='Datos'; 

select*from Maestro order by Calificacion desc;

select*from Maestro where Materia_Imparte='Historia' and Salario<'6500';

select Nombre, Salario from Maestro where Calificacion is null;

select*from Maestro where calificacion between 6.0 and 8.0;

select Nombre from Maestro where Salario='4000' or Salario='5760' or Salario='7999.99';

alter table Maestro change Materia_Imparte Materia ENUM('Español','Quimica','Datos','Programacion','Historia');

select*from Maestro where Materia in ('Datos', 'Programacion');

select max(Calificacion) as Maximo from Maestro;

select avg(Salario) from Maestro;

select count(Id) as cantidad from Maestro;

select Nombre, Materia from Maestro where Nombre like '%n';

select*from Maestro order by Materia asc;

select*from Maestro where Salario>='6000' and Calificacion<='8.0';

drop database Cuestionario;