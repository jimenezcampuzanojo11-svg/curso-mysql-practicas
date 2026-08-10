#22 programa sql

create database operaciones
character set utf8mb4 collate utf8mb4_spanish_ci;
use operaciones;

create table Usuario(
id_usuario INT primary key auto_increment,
nombre_usuario VARCHAR(50),
edad TINYINT,
color ENUM('blanco','negro'),
nacimiento DATE);

create table ropa(
id_ropa INT primary key auto_increment,
id INT,
constraint fk_id foreign key (id)
references Usuario (id_usuario) 
on update cascade on delete cascade,
nombre_ropa VARCHAR(30),
usos SMALLINT,
clima ENUM('calor','normal','frio'));

rename table ropa to ropas;

show columns from Usuario;
show columns from ropas;

insert into Usuario (nombre_usuario, edad, color, nacimiento) values
('Carlos Mendoza', 25, 'blanco', '2001-05-14'),
('Ana Rodriguez', 34, 'negro', '1992-11-23'),
('Luis Gomez', 25, 'blanco', '2001-02-08'),
('Maria Carmen', 45, 'negro', '1981-08-30'),
('jorge ramirez', 22, 'blanco', '2004-04-12'),
('sofia beltran', 34, 'negro', '1992-09-05'),
('Pedro Infante', 60, 'blanco', '1966-12-01'),
('lucia fernandez', 25, 'negro', '2001-07-19'),
('Diego Torres', 41, 'blanco', '1985-03-27'),
('Elena Vazquez', 29, 'negro', '1997-10-10');

insert into ropas (id, nombre_ropa, usos, clima) values
(1, 'Camiseta algodon', 15, 'calor'),
(2, 'Chaqueta de cuero', 5, 'frio'),
(3, 'Pantalon mezclilla', 20, 'normal'),
(4, 'Sudadera con gorro', 12, 'frio'),
(5, 'Short deportivo', 15, 'calor'),
(6, 'Sueter de lana', 5, 'frio'),
(7, 'Vestido de verano', 8, 'calor'),
(8, 'Gabardina larga', 3, 'frio'),
(9, 'Camisa casual', 20, 'normal'),
(10, 'Chamarra termica', 5, 'frio');

select left(nombre_ropa, 1) from ropas;
select left(nombre_usuario, 1) as inicial from Usuario;
select left(color, 5) as tono_piel from Usuario where nacimiento between 1981-08-30 and  2004-04-12;
select left(clima, 3) as letras from ropas;

delimiter //
create procedure usos_clima (in nombre_clima varchar(10))
begin
update ropas set usos=usos+2 where clima=nombre_clima;
select usos from ropas where clima=nombre_clima;
end//
delimiter ;

call usos_clima('frio');

delimiter //
create procedure ropas_usuario (in yd TINYINT, out cantidad TINYINT) 
begin
select count(*) into cantidad from ropas where id=yd;
end//
delimiter ;

call ropas_usuario(1, @cantidad);

select @cantidad;

delimiter //
create procedure envejecer (in envejecer_usos TINYINT)
begin
update ropas set usos=usos+5 where id=envejecer_usos;
select usos from ropas where id=envejecer_usos;
end//
delimiter ;

call envejecer(5);

delimiter //
create procedure obtener_edad (in nombre_exacto VARCHAR(50), out edad_actual TINYINT)
begin
select edad into edad_actual from Usuario where nombre_usuario=nombre_exacto;
end//
delimiter ; 

call obtener_edad('Carlos Mendoza', @edad_actual);

select @edad_actual;

delimiter //
create procedure id_edad (inout variable INT)
begin
select edad into variable from usuario where id_usuario=variable;
end//
delimiter ;

set @variable=1;

call id_edad(@variable);

select @variable as edad_usuario;

delimiter //
create procedure inserta_usuario (in nu VARCHAR(50), in e TINYINT, in c ENUM('blanco', 'negro'), in n DATE)
begin
insert into Usuario (nombre_usuario, edad, color, nacimiento) values
(nu, e, c, n);
end//
delimiter ;

call inserta_usuario('Germa Vazquez', 30, 'blanco', '2000-09-10');

select*from Usuario;

delimiter //
create procedure eliminar_usuario (in id_eliminar INT)
begin
delete from Usuario where id_usuario=id_eliminar;
end//
delimiter ;

call eliminar_usuario(11);

select*from Usuario;

delimiter //
create procedure promedio_usos (in clima_especifico ENUM('calor','normal','frio'), out promedio FLOAT)
begin
select avg(usos) into promedio from ropas where clima=clima_especifico;
end//
delimiter ;

call promedio_usos ('frio', @promedio);

select @promedio as promedio;

delimiter //
create procedure datos_personales (in id_per INT, out nombre_per VARCHAR(50), out nacimiento_per DATE)
begin
select nombre_usuario into nombre_per from usuario where id_usuario=id_per;
select nacimiento into nacimiento_per from usuario where id_usuario=id_per;
end//
delimiter ;

call datos_personales(1, @nombre_per, @nacimiento_per);

select @nombre_per as nombre, @nacimiento_per as fecha_nacimiento;

delimiter //
create procedure normalizar_clima (in nombre_vesti VARCHAR(30))
begin
update ropas set clima='normal' where nombre_ropa=nombre_vesti;
end//
delimiter ;

call normalizar_clima('Chaqueta de cuero');

select nombre_ropa, clima from ropas;

drop procedure datos_personales;
drop procedure eliminar_usuario;
drop procedure envejecer;
drop procedure id_edad;
drop procedure inserta_usuario;
drop procedure normalizar_clima;
drop procedure obtener_edad;
drop procedure promedio_usos;

create view vista_porque_XD as
select*from usuario
inner join ropas
on usuario.id_usuario=ropas.id;

select*from vista_porque_XD;

create view vista_uwu as
select u.nombre_usuario, u.edad, u.color, u.nacimiento, r.nombre_ropa, r.usos, r.clima
from usuario as u
inner join ropas as r
on u.id_usuario=r.id;

select*from vista_uwu;

delimiter //
create function primera_funcion (numero INT) returns FLOAT
reads sql data
begin
declare variable FLOAT;
select avg(edad) into variable from Usuario where id_usuario=numero;
return variable;
end//
delimiter ;

select primera_funcion(10) as edad_funcion;

delimiter //
create function segunda_funcion (letra CHAR) returns INT
reads sql data
begin
declare x INT;
select count(*) into x from ropas where nombre_ropa like concat('%',letra,'%');
return x;
end//
delimiter ;

select segunda_funcion('j') as primera_letra;

drop database operaciones;