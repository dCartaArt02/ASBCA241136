create user 'notas_user'@'%' identified by 'Lulu12345.'

Grant execute on procedure  alumno_mm180363.insert_nota to 'notas_user'@'%';

GRANT SELECT ON alumno_mm180363.notas to 'notas_user'@'%';

flush privileges;

