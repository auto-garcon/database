CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItembyMenuId`(IN id INT)
BEGIN

	-- Select all active menu items from the passed menu ID --
	SELECT items.*, MenuContains.price, MenuContains.containsID
    FROM MenuContains JOIN (SELECT * FROM AutoGarcon.MenuItem
							WHERE itemID IN (SELECT menuItemID FROM AutoGarcon.MenuContains WHERE menuID=id)
							AND itemStatus = 1) AS items
						ON MenuContains.menuItemID = items.itemID AND MenuContains.menuID = id;
END