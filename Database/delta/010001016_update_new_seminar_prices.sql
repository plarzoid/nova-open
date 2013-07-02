
-- Update the prices of the new seminars
UPDATE EVENT
	SET PRICE = 15
	WHERE ID in (65, 67, 68, 69, 70, 71, 72)
;


INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001016_update_new_seminar_prices.sql',NOW())
;