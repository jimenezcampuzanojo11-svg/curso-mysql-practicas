#21 programa sql

create database procedimientos
character set utf8mb4 collate utf8mb4_spanish_ci;
use procedimientos;

create table Autor (
id_Autor INT primary key auto_increment,
Nombre_Autor VARCHAR(30),
Edad TINYINT,
Correo VARCHAR(30) UNIQUE,
Cantidad_libros SMALLINT);

rename table Autor to Autores;
rename table Autores to Autor;

alter table Autor add Apellido VARCHAR(30) after Nombre_autor;
alter table Autor change Apellido Apellidos VARCHAR(30);
alter table Autor drop column Apellidos;

create table Libros(
id_Libro INT primary key auto_increment,
id_A INT,
constraint fk_id_A foreign key(id_A)
references Autor (id_Autor) 
on delete cascade on update cascade,
Nombre_Libro VARCHAR(30),
Codigo_Libro CHAR(4),
Fecha_publicacion DATE);

alter table Libros drop constraint fk_id_A;
alter table Libros add constraint fk_id_A foreign key(id_A)
references Autor (id_Autor) on delete cascade on update cascade;

set foreign_key_checks=0;
set foreign_key_checks=1;

show create database procedimientos;
show create table Libros;
show tables;
show columns from Autor;
show columns from Libros;

insert into Autor (Nombre_Autor, Edad, Correo, Cantidad_libros) values
('Juan Pérez', 34, 'juan.perez@email.com', 5),
('María Gómez', 28, 'maria.gomez@email.com', 3),
('Carlos López', 45, 'carlos.lopez@email.com', 12),
('Ana Martínez', 52, 'ana.martinez@email.com', 8),
('Luis Rodríguez', 23, 'luis.rodriguez@email.com', 2),
('Elena Fernández', 39, 'elena.fernandez@email.com', 7),
('Pedro Sánchez', 61, 'pedro.sanchez@email.com', 15),
('Laura Díaz', 31, 'laura.diaz@email.com', 4),
('Jorge Torres', 50, 'jorge.torres@email.com', 11),
('Sofía Ramírez', 27, 'sofia.ramirez@email.com', 6);

update Autor set Edad='24' where id_Autor='5';

delete from Autor where id_Autor='5';

insert into Libros (id_A, Nombre_Libro, Codigo_Libro, Fecha_publicacion) values
(1, 'El Misterio de la Noche', 'A001', '2020-05-12'),
(2, 'Cien Años de Travesía', 'B014', '2018-11-23'),
(3, 'Algoritmos y Estructuras', 'C102', '2023-01-15'),
(4, 'Estrellas de Cartón', 'A005', '2015-08-30'),
(6, 'Manual de Base de Datos', 'C103', '2025-06-20'),
(7, 'Crónicas del Futuro', 'B015', '2019-09-11'),
(8, 'Poemas del Alba', 'E009', '2022-12-05'),
(9, 'La Última Frontera', 'A002', '2017-04-18'),
(10, 'Secretos del Océano', 'D045', '2024-10-02');

select Nombre_Autor as Nombre, Cantidad_Libros as Cantidad from Autor;
select*from Libros where Codigo_Libro like '%A%';
select count(*) as cuenta from Autor where Cantidad_Libros between 2 and 10;
select count(*) into @cantidad from Autor;
select @cantidad as cantidad;

select*from Autor
inner join Libros 
on Autor.id_Autor=Libros.id_A;

create view vista_TODO as
select*from Autor
inner join Libros 
on Autor.id_Autor=Libros.id_A;

select*from vista_TODO;

set @variable ='0';
set @variablita='0';
set @variablota='0';

select @variable, @variablita, @variablota;

select avg(Cantidad_Libros) into @variable from Autor;
select avg(Edad) into @variablita from Autor;
select count(id_A) into @variablota from Libros;

select @variable, @variablita, @variablota;

delimiter //
create procedure Letra_inicial(in letra CHAR)
begin
select*from Autor where Nombre_Autor like concat('%',letra,'%');
end//
delimiter ;

delimiter //
create procedure procedimiento (in letra CHAR, out cuenta INT)
begin
select count(*) into cuenta from Autor where Nombre_Autor like concat('%',letra,'%'); 
end//
delimiter ;

delimiter //
create procedure salida (out contado INT)
begin
select count(*) into contado from Autor;
end//
delimiter ;

call Letra_inicial('s');
call procedimiento('a', @cuenta);
call salida(@contado);

select @cuenta;
select @contado;

drop procedure Letra_inicial;
drop procedure procedimiento;
drop procedure salida;

truncate table Libros;

delete from Autor;

drop database procedimientos;