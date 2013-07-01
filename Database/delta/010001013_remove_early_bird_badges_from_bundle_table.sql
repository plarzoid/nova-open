/*
	Remove the references to weekend badge discounts from the bundle table
	because they have the new event_type of 'pass' and will be counted
	separately.

-- Date: 2013-05-19
*/

DELETE FROM EVENT_BUNDLE WHERE EVENT_BUNDLE.ID IN (20, 21);

INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001013_remove_early_bird_badges_from_bundle_table.sql',NOW())
;