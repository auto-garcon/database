CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserIdByEmail`(IN emailAddress VARCHAR(45) )
BEGIN
	SELECT userID
    FROM Users
    WHERE email = emailAddress;
END