/*
-- Rename references to discount to bundle

-- Date: 2013-05-19 22:32
*/

ALTER TABLE EVENT_DISCOUNT DROP FOREIGN KEY FK_EVENT_DISCOUNT_E_D_ID;
ALTER TABLE EVENT_DISCOUNT DROP FOREIGN KEY FK_EVENT_DISCOUNT_E_ID;

RENAME TABLE EVENT_DISCOUNT TO EVENT_BUNDLE;

ALTER TABLE EVENT_BUNDLE CHANGE DISCOUNT_EVENT_ID BUNDLE_ID INT(11);

ALTER TABLE EVENT_BUNDLE ADD CONSTRAINT FK_EVENT_BUNDLE_EVENT_ID 
	FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID);

ALTER TABLE EVENT_BUNDLE ADD CONSTRAINT FK_EVENT_BUNDLE_BUNDLE_ID 
	FOREIGN KEY (BUNDLE_ID) REFERENCES EVENT (ID);



INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001012_Rename_Discount_To_Bundle.sql',NOW())
;