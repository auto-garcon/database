CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTotalPriceOfOrder`(IN orderIDToGet INT)
BEGIN
	DECLARE itemBaseCost, optionsCost, costBeforeTax, taxPercent, salesTaxCost, totalCost DECIMAL(10,2);
    
    -- Get cost of all items together --
	SELECT SUM(OrderItem.price) INTO itemBaseCost
	FROM OrderItem
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
        
	-- Account for nulls --
    IF(itemBaseCost IS NULL)
		THEN SET itemBaseCost = 0.0;
	END IF;
    IF(optionsCost IS NULL)
		THEN SET optionsCost = 0.0;
	END IF;
    IF(taxPercent IS NULL)
		THEN SET taxPercent = 0.0;
	END IF;
    
    
    SET costBeforeTax = itemBaseCost + optionsCost;
    SET salesTaxCost = costBeforeTax * taxPercent;
    SET totalCost = costBeforeTax + salesTaxCost;
    
    -- store in temp table for outer calls to use
    DROP TABLE IF EXISTS tmp;
    CREATE TEMPORARY TABLE tmp(c1 DECIMAL(10,2), c2 DECIMAL(10,2), c3 DECIMAL(10,2));
    INSERT INTO tmp(c1,c2,c3)
    VALUES(totalCost,salesTaxCost,costBeforeTax);
    
    SELECT totalCost, salesTaxCost, costBeforeTax;
    
END
