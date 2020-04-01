CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetCompletedOrdersForUser`(IN uID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 1;
END