CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenu`(IN mID INT)
BEGIN

	-- Sets the menuStatus for given menu to 0, or inactive --
    UPDATE Menu
    SET menuStatus = 0
    WHERE menuID = mID;
END
