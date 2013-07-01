/*
-- Insert values into the PROPERTIES table on the server to hold version values

-- Date: 2013-04-09 22:32
*/
INSERT INTO `PROPERTIES` (`ID`,`PROPERTY_NAME`,`PROPERTY_VALUE`) VALUES (1,'client_major_version','1');
INSERT INTO `PROPERTIES` (`ID`,`PROPERTY_NAME`,`PROPERTY_VALUE`) VALUES (2,'client_minor_version','10');
INSERT INTO `PROPERTIES` (`ID`,`PROPERTY_NAME`,`PROPERTY_VALUE`) VALUES (3,'db_major_version','9');
INSERT INTO `PROPERTIES` (`ID`,`PROPERTY_NAME`,`PROPERTY_VALUE`) VALUES (4,'db_minor_version','1');


INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001009_Insert_version_properties.sql',NOW())
;