CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuTime`(IN tID INT)
BEGIN
	DELETE FROM MenuTimes
    WHERE (timeID = tID);
END