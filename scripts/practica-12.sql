#Doceabo programa sql

create database FarmaciaMedicamentos 
character set utf8mb4 collate utf8mb4_spanish_ci;
use FarmaciaMedicamentos;

create table Tienda(
id_Farmacia INT primary key auto_increment,
Nombre_Farmacia VARCHAR(30) not null,
Codigo_seguridad CHAR(6) unique,
Empleados ENUM('Jefe','Empleado'),
Horario_entrada TIME);

create table Medicamentos(
id_Medicamentos INT primary key auto_increment,
id_F INT,
Nombre_Medicamento VARCHAR(30) not null,
Muestras SMALLINT not null,
Fecha_carducidad DATE);

rename table Tienda to Farmacia;

alter table Farmacia add Nombre_guardia CHAR(30) null after Nombre_Farmacia;
alter table Farmacia change Nombre_guardia Nombre_guardia VARCHAR(30) not null;
alter table Farmacia drop column Nombre_guardia;
alter table Medicamentos add constraint fk_id_F foreign key (id_F)
references Farmacia (id_Farmacia) on delete cascade on update cascade;

show create database FarmaciaMedicamentos;
show create table Farmacia;
show create table Medicamentos;
show tables;
show columns from Farmacia;
show columns from Medicamentos;

set foreign_key_checks=0;
set foreign_key_checks=1;

insert into Farmacia (Nombre_Farmacia, Codigo_seguridad, Empleados, Horario_entrada) values
('Torren','S23DFT','Jefe','15:30:00'),
('Columbia','1WE4FR','Empleado','10:00:00'),
('Guadalajada','ERQ243','Empleado','20:59:59'),
('Similares','FTR5Y7','Empleado','23:59:59'),
('San Pablo','A2C5YU','Jefe','23:59:59');

insert into Medicamentos (id_F, Nombre_Medicamento, Muestras, Fecha_carducidad) values
(1, 'Paracetamol', 500, '2027-07-23'),
(2, 'Morfina', 1000, '2028-06-09'),
(3, 'Sefalosporina', 1500, '2026-07-06'),
(4, 'Tridamina', 999, '2030-09-30'),
(5, 'Setadina', 567, '2027-07-23');

select*from Farmacia;
select*from Medicamentos;

update Medicamentos set Nombre_Medicamento='Aliviax', Muestras=Muestras+700 where id_Medicamentos='1';
update Farmacia set Horario_entrada=replace(Horario_entrada,'23:59:59','12:12:12');

select*from Farmacia;
select*from Medicamentos;

delete from Farmacia where id_Farmacia='1';
delete from Medicamentos where Fecha_carducidad='2027-07-23';
delete from Medicamentos where id_F='3';

select*from Farmacia;
select*from Medicamentos;

alter table Medicamentos drop constraint fk_id_F;

truncate table Farmacia;

delete from Medicamentos;

drop database FarmaciaMedicamentos;