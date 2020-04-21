CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForOrderItem`(IN oItemID INT)
BEGIN
	SELECT *
    FROM Options
    WHERE optionID IN (SELECT OrderItemHasOptions.optionID FROM OrderItemHasOptions WHERE OrderItemHasOptions.orderItemID = oItemID);
END