CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllOrderItemsFromOrder`(IN myOrderID INT)
BEGIN

	-- Returns all the order items for passed orderID --
	SELECT OrderItem.orderItemID, MenuItem.*, OrderItem.quantity, OrderItem.price, OrderItem.comments
	FROM MenuItem JOIN OrderItem ON MenuItem.itemID = OrderItem.menuItemID
	WHERE orderID = myOrderID;
END