#26 programa sql

create database repaso_de_todo
character set utf8mb4 collate utf8mb4_spanish_ci;
use repaso_de_todo;

select*from mysql.user;

create user 'Juan'@'localhost' identified by 'juancito';

grant update,delete, select,create on *.* to 'Juan'@'localhost';

revoke delete on *.* from 'Juan'@'localhost';

flush privileges;

select*from mysql.user;

create table Empresa(
id_empresa SMALLINT primary key auto_increment,
nombre VARCHAR(30),
ubicacion VARCHAR(100),
año_inaguracion YEAR,
dueño VARCHAR(45),
ganancias INT);

rename table Empresa to Empresas;

alter table Empresas add a INT after id_empresa;
alter table Empresas change a b VARCHAR(2);
alter table Empresas drop column b;

create table Telefono(
id_telefono SMALLINT primary key auto_increment,
id_fk SMALLINT,
constraint fk_id_fk foreign key (id_fk) 
references Empresas (id_empresa) 
on update no action on delete no action,
nombre_telefono VARCHAR(30),
costo SMALLINT,
usuarios INT,
fecha_lanzamiento DATE);

alter table Telefono drop constraint fk_id_fk;
alter table Telefono add constraint fk_id_fk foreign key (id_fk)
references Empresas (id_empresa) on update no action on delete no action;

create table Registro_empresa(
id_registro INT primary key auto_increment,
tiempo TIMESTAMP default current_timestamp,
accion VARCHAR(45));

show create database repaso_de_todo;
show create table Empresas;
show tables;
show grants for 'Juan'@'localhost';
show columns from Empresas;
show columns from Telefono;
show columns from Registro_empresa;

drop user 'Juan'@'localhost';

select*from mysql.user;

insert into Empresas (nombre, ubicacion, año_inaguracion, dueño, ganancias) values 
('Apple', 'California', 1976, 'Steve Jobs', 96000000),
('Samsung', 'Suwon', 1938, 'Lee Byung-chull', 65000000),
('Xiaomi', 'Pekín', 2010, 'Lei Jun', 35000000),
('Huawei', 'Shenzhen', 1987, 'Ren Zhengfei', 40000000),
('Motorola', 'Illinois', 1928, 'Paul Galvin', 15000000),
('Oppo', 'Dongguan', 2004, 'Tony Chen', 12000000),
('Vivo', 'Dongguan', 2009, 'Shen Wei', 11000000),
('Sony', 'Tokio', 1946, 'Masaru Ibuka', 25000000),
('Google', 'California', 1998, 'Larry Page', 80000000),
('OnePlus', 'Shenzhen', 2013, 'Pete Lau', 8000000);

insert into Telefono (id_telefono, id_fk, nombre_telefono, costo, usuarios, fecha_lanzamiento) 
values (101, 1, 'iPhone 15 Pro Max', 1200, 50000000, '2023-09-22');

insert into Telefono (id_fk, nombre_telefono, costo, usuarios, fecha_lanzamiento) values
(2, 'Galaxy S24 Ultra', 1300, 45000000, '2024-01-31'),
(3, 'Xiaomi 14 Ultra', 1000, 20000000, '2024-02-25'),
(4, 'Huawei Pura 70 Ultra', 1100, 15000000, '2024-04-18'),
(5, 'Motorola Edge 50 Ultra', 999, 8000000, '2024-04-16'),
(6, 'Pixel 8 Pro', 999, 12000000, '2023-10-12'),
(7, 'OnePlus 12', 799, 10000000, '2023-12-05'),
(8, 'Oppo Find X7 Ultra', 950, 14000000, '2024-01-08'),
(9, 'Sony Xperia 1 VI', 1399, 3000000, '2024-05-15'),
(10, 'Vivo X100 Pro', 900, 11000000, '2023-11-13');

select*from Empresas;
select*from Telefono;

select*from Empresas where ganancias>15000000 and año_inaguracion>1950;
select*from Telefono where costo<1100 or fecha_lanzamiento<2024-06-13;

select min(año_inaguracion) as minimo, max(año_inaguracion) as maximo from Empresas;
select costo, count(*) as cuenta_costos from Telefono group by costo;

select left(upper(dueño), 1) as Inicial_dueño from Empresas;
select right(upper(nombre_telefono), 1) as Ultima_letra_nombre from Telefono;

set @x=0;
set @y=0;

select min(año_inaguracion), max(año_inaguracion) into @x, @y from Empresas;
select @y-@x as diferencia_de_años;

select e.nombre, t.nombre_telefono, e.dueño, e.ganancias, t.costo, t.usuarios
from Empresas as e
inner join Telefono as t
on e.id_empresa=t.id_fk;

insert into Empresas (nombre, ubicacion, año_inaguracion, dueño, ganancias) values 
('Apple', 'California', 1976, 'Steve Jobs', 96000000);

update Empresas set ganancias=ganancias+10000;

delete from Empresas where id_empresa='11';

create view es_como as
select*from Telefono where nombre_telefono like '%Ultra%';

select*from es_como;

delimiter //
create procedure procedimiento (in i INT)
begin
select concat('El nombre de la empresa es: ', nombre) as nombre from Empresas where id_empresa=i;
end//
delimiter ;

call procedimiento(1);

delimiter //
create function funcion (precio INT) returns FLOAT
reads sql data
begin
declare descuento FLOAT;
	set descuento=precio*0.9;
return descuento;
end//
delimiter ;

select funcion(1000) as descuento;

delimiter //
create trigger triger after update on Telefono
for each row
begin
	insert into Registro_empresa (accion) value
    ('Se hizo una actualizacion uwu');
end//
delimiter ;

update Telefono set costo=costo+1 where id_telefono='105';

select*from Telefono;
select*from Registro_empresa;

drop view es_como;
drop procedure procedimiento;
drop function funcion;
drop trigger triger;
truncate table Registro_empresa;

delete from Telefono;

drop database repaso_de_todo;