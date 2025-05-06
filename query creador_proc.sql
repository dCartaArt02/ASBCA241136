CREATE PROCEDURE ingresar_nota (
IN p_id_alumno INT,
IN p_id_clase INT,
IN p_nota DECIMAL(5,2)
)
BEGIN
INSERT INTO notas (id_alumno, id_clase, nota)
VALUES (p_id_alumno, p_id_clase, p_nota);
END

DROP PROCEDURE ingresar_nota;

USE seguridad_bd;

