CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserIdByEmail`(IN emailAddress VARCHAR(45) )
BEGIN

	-- Return the user associated with the given email address --
	SELECT userID
    FROM Users
    WHERE email = emailAddress;
END