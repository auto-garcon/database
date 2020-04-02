CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantsUserManages`(IN iUserID INT)
BEGIN
	SELECT restaurantID
    FROM RestaurantManagers
    WHERE userID = iUserID;
END