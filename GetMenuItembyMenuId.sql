CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItembyMenuId`(IN id INT)
BEGIN
	SELECT * FROM AutoGarcon.MenuItem WHERE itemID IN (SELECT menuItemID FROM AutoGarcon.MenuContains WHERE menuID=id);
END