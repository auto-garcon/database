CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuItem`(IN iID INT)
BEGIN
    DELETE FROM MenuContains WHERE menuItemID = iID;
    DELETE FROM MenuItem WHERE itemID = iID;
END