CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddManagerToRestaurant`(IN userID INT, IN restaurantID INT )
BEGIN

	-- Adds a user as a manager to a specified restaurant -- 
	INSERT INTO RestaurantManagers(userID, restaurantID)
    VALUES (userID, restaurantID);
    
    -- Return the newly created manager ID -- 
    SELECT LAST_INSERT_ID() AS newManagerID;
END