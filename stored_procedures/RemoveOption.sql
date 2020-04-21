CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveOption`(IN oID INT )
BEGIN
	UPDATE Options
    SET optionStatus = 0
    WHERE optionID = oID;
END