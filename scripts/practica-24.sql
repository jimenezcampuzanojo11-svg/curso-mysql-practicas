#24 programa sql

create database disparos
character set utf8mb4 collate utf8mb4_spanish_ci;
use disparos;

create table funkos (
id_funko INT primary key auto_increment,
nombre VARCHAR(30) not null,
franquicia ENUM('MARVEL','DC','STAR WARS','SKIBIDI TOILET','INDEPENDIENTE'),
serie SMALLINT unique,
cabezon CHAR(2) default 'SI',
año_fabricacion YEAR null,
hora_fabricacion TIMESTAMP);

create table historial_funkos(
id_historial INT primary key auto_increment,
id INT,
accion VARCHAR(50),
fecha_hora TIMESTAMP default current_timestamp);

show columns from funkos;
show columns from historial_funkos;

insert into funkos (nombre, franquicia, serie, año_fabricacion) values
('Spider-Man', 'MARVEL', 101, 2021),
('Batman', 'DC', 102, 2022),
('Darth Vader', 'STAR WARS', 103, 2020),
('Iron Man', 'MARVEL', 104, 2019),
('Superman', 'DC', 105, 2023),
('Baby Yoda', 'STAR WARS', 106, 2021),
('Titan Speakerman', 'SKIBIDI TOILET', 107, 2024),
('Spawn', 'INDEPENDIENTE', 108, 2018),
('Thor', 'MARVEL', 109, 2017),
('The Joker', 'DC', 110, 2015);

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger inserta_funko after insert on funkos
for each row
begin
	insert into historial_funkos (id, accion) values 
	(new.id_funko, 'Se agrego un funko');
end//
delimiter ;

insert into funkos (nombre, franquicia, serie, año_fabricacion) values
('Man-Spider', 'MARVEL', 111, 2021);

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger eliminar_funko after delete on funkos
for each row
begin
	insert into historial_funkos (id, accion) values 
    (old.id_funko, 'se elimino un funko');
end//
delimiter ;

delete from funkos where id_funko='11';

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger actualizar_funko after update on funkos 
for each row 
begin
	insert into historial_funkos (id, accion) values 
	(new.id_funko, 'Se actualizo un funko');
end//
delimiter ;

update funkos set nombre='Omni man' where id_funko='8';

select*from funkos;
select*from historial_funkos;

alter table historial_funkos add estadisticas SMALLINT;

delimiter //
create trigger acumulado after insert on funkos
for each row
begin
	insert into historial_funkos (id, accion, estadisticas) values
	(new.id_funko, 'Registror acumulado', 0);
    update historial_funkos set estadisticas=estadisticas+1;
end//
delimiter ;

insert into funkos (nombre, franquicia, serie, año_fabricacion) values
('Darth Maul', 'STAR WARS', 133, 2020);

select*from funkos;
select*from historial_funkos;

alter table historial_funkos add franquicia_pertenenciente VARCHAR(30);

delimiter //
create trigger franquicia_eliminada after delete on funkos
for each row
begin
	insert into historial_funkos (id, accion, franquicia_pertenenciente) values
	(old.id_funko, 'Franquicia eliminada', old.franquicia);
end//
delimiter ;

delete from funkos where id_funko='10';

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger cabezones before insert on funkos
for each row 
begin
	set new.cabezon='SI';
end//
delimiter ;

insert into funkos (nombre, franquicia, serie, cabezon, año_fabricacion) values
('Bane', 'DC', 200, 'NO', 2016);

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger converti_mayusculas before insert on funkos
for each row
begin
	set new.nombre=upper(new.nombre);
end//
delimiter ;

insert into funkos (nombre, franquicia, serie, año_fabricacion) values 
('Supergirl', 'DC', 205, 2023);

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger sumar before update on funkos
for each row
begin
	set new.serie=new.serie+10;
end//
delimiter ;

update funkos set nombre='Supergirl' where id_funko='14';

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger guardar_nombre after update on funkos
for each row
begin
	insert into historial_funkos (accion) values
    (old.nombre);
end//
delimiter ;

update funkos set nombre='Powergirl' where id_funko='14';

select*from funkos;
select*from historial_funkos;

delimiter //
create trigger concatena_nombre after delete on funkos
for each row
begin
	insert into historial_funkos (accion) values
    (concat('funko eliminado ', old.nombre));
end//
delimiter ;

delete from funkos where id_funko='14';

select*from funkos;
select*from historial_funkos;

drop trigger if exists cabezones;
drop trigger if exists converti_mayusculas;
drop trigger if exists inserta_funko;
drop trigger if exists acumulado;
drop trigger if exists sumar;
drop trigger if exists actualizar_funko;
drop trigger if exists guardar_nombre;
drop trigger if exists eliminar_funko;

drop database disparos;