create user 'carta'@'%' identified by 'Carta345617.';
flush privileges;

grant all privileges on organizacion_mascota.*to 'carta'@'%';
flush privileges;