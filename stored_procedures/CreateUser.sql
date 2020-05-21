CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(100))
BEGIN

	-- Insert the given values into the Users table --
	INSERT INTO Users(firstName, lastName, email)
    VALUES (firstName, lastName, email);
    
    -- Return the newly generated inset ID --
    SELECT LAST_INSERT_ID() AS newUserID;
END