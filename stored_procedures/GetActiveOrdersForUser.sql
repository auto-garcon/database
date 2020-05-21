CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetActiveOrdersForUser`(IN uID INT)
BEGIN
	
    -- Select all orders that are toggled active in the Orders table -- 
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 0;
END