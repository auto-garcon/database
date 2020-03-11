CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllMenuItems`()
BEGIN
	SELECT * FROM MenuItem;
END