CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateOptionForMenuItem`(IN oName VARCHAR(100), IN oPrice DECIMAL(10,2), IN itemID INT )
BEGIN
	DECLARE oID INT;
	-- INSERT IF DOESN'T EXIST --
	IF (SELECT EXISTS(SELECT * FROM Options WHERE optionName = oName AND price = oPrice AND optionStatus = 1) = 0) THEN
		INSERT INTO Options(optionName, price, optionStatus)
		VALUES (oName, oPrice, 1);
	END IF;
    
    SELECT optionID INTO oID FROM Options WHERE optionName = oName AND price = oPrice;
    
    -- Update contains table --
    INSERT INTO ItemHasOptions(itemID, optionID)
    VALUES(itemID, oID);
    
    SELECT LAST_INSERT_ID() AS newMenuItemOptionID;
END