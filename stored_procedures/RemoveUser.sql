CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveUser`(IN userID INT )
BEGIN
	DELETE FROM Users WHERE userID = userID;
END