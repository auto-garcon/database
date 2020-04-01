CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserFromToken`(IN iToken TEXT )
BEGIN
	SELECT userID
    FROM Users
    WHERE token = iToken;
END