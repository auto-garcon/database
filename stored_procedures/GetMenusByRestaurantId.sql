CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenusByRestaurantId`(IN id int)
BEGIN

	-- Return all menus associated with the passed Restaurant ID --
	SELECT * FROM AutoGarcon.Menu WHERE restaurantID = id;
END