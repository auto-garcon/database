CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveOption`(IN oID INT )
BEGIN

	-- Sets the option status for the passed option to 0, or inactive -- 
	UPDATE Options
    SET optionStatus = 0
    WHERE optionID = oID;
END