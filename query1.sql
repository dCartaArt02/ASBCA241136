CREATE DATABASE alumno_mm180363;

CREATE table alumno(
    id_alumno int auto_increment primary key,
    nombre varchar(100) not null,
    apellido varchar(100)not null,
    fecha_nacimiento date not null);
    
create table notas(
    id_nota int auto_increment primary key,
    id_alumno INT,
    materia varchar(100)not null,
    nota decimal(5,2)not null,
    foreign key (id_alumno) references alumno(id_alumno));
    
insert into alumno(nombre, apellido, fecha_nacimiento) values
('juan', 'perez', '2000-05-14'),
('Ana','Gomez','1999-11-23'),
('Luis','Ramirez','2001-03-10');

insert into notas(id_alumno,materia,nota) values
(1,'Matematicas', 85.90),
(1,'Historia',90.00),
(2,'Matematicas',78.25),
(3,'Historia',88.75),
(3,'Matematicas',92.00);

select * from alumno;

select * from notas;

create user 'CA241136'@'%' identified by 'Carta345617.';

GRANT SELECT, INSERT, UPDATE, DELETE ON alumno_mm180363.* to 'CA241136'@'%';

GRANT CREATE ROUTINE, EXECUTE on alumno_mm180363.* to 'CA241136'@'%';

flush privileges;

