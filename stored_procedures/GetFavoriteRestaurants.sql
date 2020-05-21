CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetFavoriteRestaurants`(IN inputUserID int)
BEGIN

	-- Pulls the user associated with the passed inputUserID --
	SELECT Restaurant.*
    FROM Restaurant JOIN FavoriteRestaurants
    ON FavoriteRestaurants.restaurantID = Restaurant.restaurantID
    WHERE FavoriteRestaurants.userID = inputUserID;
	
END