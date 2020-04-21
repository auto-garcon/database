CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddItemToOrder`(IN orderIDToAddTo INT, IN menuItemIDToAdd INT, IN menuID INT, IN quantityToAdd INT, IN commentsToAdd TEXT)
BEGIN
	DECLARE inputPrice DECIMAL(10,2);
	SELECT price
    FROM MenuContains 
    WHERE MenuContains.menuId = menuID AND MenuContains.menuItemID = menuItemIDToAdd INTO inputPrice;
    
    
	INSERT INTO OrderItem (menuItemID, quantity, comments, orderID, price)
    VALUES (menuItemIDToAdd, quantityToAdd, commentsToAdd, orderIDToAddTo, inputPrice * quantityToAdd);
    
    SELECT LAST_INSERT_ID() AS newOrderItemID;
END