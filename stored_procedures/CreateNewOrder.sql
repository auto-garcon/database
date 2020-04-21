CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewOrder`(IN tableID INT, IN customerID INT )
BEGIN
	INSERT INTO Orders(tableID, orderTime, userID, orderStatus)
    VALUES (tableID, NOW(), customerID, 0);
    
    SELECT LAST_INSERT_ID() AS newOrderID;
END