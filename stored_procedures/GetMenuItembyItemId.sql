CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItembyItemId`(IN id INT)
BEGIN

	-- Select the menu item that corresponds to the input id --
	SELECT *
    FROM MenuItem
    WHERE itemID = id;
END