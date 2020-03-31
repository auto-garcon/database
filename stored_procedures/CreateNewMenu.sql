DELIMITER //
CREATE PROCEDURE CreateNewMenu(IN startTime INT, IN endTime INT, IN mStatus INT, IN  menuName varchar(255), IN restaurantID INT, OUT menuID INT) 
  BEGIN 
    INSERT INTO Menu(menuStatus, menuName, restaurantID) 
     VALUES(mStatus, menuName, restaurantID); 
    SELECT LAST_INSERT_ID() INTO menuID; 
    INSERT INTO MenuTimes( menuID, startTime, endTime) 
     VALUES( (SELECT LAST_INSERT_ID() ), startTime, endTime);   
     END //
