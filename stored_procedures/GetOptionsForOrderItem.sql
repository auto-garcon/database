CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForOrderItem`(IN oItemID INT)
BEGIN
	SELECT subQ.optionID, subQ.optionName, (subQ.price * OrderItem.quantity) AS price
    FROM
		(SELECT *
		FROM Options 
		WHERE Options.optionID IN (SELECT OrderItemHasOptions.optionID
							FROM OrderItemHasOptions
							WHERE OrderItemHasOptions.orderItemID = oItemID)) AS subQ
		JOIN OrderItemHasOptions ON subQ.optionID = OrderItemHasOptions.optionID
        JOIN OrderItem ON OrderItem.orderItemID = OrderItemHasOptions.orderItemID;
END