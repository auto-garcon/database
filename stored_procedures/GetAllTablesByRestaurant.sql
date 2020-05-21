CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllTablesByRestaurant`(IN rID INT)
BEGIN
	
    SELECT * 
    FROM RestaurantTables
    WHERE restaurantID = rID;
END