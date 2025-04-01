create procedure AddNewCustomer(
    in storeid int,
    in first_name varchar(45),
    in last_name varchar(45),
    in email varchar(50),
    in address_id int,
    in active char(1),
    out newCustomerId int
)
begin
    INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date, last_update)
    VALUES (store_id, first_name, last_name, email, address_id, active, NOW(), NOW());
    
    SET newCustomerID = LAST_INSERT_ID();
end 

set @newId = 0;
Call AddNewCustomer(1, 'juan', 'perez', 'juan.perez@gmail.com', 5, 1, @newId);

select @newID;


