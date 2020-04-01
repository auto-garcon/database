CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetActiveOrdersForUser`(IN uID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 0;
END