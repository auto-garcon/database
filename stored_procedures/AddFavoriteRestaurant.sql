CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddFavoriteRestaurant`(IN uID INT, IN rID INT)
BEGIN
	-- Adds the input restaurant ID to the input user's favorites if it is not already there --
    
	-- Insert if it doesn't exist --
	IF (SELECT EXISTS(SELECT * FROM FavoriteRestaurants WHERE userID = uID AND restaurantID = rID) = 0) THEN
		INSERT INTO FavoriteRestaurants(userID, restaurantID)
		VALUES (uID, rID);
	END IF;
    
    -- Select the favorite ID --
    SELECT favoriteID
    FROM FavoriteRestaurants
    WHERE userID = uID AND restaurantID = rID;
    
END