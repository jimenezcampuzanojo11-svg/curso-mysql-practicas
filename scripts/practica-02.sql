#Segundo programa sql 

create database tablas
character set utf8mb4 collate utf8mb4_spanish_ci;
use tablas;

create table usuario (
id INT auto_increment primary key, 
nombre VARCHAR(20) default 'sin_nombre',
apellido VARCHAR(20) default 'sin_apellido',
numero_telefonico CHAR(12) not null,
fecha_nacimiento DATE not null,
correo_electronico VARCHAR(100) unique 
);

drop database tablas;