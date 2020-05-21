CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewRestaurant`(IN rName varchar(100), IN rDescr varchar(100), IN rAddress varchar(100), IN rSalesTax DECIMAL(10,2), IN rCity varchar(100), IN rState varchar(100), IN rZip INT, IN rCountry varchar(100), IN pColor VARCHAR(45), IN sColor VARCHAR(45))
BEGIN

	-- Insert the passed values into the Restaurant table --
	INSERT into Restaurant(restaurantName, description, address, salesTax, city, state, zipCode, country, primaryColor, secondaryColor)
    VALUES(rName, rDescr, rAddress, rSalesTax, rCity, rState, rZip, rCountry, pColor, sColor);
    
    -- Return the newly generated insert ID --
    SELECT LAST_INSERT_ID() AS newRestaurantID;
END