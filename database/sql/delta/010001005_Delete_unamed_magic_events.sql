
-- Delete the extraneous magic events

DELETE FROM EVENT WHERE ID in (20,21);


INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001005_Delete_unamed_magic_events.sql',NOW())
;