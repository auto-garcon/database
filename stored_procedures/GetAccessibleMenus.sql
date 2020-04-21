CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAccessibleMenus`(IN rID int, IN currentTime INT)
BEGIN
	-- Return all menus of valid time, matching restaurant id, and active status
	SELECT *
    FROM Menu
    WHERE menuID IN (
		SELECT menuID
		FROM MenuTimes
		WHERE currentTime BETWEEN startTime AND endTime)
	AND restaurantID = rID
    AND menuStatus = 1;
    
	-- SELECT * FROM AutoGarcon.Menu WHERE restaurantID = rID AND menuStatus = 1;
END