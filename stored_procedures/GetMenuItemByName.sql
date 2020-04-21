CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItemByName`(IN iName VARCHAR(255))
BEGIN
	SELECT *
    FROM AutoGarcon.MenuItem WHERE itemName = iName AND itemStatus = 1;
END