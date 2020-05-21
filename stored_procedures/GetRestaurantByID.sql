CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByID`(IN rID INT )
BEGIN

	-- Return all restaurants with an ID matching rID --
	SELECT *
    FROM AutoGarcon.Restaurant WHERE restaurantID=rID;
END