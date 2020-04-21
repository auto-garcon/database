CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableByQRCode`(IN qCode VARCHAR(100))
BEGIN
	SELECT tableID
    FROM AutoGarcon.RestaurantTables WHERE qrCode = qCode;
END