CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateRestaurantTable`(IN alexaID VARCHAR(200), IN tableNumber INT, IN restaurantID INT)
BEGIN

	-- Insert the given values into the RestaurantTables table --
	INSERT INTO RestaurantTables(alexaID, tableNumber, restaurantID)
    VALUES (alexaID, tableNumber, restaurantID);
    
    -- Return the newly genearated insert ID --
    SELECT LAST_INSERT_ID() AS newTableID;
END