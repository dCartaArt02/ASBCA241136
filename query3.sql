CREATE PROCEDURE UpdateCustomerEmail(
    IN p_customer_id INT,
    IN p_new_email VARCHAR(50)
BEGIN
    DECLARE customer_count INT;

    SELECT COUNT(*) INTO customer_count
    FROM customer
    WHERE customer_id = p_customer_id;

    IF customer_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El cliente no existe';
    ELSE

        UPDATE customer
        SET email = p_new_email,
            last_update = CURRENT_TIMESTAMP()
        WHERE customer_id = p_customer_id;
        
        SELECT CONCAT('Email actualizado correctamente para el cliente ID ', p_customer_id) AS Resultado;
    END IF;
END 