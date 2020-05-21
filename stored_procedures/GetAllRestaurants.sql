CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllRestaurants`()
BEGIN

	-- Returns all the order items for passed orderID --
	SELECT *
    FROM Restaurant;
END