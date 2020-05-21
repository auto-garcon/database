CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddItemToOrder`(IN orderIDToAddTo INT, IN menuItemIDToAdd INT, IN menuID INT, IN quantityToAdd INT, IN commentsToAdd VARCHAR(250))
BEGIN
	
    -- Declare a new variable, inputPrice  -- 
	DECLARE inputPrice DECIMAL(10,2);
	SELECT price
    FROM MenuContains 
    -- Store the price from MenuContains for menuItem into the inputPrice variable -- 
    WHERE MenuContains.menuId = menuID AND MenuContains.menuItemID = menuItemIDToAdd INTO inputPrice;
    
    
    -- Add the menuItem into the OrderItem by orderID -- 
	INSERT INTO OrderItem (menuItemID, quantity, comments, orderID, price)
    VALUES (menuItemIDToAdd, quantityToAdd, commentsToAdd, orderIDToAddTo, inputPrice * quantityToAdd);
    
    -- Return the newly created order item ID  --
    SELECT LAST_INSERT_ID() AS newOrderItemID;
END