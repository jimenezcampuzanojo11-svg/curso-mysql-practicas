#19 programa sql

create database vistas 
character set utf8mb4 collate utf8mb4_spanish_ci;
use vistas;

create table Mysql (
id_sql INT primary key auto_increment,
Nombre ENUM('Mysql') unique,
Fecha_creacion DATE null,
Peso INT default'50');

rename table Mysql to M;
rename table M to Mysql;

alter table Mysql add Usuarios SMALLINT unique;
alter table Mysql change Usuarios Usuarios INT after Fecha_creacion;
alter table Mysql drop column Usuarios;

create table Usuarios(
id_Usuario INT primary key auto_increment,
Nombre_U VARCHAR(30) not null,
Correo VARCHAR(30) unique,
Edad TINYINT null,
id_SQ INT,
constraint fk_id_SQ foreign key(id_SQ) 
references Mysql (id_sql) 
on update cascade on delete cascade);

set foreign_key_checks=0;
set foreign_key_checks=1;

alter table Usuarios drop constraint fk_id_SQ;
alter table Usuarios add constraint fk_id_SQ foreign key(id_SQ)
references Mysql (id_sql) on update cascade on delete cascade;

show create database vistas;
show create table Mysql;
show tables;
show columns from Mysql;
show columns from Usuarios;

insert into Mysql (Nombre, Fecha_creacion, peso) values 
('Mysql', '2000-03-25', 50);

insert into Usuarios (Nombre_U, Correo, Edad, id_SQ) values
('Jose', 'Jose@gmail.com', 45, 1),
('Kike', 'Kike@gmail.com', 75, 1),
('Calvillo', 'Calvillo@gmail.com', 40, 1),
('Miguel', 'Miguel@gmail.com', 17, 1),
('Conkokla', 'Conkokla@gmail.com', 18, 1);

update Usuarios set Edad=Edad+10 where Edad like '%5%';

delete from Usuarios where Nombre_U='Conkokla';

create view Vista as
select*from Mysql 
where id_sql='1';

drop view Vista;

create view Vista_U as
select Nombre_U, Correo, Edad
from Usuarios 
where id_usuario between 1 and 5;

create view Vista_UM as
select M.id_sql, U.Nombre_U, U.Correo, U.Edad
from Usuarios as U
inner join Mysql as M
on M.id_sql=U.id_SQ;

alter view Vista_UM as
select M.id_sql, U.id_Usuario, U.Nombre_U, U.Correo, U.Edad
from Usuarios as U
left join Mysql as M
on M.id_sql=U.id_SQ;

delete from Mysql;

truncate table Usuarios; 

drop database vistas;