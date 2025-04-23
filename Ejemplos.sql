create trigger after_customer_insert after
insert
  on customer for each row begin
insert into
  audit_customer_insert (customer_id, full_name)
values
  (
    NEW.customer_id,
    concat(NEW.first_name, ' ', NEW.last_name)
  );

end
insert into
  customer (
    store_id,
    first_name,
    last_name,
    email,
    address_id,
    active,
    create_date,
    last_update
  )
values
  (
    1,
    'juan',
    'perez',
    'juan.perez@example.com',
    1,
    1,
    NOW(),
    NOW()
  );

create trigger before_customer_email_update before
update on customer for each row begin
insert into
  audit_customer_email_change (customer_id, old_email, new_email)
values
  (OLD.customer_id, OLD.email, NEW.email);

end
update customer
set
  email = 'nuevo.email@example.com'
where
  customer_id = 1;

create trigger after_customer_delete after delete on customer for each row begin
insert into
  audit_customer_delete (customer_id, full_name)
values
  (
    OLD.customer_id,
    concat(old.first_name, ' ', old.last_name)
  );

end
delete from payment
where
  customer_id = 1;

delete from rental
where
  customer_id = 1;

delete from customer
where
  customer_id = 1;