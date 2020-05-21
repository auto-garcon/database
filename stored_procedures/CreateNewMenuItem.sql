CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenuItem`(IN mID INT, IN iName VARCHAR(100), IN idesc VARCHAR(1024), IN iCategory VARCHAR(100), IN iPrice Decimal(10,2), IN iGluten TINYINT, IN iMeat TINYINT, IN iDairy TINYINT, IN iNuts TINYINT, IN iSoy TINYINT, IN calories INT)
BEGIN

	-- Create variable createdMenuItemID --
	DECLARE createdMenuItemID INT;
    
    -- Insert the passed variables into the MenuItem Table --
	INSERT INTO MenuItem(itemName, description, category, gluten, meat, dairy, nuts, soy, calories, itemStatus)
    VALUES(iName, idesc, iCategory, iGluten, iMeat, iDairy, iNuts, iSoy, calories, 1);
    
    -- Store the generated insert ID into createMenuItemID --  
    SELECT LAST_INSERT_ID() INTO createdMenuItemID;
    
    -- Call the updateMenuContains table to add the menuItem price -- 
    CALL updateMenuContains(mID, LAST_INSERT_ID(), iPrice);
    
    -- Return createdMenuItemID -- 
    SELECT createdMenuItemID;
END