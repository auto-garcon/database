CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenuItem`(IN mID INT, IN iName VARCHAR(100), IN idesc TEXT, IN iCategory VARCHAR(100), IN iPrice Decimal(10,2), IN iGluten TINYINT, IN iMeat TINYINT, IN iDairy TINYINT, IN iNuts TINYINT, IN iSoy TINYINT, IN calories INT)
BEGIN
	DECLARE createdMenuItemID INT;
    
	INSERT INTO MenuItem(itemName, description, category, gluten, meat, dairy, nuts, soy, calories, itemStatus)
    VALUES(iName, idesc, iCategory, iGluten, iMeat, iDairy, iNuts, iSoy, calories, 1);
    
    SELECT LAST_INSERT_ID() INTO createdMenuItemID;
    
    CALL updateMenuContains(mID, LAST_INSERT_ID(), iPrice);
    
    SELECT createdMenuItemID;
END