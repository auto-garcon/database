CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddOptionToOrderItem`(IN optionID INT, IN orderItemID INT )
BEGIN
	INSERT INTO OrderItemHasOptions(orderItemID, optionID)
    VALUES (orderItemID, optionID);
    
    SELECT LAST_INSERT_ID();
END