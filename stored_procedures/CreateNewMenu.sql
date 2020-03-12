CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenu`(IN startTime TIME, IN endTime time, IN mStatus INT, in  menuName varchar(255), IN restaurantID INT)
BEGIN
	INSERT into Menu(startTime, endTime, menuStatus, menuName, restaurantID)
    VALUES (startTime, endTime, mStatus, menuName, restaurantID);
END
