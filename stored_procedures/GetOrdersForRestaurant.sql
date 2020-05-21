CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrdersForRestaurant`(IN rID INT)
BEGIN
    -- Gets all of the orders made at a specified restaurant --
    SELECT Orders.*
    FROM Orders JOIN RestaurantTables
    ON Orders.tableID = RestaurantTables.tableID
    WHERE RestaurantTables.restaurantID = rID;

END