CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveUser`(IN uID INT )
BEGIN

	-- Removes the given user from the Orders and Users tables --
	DELETE FROM Orders WHERE userID = uID;
	DELETE FROM Users WHERE userID = uID;
END