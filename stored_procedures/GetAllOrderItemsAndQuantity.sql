CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllOrderItemsAndQuantity`(IN myOrderID INT)
BEGIN
	SELECT MenuItem.itemName, OrderItem.quantity
	FROM MenuItem JOIN OrderItem ON MenuItem.itemID = OrderItem.menuItemID
	WHERE orderID = myOrderID;
END