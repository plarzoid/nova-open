
-- Insert a new event type
INSERT INTO LT_EVENT_TYPE 
	(ID, NAME, DESCRIPTION)
VALUES
	(7,'Discount','Special "event" is a multi-discount')
;

-- Update existing multi-discount events

-- Warmachine Pass
UPDATE EVENT
SET TYPE_ID = 7, PRICE = -50
WHERE ID = 13;

-- Magic Pass
UPDATE EVENT
SET TYPE_ID = 7, PRICE = -40
WHERE ID = 26;



INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001002_Insert_Multi_discount_events.sql',NOW())
;