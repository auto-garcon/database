CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableByAlexaID`( IN aID VARCHAR(200) )
BEGIN 
	-- Gets the table that corresponds to the input alexa ID
	SELECT * FROM AutoGarcon.RestaurantTables
	WHERE alexaID = aID; 
END