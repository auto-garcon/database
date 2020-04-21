CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(100), IN token VARCHAR(300) )
BEGIN
	INSERT INTO Users(firstName, lastName, email, token)
    VALUES (firstName, lastName, email, token);
    
    SELECT LAST_INSERT_ID() AS newUserID;
END