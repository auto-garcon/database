CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuItem`(IN iID INT)
BEGIN

	-- Sets the menu status for the given menu Item to 0, or inactive --
    UPDATE MenuItem
    SET itemStatus = 0
    WHERE itemID = iID;
END