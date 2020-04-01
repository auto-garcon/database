CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItemSides`(IN menuItem INT)
BEGIN
	SELECT MenuItem.itemName
	FROM MenuItem
	WHERE MenuItem.itemID IN
		(SELECT ItemHasSides.sideItemID
		FROM ItemHasSides
		WHERE menuItemID = menuItem);
END