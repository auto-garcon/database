CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuTimes`(IN mID INT)
BEGIN

	-- Return the times the menu is available for the passed menuID -- 
	SELECT *
    FROM MenuTimes
    WHERE menuID = mID;
END