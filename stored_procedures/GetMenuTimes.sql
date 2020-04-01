CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuTimes`(IN mID INT)
BEGIN
	SELECT *
    FROM MenuTimes
    WHERE menuID = mID;
END