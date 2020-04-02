CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserIdByEmail`(IN email VARCHAR(45) )
BEGIN
	SELECT userID
    FROM Users
    WHERE email = email;
END