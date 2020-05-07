CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByName`(IN rName VARCHAR(100) )
BEGIN

	-- Return all restaurants with a name matching rName --
	SELECT *
    FROM AutoGarcon.Restaurant WHERE restaurantName=rName;
END