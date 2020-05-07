CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetFavoriteRestaurants`(IN inputUserID int)
BEGIN

	-- Pulls the user associated with the passed inputUserID --
	SELECT Users.userID, Users.firstName, Users.lastName, Restaurant.restaurantID, Restaurant.restaurantName, Menu.menuID, Menu.menuName, MenuTimes.startTime, MenuTimes.endTime
	
	-- Join the Users and Restaurant tables with the FavoriteRestaurants based on the user and restaurant IDs --
    FROM Users JOIN FavoriteRestaurants ON Users.userID = FavoriteRestaurants.userID
	JOIN Restaurant ON FavoriteRestaurants.restaurantID = Restaurant.restaurantID
	JOIN Menu ON Restaurant.restaurantID = Menu.restaurantID
	
    -- Join the MenuTimes table and Menu table on menus currently avaiable on the FavoriteMenus table--
    JOIN MenuTimes ON Menu.menuID = MenuTimes.menuID
	WHERE Users.userID = inputUserID AND Menu.menuStatus = 1;
END