CREATE DEFINER=`masterUser`@`%` PROCEDURE `CompleteOrder`(IN oID INT)
BEGIN
    -- store price of order in temp table
    CALL GetTotalPriceOfOrder(oID);
    
    -- update the order's charge amount to match the total price
    UPDATE Orders
    SET chargeAmount = (SELECT c1 FROM tmp LIMIT 1)
    WHERE orderID = oID;
    
    -- Return the new charge amount
    SELECT chargeAmount
    FROM Orders
    WHERE orderID = oID;

END