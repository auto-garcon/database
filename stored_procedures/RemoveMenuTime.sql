CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuTime`(IN tID INT)
BEGIN

	-- Remove the passed time ID from the MenuTimes table --
	DELETE FROM MenuTimes
    WHERE (timeID = tID);
END