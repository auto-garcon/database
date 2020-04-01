CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewOrder`(IN tableID INT, IN orderTime INT, IN chargeAmount DECIMAL(10,2), IN customerID INT )
BEGIN
	INSERT INTO Orders(tableID, orderTime, chargeAmount, userID, orderStatus)
    VALUES (tableID, orderTime, chargeAmount, customerID, 0);
    
    SELECT LAST_INSERT_ID();
END