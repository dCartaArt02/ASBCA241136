Create procedure addnewrental1(
in customer_id int,
in inventory_id int,
in staff_id int,
out newrentalid int
)
begin
    INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, return_date, last_update)
    values (now(), inventory_id, customer_id, staff_id, null, NOW());
    set newrentalid = LAST_INSERT_ID();
end

set @rentalid = 0;
call addnewrental1(5,10,2, @rentalid);
select @rentalid;
