CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewOrder`(IN tableID INT, IN customerID INT )
BEGIN
	
	-- Insert the passed values into the order table --
	INSERT INTO Orders(tableID, orderTime, userID, orderStatus)
    VALUES (tableID, NOW(), customerID, 0);
    
    -- Return the newly generated insert id -- 
    SELECT LAST_INSERT_ID() AS newOrderID;
END