CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddOptionToOrderItem`(IN optionID INT, IN orderItemID INT )
BEGIN
	-- Add the given option to the given order item with matching orderItemID -- 
	INSERT INTO OrderItemHasOptions(orderItemID, optionID)
    VALUES (orderItemID, optionID);
    
    -- return the newly created order item option ID --
    SELECT LAST_INSERT_ID() AS newOrderItemOptionID;
END