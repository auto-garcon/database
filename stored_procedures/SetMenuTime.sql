CREATE DEFINER=`masterUser`@`%` PROCEDURE `SetMenuTime`(IN startTime INT, IN endTime INT, IN menuID INT)
BEGIN

	-- Sets the given menu's menu time to the given start and end times --
	INSERT into MenuTimes(menuID, startTime, endTime)
    VALUES (menuID, startTime, endTime);
    
    SELECT LAST_INSERT_ID() AS newTimeID;
END