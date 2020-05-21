CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrdersInPast24Hours`(IN uID INT)
BEGIN

	-- Return every order from Orders from the past 24 hours for a given user --
	SELECT * FROM Orders
	WHERE orderTime >= NOW() - INTERVAL 1 DAY AND userID = uID;
END