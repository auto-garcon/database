DELIMITER //
CREATE PROCEDURE CreateNewMenuItem(IN mID INT, IN iName VARCHAR(100), IN idesc TEXT, IN iCategory VARCHAR(100), IN iPrice Decimal(10,2), IN iGluten TINYINT, IN iMeat TINYINT, IN iDairy TINYINT, IN iNuts TINYINT, IN iSoy TINYINT, OUT menuItemID INT)
	BEGIN
	INSERT INTO MenuItem(itemName, description, category, gluten, meat, dairy, nuts, soy)
        	VALUES(iName, idesc, iCategory, iGluten, iMeat, iDairy, iNuts, iSoy);
    	SELECT LAST_INSERT_ID() INTO menuItemID;
    	call updateMenuContains(mID, LAST_INSERT_ID(), iPrice);
END //
