CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuItem`(IN iID INT)
BEGIN
    UPDATE MenuItem
    SET itemStatus = 0
    WHERE itemID = iID;
END