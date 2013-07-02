
-- Insert an option for complimentary weekend badges for special staff and guests so that revenue is accurately captured
INSERT INTO EVENT
	(ID, NAME, DESCRIPTION, TYPE_ID, GAME_SYSTEM_ID, NOVA_YEAR, EVENT_START, EVENT_END, IS_UNIQUE, IS_WEEKEND_BADGE_REQ, PRICE, AVAILABLE_QTY, NOTE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE)
VALUES 
	
	(73,'Comp Badge','Complimentary weekend badge',8,NULL,2013,'2013-08-31 00:00:00','2013-09-2 00:00:00',1,0,0,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE())
;


INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('010001015_insert_comp_badge_into_events.sql',NOW())
;