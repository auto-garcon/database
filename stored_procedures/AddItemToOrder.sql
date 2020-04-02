CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddItemToOrder`(IN orderIDToAddTo INT, IN menuItemIDToAdd INT, IN quantityToAdd INT, IN commentsToAdd TEXT)
BEGIN
	INSERT INTO OrderItem (menuItemID, quantity, comments, orderID)
    VALUES (menuItemIDToAdd, quantityToAdd, commentsToAdd, orderIDToAddTo);
    
    SELECT LAST_INSERT_ID();
END