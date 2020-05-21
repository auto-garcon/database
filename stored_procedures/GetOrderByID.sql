CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrderByID`(IN oID INT)
BEGIN

	-- Select all orders that match the orderID --
	SELECT *
    FROM Orders
    WHERE orderID = oID;
END