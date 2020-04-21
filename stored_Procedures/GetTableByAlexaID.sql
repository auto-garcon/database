CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableByAlexaID`(IN aID VARCHAR(100))
BEGIN
	SELECT tableID
    FROM AutoGarcon.RestaurantTables WHERE alexaID = aID;
END