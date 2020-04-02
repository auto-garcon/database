CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddManagerToRestaurant`(IN userID INT, IN restaurantID INT )
BEGIN
	INSERT INTO RestaurantManagers(userID, restaurantID)
    VALUES (userID, restaurantID);
    
    SELECT LAST_INSERT_ID();
END