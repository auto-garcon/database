CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableID`(IN rID INT, IN tableNum INT)
BEGIN
	-- Gets the unique table identifier based on the restaurant ID and table number
	SELECT tableID
    FROM RestaurantTables
    WHERE restaurantID = rID AND tableNumber = tableNum;
END