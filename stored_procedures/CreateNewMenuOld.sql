 CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenu`(IN mStatus INT, in  menuName varchar(100), IN restaurantID INT, IN startTimes VARCHAR(500), IN endTimes VARCHAR(500) )
sp: BEGIN
	declare pos int;           -- Keeping track of the next item's position
	declare item varchar(100); -- A single item of the input
	declare breaker int;       -- Safeguard for while loop 
	DECLARE maxval, maxval2, val1, val2, ind, menuID INT;
    DECLARE errorCheck INT;
    
    
	-- START TIMES ----
	-- The string must end with the delimiter
	if right(startTimes, 1) <> '|' then
	set startTimes = concat(startTimes, '|');
	end if;

	DROP TABLE IF EXISTS MyTemporaryTable;
	CREATE TEMPORARY TABLE MyTemporaryTable (  id INT, sTime varchar(100) );
	set breaker = 0;

	while (breaker < 2000) && (length(startTimes) > 1) do
	-- Iterate looking for the delimiter, add rows to temporary table.
	set breaker = breaker + 1;
	set pos = INSTR(startTimes, '|');
	set item = LEFT(startTimes, pos - 1);
	set startTimes = substring(startTimes, pos + 1);
    -- ensure we have an integer
    SELECT CAST(item as UNSIGNED) INTO errorCheck;
    if errorCheck = 0 then
		SELECT null;
        LEAVE sp;
	end if;
	insert into MyTemporaryTable values(breaker, item);
	end while;
    
    -- END TIMES --
    -- The string must end with the delimiter
	if right(endTimes, 1) <> '|' then
	set endTimes = concat(endTimes, '|');
	end if;

	DROP TABLE IF EXISTS MyTemporaryTable2;
	CREATE TEMPORARY TABLE MyTemporaryTable2 ( id INT,  eTime varchar(100) );
	set breaker = 0;

	while (breaker < 2000) && (length(endTimes) > 1) do
	-- Iterate looking for the delimiter, add rows to temporary table.
	set breaker = breaker + 1;
	set pos = INSTR(endTimes, '|');
	set item = LEFT(endTimes, pos - 1);
	set endTimes = substring(endTimes, pos + 1);
    -- ensure we have an integer
    SELECT CAST(item as UNSIGNED) INTO errorCheck;
    if errorCheck = 0 then
		SELECT null;
        LEAVE sp;
	end if;
	insert into MyTemporaryTable2 values(breaker, item);
	end while;
    
    
    
    -- LOOP OVER TEMP TABLES AND ADD TIMES FOR MENU----
	SELECT MAX(id) INTO maxval FROM MyTemporaryTable;
    SELECT MAX(id) INTO maxval2 FROM MyTemporaryTable2;
    SET ind = 1;

	if maxval <> maxval2 then
		SELECT null;
		LEAVE sp;
	END IF;
    
	-- Create the menu --
    INSERT INTO Menu(menuStatus, menuName, restaurantID)
    VALUES (mStatus, menuName, restaurantID);
    SET menuID = LAST_INSERT_ID();
    
	while (ind <= maxval ) DO           
          select sTime INTO val1 from MyTemporaryTable WHERE id = ind LIMIT 1;
          select eTime INTO val2 from MyTemporaryTable2 WHERE id = ind LIMIT 1;
		  
		  CALL SetMenuTime(val1, val2, menuID);

		  SET ind = ind+1;
	end while;
    
	SELECT menuID;
