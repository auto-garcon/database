CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetCompletedOrdersForUser`(IN uID INT)
BEGIN

	-- Returns all orders in the Order table that are marked complete --
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 1;
END