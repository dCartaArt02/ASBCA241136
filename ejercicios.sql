CREATE TABLE film_update_log(
log_id int auto_increment primary key,
film_id int,
update_date datetime);

create trigger antes_peli
before update on film
for each row
begin
insert into film_update_log(film_id, update_date)
values(
old.film_id,
old.last_update);
end

update film
set last_update = now()
where film_id = 1;

CREATE TRIGGER check_rental_rate_before_insert
BEFORE INSERT ON film
FOR EACH ROW
BEGIN
    IF NEW.rental_rate <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: rental_rate debe ser mayor que 0';
    END IF;
END

CREATE TABLE customer_update_log(
log_id int auto_increment primary key,
customer_id int,
update_date datetime);

drop trigger antes_customer;

create trigger antes_customer
before update on customer
for each row
begin
insert into customer_update_log(customer_id, update_date)
values(
old.customer_id,
old.last_update);
end

update customer
set last_update = now()
where customer_id = 2;

