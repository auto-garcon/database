CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllRestaurants`()
BEGIN
	SELECT * FROM Restaurant;
END
