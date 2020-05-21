CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveItemFromMenu`(IN mID INT, IN iID INT)
BEGIN
	-- Removes the input menu item from the input menu ID --
	DELETE FROM MenuContains
    WHERE menuID = mID AND menuItemID = iID;
    
END