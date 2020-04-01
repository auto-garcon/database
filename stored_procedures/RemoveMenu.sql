CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenu`(IN mID INT)
BEGIN
    DELETE FROM MenuContains WHERE menuID = mID;
    DELETE FROM MenuTimes WHERE menuID = mID;
    DELETE FROM Menu WHERE menuID = mID;
END