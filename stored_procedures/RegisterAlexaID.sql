CREATE DEFINER=`masterUser`@`%` PROCEDURE `RegisterAlexaID`(IN aID VARCHAR(100), IN tID INT)
BEGIN
	-- Registers an alexa ID for a specific table --
	UPDATE RestaurantTables
    SET alexaID = aID
    WHERE tableID = tID;
END