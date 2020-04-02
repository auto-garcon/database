CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrderByID`(IN oID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE orderID = oID;
END