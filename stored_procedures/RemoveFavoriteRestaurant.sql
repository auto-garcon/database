CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveFavoriteRestaurant`(IN uID INT, IN rID INT)
BEGIN

	-- Removes the restaurant matching the rID from the users uID assocaited favorite restaurants --
	DELETE FROM FavoriteRestaurants
    WHERE userID = uID AND restaurantID = rID;
    
END