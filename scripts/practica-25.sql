#25 programa sql

create database usuarios
character set utf8mb4 collate utf8mb4_spanish_ci;
use usuarios;

create table ETC(
id_etc INT primary key auto_increment,
materia VARCHAR(30),
calificacion TINYINT,
profe VARCHAR(30),
horario TIME);

create table Alumno( 
id_alumno INT primary key auto_increment,
nombre VARCHAR(30),
boleta CHAR(10) unique,
nacimiento YEAR,
promedio DECIMAL(3,2),
presenta_etc CHAR(2) default 'SI');

create table Tiene(
id_tiene INT primary key auto_increment,
id_E INT,
constraint fk_id_E foreign key (id_E)
references ETC (id_etc) 
on update no action on delete no action,
id_A INT,
constraint fk_id_A foreign key (id_A)
references Alumno (id_Alumno) 
on update cascade on delete cascade);

create table Registro(
id_registro INT primary key auto_increment,
accion VARCHAR(30),
tiempo TIMESTAMP default current_timestamp);

rename table ETC to Examen;
rename table Examen to ETC;

alter table  Alumno add cantidad_etc TINYINT after nacimiento;
alter table Alumno change cantidad_etc cantidad SMALLINT;
alter table Alumno drop cantidad;

set foreign_key_checks=0;
set foreign_key_checks=1;

alter table Tiene drop constraint fk_id_A;
alter table Tiene add constraint fk_id_A foreign key (id_A) 
references Alumno (id_alumno) on update set null on delete set null;

show create database usuarios;
show create table ETC;
show tables;
show columns from ETC;
show columns from Alumno;
show columns from Tiene;
show columns from Registro;

insert into ETC (id_etc, materia, calificacion, profe, horario) values
(100, 'Matemáticas', 9, 'Ing. García', '07:00:00'),
(101, 'Programación', 10, 'Lic. Pérez', '08:30:00'),
(102, 'Bases de Datos', 8, 'Dr. Rodríguez', '10:00:00'),
(103, 'Física', 7, 'Mtra. López', '11:30:00'),
(104, 'Química', 9, 'Ing. Sánchez', '13:00:00'),
(105, 'Historia', 10, 'Lic. Gómez', '14:30:00'),
(106, 'Inglés', 8, 'Mtra. Martínez', '16:00:00'),
(107, 'Estructuras de Datos', 9, 'Dr. Hernández', '17:30:00'),
(108, 'Redes', 7, 'Ing. Díaz', '19:00:00'),
(109, 'Álgebra', 8, 'Lic. Flores', '20:30:00');

insert into Alumno (nombre, boleta, nacimiento, promedio) values
('Juan Pérez', '2023600001', 2005, 8.50),
('María López', '2023600002', 2004, 9.20),
('Carlos Gómez', '2023600003', 2005, 6.40),
('Ana Martínez', '2023600004', 2004, 7.80),
('Luis Hernández', '2023600005', 2005, 5.90),
('Sofía Rodríguez', '2023600006', 2003, 9.80),
('Diego Sánchez', '2023600007', 2004, 8.10),
('Laura Díaz', '2023600008', 2005, 7.00),
('Pedro Flores', '2023600009', 2004, 6.10),
('Elena García', '2023600010', 2005, 9.00);

insert into Tiene (id_E, id_A) values
(100, 1),
(101, 2),
(102, 3),
(103, 4),
(104, 5),
(105, 6),
(106, 7),
(107, 8),
(108, 9),
(109, 10);

select*from ETC;
select*from Alumno;
select*from Tiene;

select*from ETC where calificacion between 6 and 10;
select*from Alumno where nacimiento is null;

select max(calificacion) as maximo, min(calificacion) as minimo from ETC;
select avg(promedio) as promedio from Alumno;
select upper(materia) as materia from ETC;
select nacimiento, count(*) as cuenta from Alumno group by nacimiento;

select left(materia, 1) as inicial_materia from ETC;
select right(nombre, 1) as ultima_letra_nombre from Alumno;

insert into ETC (materia, calificacion, profe, horario) values
('Calculo', 5, 'Ing. Parcía', '07:56:10');

update ETC set profe='JulioProfe' where id_etc='110';

delete from ETC where id_etc='110';

set @a=3;
set @b=2;

select @a+@b, @a-@b, @a*@b, @a/@b into @suma, @resta, @multiplicacion, @division;
select @suma as suma, @resta as resta, @multiplicacion as multiplicacion, @division as division;

select t.id_E, t.id_A, a.nombre, a.promedio, e.materia, e.calificacion, e.profe, e.horario
from ETC as e
inner join Tiene as t
on e.id_etc=t.id_E
inner join Alumno as a
on a.id_alumno=t.id_A;

create view vista_lateral_izquierda as
select t.id_E, e.materia, e.calificacion, e.profe, e.horario
from ETC as e
left join Tiene as t
on e.id_etc=t.id_E;

create view vista_lateral_derecha as
select t.id_A, a.nombre, a.boleta, a.nacimiento, a.promedio, a.presenta_etc
from Alumno as a
right join Tiene as t
on a.id_Alumno=t.id_A;

select*from  vista_lateral_izquierda;
select*from vista_lateral_derecha;

delimiter //
create procedure menos_calificacion (in llave INT, out calificacion_real TINYINT)
begin
	select calificacion-1 into calificacion_real from ETC where id_etc=llave;
end//
delimiter ;

call menos_calificacion(100, @calificacion_real);

select @calificacion_real as calificacion_real;

delimiter //
create function año_mayor (año_aparente SMALLINT) returns SMALLINT
reads sql data
begin
declare futuro SMALLINT;
	set futuro=año_aparente+1;
return futuro;
end//
delimiter ;

select año_mayor(2005) as año_futuro;

delimiter //
create trigger actualizacion after update on Alumno
for each row
begin
	insert into Registro (accion) values
    ('Se registro una actualizacion');
end//
delimiter ;

update Alumno set promedio=promedio+0.5 where id_alumno='3';

select*from Alumno;
select*from Registro;

select*from mysql.user;

create user 'Yoshua' identified by '012345'; 
create user 'Miguel'@'localhost' identified by '1234';
create user 'Zadquiel'@'121.16.278.90' identified by '4567';

select*from mysql.user;

grant usage on *.* to 'Yoshua';
grant all privileges on *.* to 'Miguel'@'localhost'; 
grant select, update, delete on *.* to 'Zadquiel'@'121.16.278.90';

flush privileges;

show grants for 'Yoshua'@'%';
show grants for 'Miguel'@'localhost';
show grants for 'Zadquiel'@'121.16.278.90';

revoke update on *.* from 'Zadquiel'@'121.16.278.90';
revoke all privileges, grant option from 'Miguel'@'localhost';

show grants for 'Yoshua'@'%';
show grants for 'Miguel'@'localhost';
show grants for 'Zadquiel'@'121.16.278.90';

drop user if exists 'Yoshua'@'%';
drop user if exists 'Miguel'@'localhost';
drop user if exists 'Zadquiel'@'121.16.278.90';

select*from mysql.user;

drop trigger actualizacion;
drop function año_mayor;
drop procedure menos_calificacion;
drop view vista_lateral_derecha;

delete from registro;
truncate table tiene;

drop database usuarios; 