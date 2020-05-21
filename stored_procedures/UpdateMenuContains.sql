CREATE DEFINER=`masterUser`@`%` PROCEDURE `UpdateMenuContains`(IN mID INT, IN iID INT, IN iPrice Decimal(10,2))
BEGIN

	-- Updates the price on the MenuContains table for the given menu and menuItem --
	INSERT INTO MenuContains(menuID, menuItemID, price)
    VALUES (mID, iID, iPrice);
    
    SELECT LAST_INSERT_ID() AS newMenuContainsID;
    
END