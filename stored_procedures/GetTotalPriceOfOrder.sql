CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTotalPriceOfOrder`(IN orderIDToGet INT)
BEGIN
	DECLARE itemBaseCost, optionsCost, costBeforeTax, salesTaxCost, totalCost INT;
    DECLARE taxPercent DECIMAL(10,2);
    
    -- Get cost of all items together --
	SELECT SUM(MenuContains.price * OrderItem.quantity) INTO itemBaseCost
	FROM OrderItem
	JOIN MenuContains ON OrderItem.menuItemID = MenuContains.menuItemID
	WHERE orderID = orderIDToGet;
    
    -- Get cost of all options added to items -- 
    SELECT SUM(Options.price * OrderItem.quantity) INTO optionsCost
    FROM OrderItem 
    JOIN OrderItemHasOptions ON OrderItem.orderItemID = OrderItemHasOptions.orderItemID
    JOIN Options ON OrderItemHasOptions.optionID = Options.optionID
    WHERE OrderItem.orderID = orderIDToGet;
    
    -- Get restaurant sales tax percent --
    SELECT Restaurant.salesTax INTO taxPercent
    FROM Restaurant WHERE restaurantID IN(
		SELECT restaurantID FROM RestaurantTables
		WHERE tableID IN (SELECT tableID FROM Orders WHERE orderID = orderIDToGet)) LIMIT 1;
    
    SET costBeforeTax = itemBaseCost + optionsCost;
    SET salesTaxCost = costBeforeTax * taxPercent;
    SET totalCost = costBeforeTax + salesTaxCost;
    
    SELECT totalCost;
    
END