CREATE DEFINER=`masterUser`@`%` PROCEDURE `MarkOrderReady`(IN oID INT)
BEGIN
	-- Mark the order status to be ready to go out to a table
    UPDATE Orders
    SET orderStatus = 1
    WHERE orderID = oID;

END