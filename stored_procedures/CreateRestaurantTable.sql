CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateRestaurantTable`(IN alexaID VARCHAR(100), IN qrCode VARCHAR(100), IN restaurantID INT)
BEGIN
	INSERT INTO RestaurantTables(alexaID, qrCode, restaurantID)
    VALUES (alexaID, qrCode, restaurantID);
    
    SELECT LAST_INSERT_ID() AS newTableID;
END