CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewRestaurant`(IN r_name varchar(100), IN r_descr varchar(100), IN r_address varchar(100), IN r_sales_tax DECIMAL(10,2), IN r_city varchar(100), IN r_state varchar(100), IN r_zip INT, IN r_country varchar(100))
BEGIN
	INSERT into Restaurant(restaurantName, description, address, salesTax, city, state, zipCode, country)
    VALUES(r_name, r_descr, r_address, r_sales_tax, r_city, r_state, r_zip, r_country);
    
    SELECT LAST_INSERT_ID();
END