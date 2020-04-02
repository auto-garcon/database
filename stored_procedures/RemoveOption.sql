CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveOption`(IN optionID INT )
BEGIN
	DELETE FROM Options WHERE optionID = optionID;
END