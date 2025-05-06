USE seguridad_bd;
CALL ingresar_nota(1, 3, 87);
SET @mensaje = '';
CALL sp_insertar_nota(1, 3, 87, @mensaje);
SELECT @mensaje;
