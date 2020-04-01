CREATE DEFINER=`masterUser`@`%` PROCEDURE `CompleteOrder`(IN oID INT)
BEGIN
	-- Mark the order inactive (it is now essentially a "reciept")
	UPDATE Orders
    SET orderStatus = 1
    WHERE orderID = oID;
END