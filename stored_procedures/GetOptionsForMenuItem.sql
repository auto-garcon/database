CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForMenuItem`(IN iID INT)
BEGIN

	-- Return all the available options for the given menuItem ID --
	SELECT *
    FROM Options
    WHERE optionStatus = 1 AND optionID IN (SELECT ItemHasOptions.optionID FROM ItemHasOptions WHERE ItemHasOptions.itemID = iID);
END