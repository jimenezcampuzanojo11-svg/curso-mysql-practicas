#23 programa sql

create database funciones
character set utf8mb4 collate utf8mb4_spanish_ci;
use funciones;

create table niño(
id_niño INT primary key auto_increment,
nombre_niño VARCHAR(30),
edad TINYINT,
cumpleaños DATE,
sexo ENUM('hombre','mujer'));

create table legos(
id_lego INT primary key auto_increment,
id INT,
constraint fk_id foreign key(id) references niño(id_niño) on update cascade on delete cascade,
nombre_lego VARCHAR(30),
piezas INT,
franquicia ENUM('MARVEL','DC','STAR WARS','POKEMON','MINECRAFT'));

show columns from niño;
show columns from legos;

insert into niño (nombre_niño, edad, cumpleaños, sexo) values 
('Santiago', 8, '2018-05-12', 'hombre'),
('Sofía', 6, '2020-09-23', 'mujer'),
('Mateo', 10, '2016-01-05', 'hombre'),
('Valentina', 7, '2019-11-14', 'mujer'),
('Sebastián', 9, '2017-03-30', 'hombre'),
('Camila', 5, '2021-07-19', 'mujer'),
('Alejandro', 11, '2015-08-25', 'hombre'),
('Valeria', 4, '2022-12-02', 'mujer'),
('Daniel', 9, '2017-10-10', 'hombre'),
('Mariana', 8, '2018-02-14', 'mujer');

insert into legos (id, nombre_lego, piezas, franquicia) values 
(1, 'Ataque de los Vengadores', 520, 'MARVEL'),
(2, 'Castillo de Princesas', 360, 'MINECRAFT'),
(3, 'Baticueva Secreta', 1037, 'DC'),
(4, 'Centro de Entrenamiento', 240, 'POKEMON'),
(5, 'Destructor Estelar', 1250, 'STAR WARS'),
(6, 'Granja de Aldeanos', 490, 'MINECRAFT'),
(7, 'Salón de la Armadura', 496, 'MARVEL'),
(8, 'Persecución en Ciudad Gótica', 320, 'DC'),
(9, 'Laboratorio del Profesor Oak', 180, 'POKEMON'),
(10, 'Caza Estelar X-Wing', 474, 'STAR WARS');

select*from niño
inner join legos 
on niño.id_niño=legos.id;

delimiter //
create function año_nacimiento (edad_entrada INT) returns INT
reads sql data
begin
declare año_aproximado INT;
set año_aproximado=(edad_entrada-2026)*(-1);
return año_aproximado;
end//
delimiter ;

select año_nacimiento(10) as año_nacimiento;

delimiter //
create function piezas_promedio (piezas_totales INT) returns FLOAT
reads sql data
begin
declare promedio_piezas FLOAT;
set promedio_piezas=piezas_totales/3;
return promedio_piezas;
end//
delimiter ;

select piezas_promedio(360) as piezas_promedio;

delimiter //
create function saludar_niño (nombre VARCHAR(30)) returns VARCHAR(60)
reads sql data
begin
declare saludor VARCHAR(60);
set saludor=concat('¡Hola, ', nombre, '!');
return saludor;
end//
delimiter ; 

select saludar_niño('Sebastián') as saludor;

delimiter //
create function descuento_piezas (piezas_totales SMALLINT) returns SMALLINT
reads sql data 
begin
declare total_piezas SMALLINT;
set total_piezas=piezas_totales-50;
return total_piezas;
end//
delimiter ;

select descuento_piezas(1250) as descuento_piezas;

delimiter //
create function franquicia_larga (nombre_franquicia VARCHAR(20)) returns TINYINT
reads sql data
begin
declare franquicia_nombre TINYINT;
set franquicia_nombre=length(nombre_franquicia);
return franquicia_nombre;
end//
delimiter ; 

select franquicia_larga('STAR WARS') as caracteres, franquicia_larga('MARVEL') as caracteres;

delimiter //
create function mayusculas (nombre_niñe VARCHAR(30)) returns VARCHAR(30) 
reads sql data
begin
declare convertir_mayusculas VARCHAR(30);
set convertir_mayusculas=upper(nombre_niñe);
return convertir_mayusculas;
end//
delimiter ;

select mayusculas('Daniel') as mayusculas;

delimiter //
create function porcentaje (total_piezas SMALLINT) returns FLOAT
reads sql data
begin
declare porcentaje_piezas FLOAT;
set porcentaje_piezas=total_piezas/10;
return porcentaje_piezas;
end//
delimiter ;

select porcentaje(520) as resultado;

delimiter //
create function es_mayor(edad_actual TINYINT) returns TINYINT
reads sql data
begin
declare edad_futura TINYINT;
set edad_futura=edad_actual+10;
return edad_futura;
end//
delimiter ; 

select es_mayor(11) as es_mayor;

delimiter //
create function quitar_espacios (texto_espacios VARCHAR(30)) returns VARCHAR(30) 
reads sql data 
begin
declare texto VARCHAR(30);
set texto=trim(texto_espacios);
return texto;
end//
delimiter ;

select quitar_espacios(' STAR WARS ') as sin_espacios;

delimiter //
create function primer_if (numero_piezas SMALLINT) returns VARCHAR(15)
reads sql data
begin
declare texto VARCHAR(30);
	if numero_piezas>400 then
		set texto='Grande';
	else 
		set texto='Pequeño';
	end if;
return texto;
end//
delimiter ;

select primer_if(490) as tamaño, primer_if(240) as tamaño;

drop function año_nacimiento;
drop function descuento_piezas;
drop function es_mayor;
drop function franquicia_larga;
drop function mayusculas;
drop function piezas_promedio;
drop function porcentaje;
drop function primer_if;

drop database funciones;