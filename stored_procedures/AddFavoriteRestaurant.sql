CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddFavoriteRestaurant`(IN userId INT, IN rID INT)
BEGIN
	
    -- Adds favorite restaurant(s) to a specified user with a restuarant ID --

	INSERT INTO	FavoriteRestaurants (userID, restaurantID)
    VALUES(userId, rID);
    
    -- Return the newly created favorite ID -- 
    SELECT LAST_INSERT_ID() AS newFavoriteID;
    
END