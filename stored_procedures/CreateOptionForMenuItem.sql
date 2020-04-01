CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateOptionForMenuItem`(IN optionName VARCHAR(100), IN price DECIMAL(10,2), IN itemID INT )
BEGIN
	DECLARE oID INT;
	-- INSERT IF DOESN'T EXIST --
	IF (SELECT EXISTS(SELECT * FROM Options WHERE optionName = optionName AND price = price) = 0) THEN
		INSERT INTO Options(optionName, price)
		VALUES (optionName, price);
	END IF;
    
    SELECT optionID INTO oID FROM Options WHERE optionName = optionName AND price = price;
    
    -- Update contains table --
    INSERT INTO ItemHasOptions(itemID, optionID)
    VALUES(itemID, optionID);
    
    SELECT LAST_INSERT_ID();
END