CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuTime`(IN timeID INT)
BEGIN
	DELETE FROM MenuTimes
    WHERE (timeID = timeID);
END