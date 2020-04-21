CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenu`(IN mID INT)
BEGIN
    UPDATE Menu
    SET menuStatus = 0
    WHERE menuID = mID;
END