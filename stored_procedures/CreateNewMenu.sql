CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenu`(IN startTime INT, IN endTime INT, IN mStatus INT, IN  menuName varchar(255), IN restaurantID INT)
BEGIN 

	-- Create a new variable, menuID -- 
	DECLARE menuID INT;
    INSERT INTO Menu(menuStatus, menuName, restaurantID) 
	VALUES(mStatus, menuName, restaurantID); 
    
    -- Store the newly generated insert ID into the variable menuID --
    SELECT LAST_INSERT_ID() INTO menuID;
    
    -- Insert the menuID, start and end time into MenuTimes table -- 
    INSERT INTO MenuTimes( menuID, startTime, endTime) 
	VALUES( (SELECT LAST_INSERT_ID() ), startTime, endTime);   
    
    -- Return the menuID -- 
    SELECT menuID;

END