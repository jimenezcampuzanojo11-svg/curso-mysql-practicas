#Onceabo programa sql

create database PartidoSelecciones
character set utf8mb4 collate utf8mb4_spanish_ci;
use PartidoSelecciones;

create table Partido(
id_Partido INT primary key auto_increment,
Duracion TINYINT not null default '90',
Fecha DATE unique,
Patrocinadores ENUM('Fifa', 'Coca_Cola', 'Pepsi', 'Gatorare'));

create table Jugadores(
id_Seleccion INT primary key auto_increment,
nombre_portero VARCHAR(30) unique,
jugadores SMALLINT not null default '11',
jugador_estrella VARCHAR(30) null);

rename table Jugadores to Selecciones;

alter table Selecciones add Apellido_portero CHAR(30) null;
alter table Selecciones change Apellido_portero Apellido_portero VARCHAR(30) unique not null;
alter table Selecciones drop column Apellido_portero;
alter table Selecciones add id_P INT after id_Seleccion;

alter table Selecciones add constraint fk_id_P foreign key (id_P) 
references Partido (id_Partido) on delete cascade on update cascade;

show create database PartidoSelecciones;
show create table Partido;
show create table Selecciones;
show tables;
show columns from Partido;
show columns from Selecciones;

set foreign_key_checks=0;

insert into Partido (Duracion, Fecha, Patrocinadores) values 
(90, '2026-07-05', 'Fifa'),
(90, '2026-07-04', 'Coca_Cola'),
(90, '2026-06-28', 'Pepsi'),
(90, '2026-07-01', 'Gatorare');

insert into Selecciones (id_P, nombre_portero, jugadores, jugador_estrella) values
(1, 'Memo', 11, 'Chicharito'),
(2, 'Argentino', 20, 'Messi'),
(3, 'Juanito', 25, 'CR7'),
(4, 'Pedro', 22, 'Yamal');

select*from Partido;
select*from Selecciones;

update Partido set Patrocinadores='Pepsi' where id_Partido='1';
update Selecciones set nombre_portero='Portugaldo', jugador_estrella='Bicho' where id_Seleccion='3';
update Selecciones set jugadores=jugadores+11 where id_Seleccion='1';
update Partido set Duracion=replace(Duracion,90,110);

select*from Partido;
select*from Selecciones;

set foreign_key_checks=1;

alter table Selecciones drop constraint fk_id_P;

select*from Partido;
select*from Selecciones;

truncate table Partido;
truncate table Selecciones;
drop database PartidoSelecciones;