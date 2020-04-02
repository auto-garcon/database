CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(45), IN token TEXT )
BEGIN
	INSERT INTO Users(firstName, lastName, email, token)
    VALUES (firstName, lastName, email, token);
    
    SELECT LAST_INSERT_ID();
END