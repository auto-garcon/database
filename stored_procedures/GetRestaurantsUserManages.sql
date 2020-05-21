CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantsUserManages`(IN iUserID INT)
BEGIN

	-- Return restaurant associated with the given manager ID --
	SELECT restaurantID
    FROM RestaurantManagers
    WHERE userID = iUserID;
END