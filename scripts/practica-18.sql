#18 programa sql

create database AlumnosProfes
character set utf8mb4 collate utf8mb4_spanish_ci;
use AlumnosProfes;

create table Alumnos (
id_Alumno INT primary key auto_increment,
Nombre_alumno VARCHAR(30) null,
Boleta CHAR(12) unique,
Edad_alumno TINYINT not null,
Calificacion_alumno SMALLINT);

create table Profes (
id_Profe INT primary key auto_increment,
Nombre_profe VARCHAR(30) null,
Edad_profe TINYINT null,
Estado ENUM('Casado','Soltero') not null,
Calificacion_profe SMALLINT);

create table Clase (
id_Clase INT primary key auto_increment,
Nombre_Clase VARCHAR(30) not null,
id_A INT,
constraint fk_id_A foreign key (id_A) 
references Alumnos (id_Alumno)
on update cascade on delete cascade,
id_P INT,
constraint fk_id_P foreign key (id_P) 
references Profes (id_Profe)
on update cascade on delete cascade);

alter table Clase add Profesor_imparte VARCHAR(30) after nombre_Clase;
alter table Clase change Profesor_imparte Profesor VARCHAR(30);
alter table Clase drop column Profesor;

set foreign_key_checks=0;
set foreign_key_checks=1;

alter table Clase drop constraint fk_id_P;
alter table Clase add constraint fk_id_P foreign key (id_P) 
references Profes (id_profe) on delete cascade on update cascade;

show create database alumnosprofes;
show create table alumnos;
show tables;
show columns from alumnos;
show columns from profes;
show columns from clase;

insert into Alumnos (Nombre_alumno, Boleta, Edad_alumno, Calificacion_alumno) values
('Joshua', '2025090515', 18, 4),
('Ian', '2025090717', 17, 5),
('Miguel', '2025090313', 17, 3),
('Sofi', '2025090671', 16, 6),
('Shaggy', '2025090561', 18, 6);

rename table Alumnos to A;
rename table A to Alumnos;

insert into Profes (Nombre_profe, Edad_profe, Estado, Calificacion_profe) values
('Calvillo', 45, 'Casado', 7),
('Roberto', 50, 'Casado', 8),
('Kike', 75, 'Casado', 5),
('Pollo', 40, 'Soltero', 0),
('Liana', 51, 'Soltero', 6);

insert into Clase (Nombre_Clase, id_A, id_P) values
('Matematicas', 1, 1),
('Español', 1, 2),
('Base de Datos', 3, 4),
('Programacion', 2, 5),
('Orientacion', 4,5);

select*from Alumnos;
select*from Profes where Estado='Casado';
select Nombre_Clase from Clase order by id_A desc;

insert into Clase values
(6 ,'Orientacion', 4,5);

delete from Clase where id_Clase='6'; 

update Alumnos set Edad_alumno=Edad_alumno+1 where Calificacion_alumno='6';
update Profes set Edad_profe='45', Estado='soltero' where id_profe='1';
update Clase set nombre_clase='Algoritmia' where id_Clase='5';

select a.Nombre_alumno, c.Nombre_Clase, a.Calificacion_alumno
from Alumnos as a
left join Clase as c
on a.id_alumno=c.id_A;

select p.Nombre_profe, c.Nombre_Clase, p.Calificacion_profe
from Profes as p
right join Clase as c
on p.id_profe=c.id_P;

select a.Nombre_alumno, p.Nombre_profe, c.Nombre_Clase
from Alumnos as a
inner join Clase as c
on a.id_alumno=c.id_A
inner join Profes as p
on p.id_profe=c.id_P;

truncate table clase;

delete from Alumnos;

drop database alumnosprofes;