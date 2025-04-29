CREATE PROCEDURE insert_nota(
    IN p_id_alumno int,
    IN p_materia varchar(100),
    IN p_nota DECIMAL (5,2)
    )
    Begin
    insert into notas(id_alumno, materia,nota)
    values (p_id_alumno, p_materia, p_nota);
    select * from notas where id_nota = LAST_INSERT_ID();
    end
    

