CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByName`(IN rName VARCHAR(100))
BEGIN
	SELECT * FROM AutoGarcon.Restaurant WHERE restaurantName=rName;
END
