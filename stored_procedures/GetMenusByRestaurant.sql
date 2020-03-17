CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenusByRestaurantId`(IN id int)
BEGIN
	SELECT * FROM AutoGarcon.Menu WHERE restaurantID = id;
END
