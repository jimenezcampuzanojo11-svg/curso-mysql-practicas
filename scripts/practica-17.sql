#Diecisietavo programa sql

create database ArtistaCanciones
character set utf8mb4 collate utf8mb4_spanish_ci;
use ArtistaCanciones;

create table Cantante(
id_Artista INT primary key auto_increment,
Nombre_Artista VARCHAR(30) default 'anonimo',
Año_nacimiento YEAR not null,
Ingresos DECIMAL(7,2) null);

rename table Cantante to Artista;

create table Canciones(
id_Cancion INT primary key auto_increment,
id_Artista INT,
Nombre_Cancion VARCHAR(30) default ' ',
Fecha_Horas DATETIME not null);

alter table Canciones add Ingresos_generaros FLOAT not null after Fecha_Horas;
alter table Canciones change Ingresos_generaros Ingresos DECIMAL(7,2) null after Nombre_Cancion;
alter table Canciones drop column Ingresos;
alter table Canciones add constraint fk_id_Artista foreign key (id_Artista) 
references Artista (id_Artista) on update cascade on delete cascade;

set foreign_key_checks=0;
set foreign_key_checks=1;

alter table Canciones drop constraint fk_id_Artista;
alter table Canciones add constraint fk_id_Artista foreign key (id_Artista) 
references Artista (id_Artista) on update cascade on delete cascade;

show create database ArtistaCanciones;
show create table Artista;
show tables;
show columns from Artista;
show columns from Canciones;

insert into Artista (Nombre_Artista, Año_nacimiento, Ingresos) values
('Eminem', '1990', 15070.66),
('Michael', '1976', 99999.99),
('Dua', '1996', 80000.00),
('Zoe', '1986', 57689.12),
('Harry', '1995', 10000.50);

insert into Canciones (id_Artista, Nombre_Cancion, Fecha_Horas) values
(1, 'Superman', '2026-06-11 09:54:34'),
(2, 'Criminal', '2025-06-07 05:30:00'),
(3, 'Love', '2015-03-15 03:33:33'),
(4, 'Labios', '2012-12-12 10:10:10'),
(5, 'Ey', '2017-03-29 11:59:59');

update Artista set Ingresos='25070.10'  where id_Artista='1';
update Artista set Ingresos=Ingresos+707 where id_Artista='1';
update Artista set Ingresos=Ingresos-1000 where Nombre_Artista like '%e%';

insert Artista (Nombre_Artista, Año_nacimiento, Ingresos) values
('Eminem', '1990', 15070.66);

delete from Artista where id_Artista='6';

select*from Artista;
select count(id_Cancion) as cuenta from Canciones group by Nombre_Cancion;
select Fecha_Horas from Canciones order by Fecha_Horas desc;

alter table Canciones change id_Artista id_fk INT after id_Cancion;

select a.id_Artista, a.Nombre_Artista, a.Año_nacimiento, a.Ingresos, c.Nombre_Cancion, c.Fecha_Horas
from Artista as a
inner join Canciones as c
on a.id_Artista=c.id_fk;

select a.Nombre_Artista, a.Año_nacimiento, a.Ingresos, c.Nombre_Cancion, c.Fecha_Horas
from Artista as a
left join Canciones as c
on a.id_Artista=c.id_fk;

select a.Nombre_Artista, c.Nombre_Cancion, a.Año_nacimiento, c.Fecha_Horas, a.Ingresos
from Artista as a
right join Canciones as c
on a.id_Artista=c.id_fk;

delete from Artista;

truncate table Canciones;

drop database ArtistaCanciones;