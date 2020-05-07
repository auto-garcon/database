CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByTable`(IN tID INT)
BEGIN

	-- Return the restuarant assocaited with the passed table ID --
	SELECT restaurantID
    FROM RestaurantTables
    WHERE tableID = tID;
    
END