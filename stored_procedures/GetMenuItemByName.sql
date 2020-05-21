CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItemByName`(IN iName VARCHAR(255))
BEGIN
	
    -- Return all menu items with names matching the passed iName --
	SELECT *
    FROM AutoGarcon.MenuItem WHERE itemName = iName AND itemStatus = 1;
END