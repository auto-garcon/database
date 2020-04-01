CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForMenuItem`(IN iID INT)
BEGIN
	SELECT *
    FROM Options
    WHERE optionID IN ( SELECT * FROM Options JOIN ItemHasOptions ON ItemHasOptions.itemID = iID);
END