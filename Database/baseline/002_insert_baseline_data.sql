USE nova_open;

INSERT INTO LT_COUNTRY (NAME)
	VALUES 
		('USA'),
		('Australia'),
		('Canada'),
		('France'),
		('Germany'),
		('Ireland'),
		('New Zealand'),
		('Russia'),
		('United Kingdom')

	;

INSERT INTO LT_STATE (NAME,DESCRIPTION)
	VALUES 
		('AL','Alabama'),
		('AK','Alaska'),
		('AZ','Arizona'),
		('AR','Arkansas'),
		('CA','California'),
		('CO','Colorado'),
		('CT','Connecticut'),
		('DE','Delaware'),
		('DC','District of Columbia'),
		('FL','Florida'),
		('GA','Georgia'),
		('HI','Hawaii'),
		('ID','Idaho'),
		('IL','Illinois'),
		('IN','Indiana'),
		('IA','Iowa'),
		('KS','Kansas'),
		('KY','Kentucky'),
		('LA','Louisiana'),
		('ME','Maine'),
		('MD','Maryland'),
		('MA','Massachusetts'),
		('MI','Michigan'),
		('MN','Minnesota'),
		('MS','Mississippi'),
		('MO','Missouri'),
		('MT','Montana'),
		('NE','Nebraska'),
		('NV','Nevada'),
		('NH','New Hampshire'),
		('NJ','New Jersey'),
		('NM','New Mexico'),
		('NY','New York'),
		('NC','North Carolina'),
		('ND','North Dakota'),
		('OH','Ohio'),
		('OK','Oklahoma'),
		('OR','Oregon'),
		('PA','Pennsylvania'),
		('RI','Rhode Island'),
		('SC','South Carolina'),
		('SD','South Dakota'),
		('TN','Tennessee'),
		('TX','Texas'),
		('UT','Utah'),
		('VT','Vermont'),
		('VA','Virginia'),
		('WA','Washington'),
		('WV','West Virginia'),
		('WI','Wisconsin'),
		('WY','Wyoming'),
		('N/A','Not Applicable')
	;

INSERT INTO LT_GAME_SYSTEM (ID, NAME, DESCRIPTION)
	VALUES
		(1,'40k','Warhammer 40,000'),
		(2,'FOW','Flames of War WW2 Strategy game'),
		(3,'Infinity','Infinity skirmish game'),
		(4,'Magic','Magic: The Gathering card game'),
		(5,'Warmachine','Warmachine/Hordes'),
		(6,'WHFB','Warhammer Fantasy Battles')
	;

INSERT INTO LT_EVENT_TYPE (ID, NAME, DESCRIPTION)
	VALUES
		(1,'Non-event','Weekend passes, VIP status, and other things people can purchase'),
		(2,'Tournament','A game tournament'),
		(3,'Seminar','A single speaker or learning event. No results recorded'),
		(4,'Art Competition','An art related event'),
		(5,'Donation','A donation to one of our charitable causes'),
		(6,'Other','Event type that does not fall into other categories')
	;

INSERT INTO LT_EVENT_MATERIAL_TYPE (ID, NAME, DESCRIPTION)
	VALUES
		(1,'Badge','Pre-requisite for participation in other events'),
		(2,'Primer','Basic event primer/guide'),
		(3,'Scoresheet','Scoresheet for use in the event'),
		(4,'Swag','Swag bags or other bonus materials, medals, etc.'),
		(5,'Product','Product such as sealed magic product'),
		(6,'Other','Other type of material given to player')
	;		
	

INSERT INTO EVENT
	(NAME, DESCRIPTION, TYPE_ID, GAME_SYSTEM_ID, NOVA_YEAR, EVENT_START, EVENT_END, IS_UNIQUE, IS_WEEKEND_BADGE_REQ, PRICE, AVAILABLE_QTY, NOTE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE)
	VALUES
		('Weekend Badge',NULL,1,NULL,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,45,NULL,'coupon code NOVA 2013 - $10 DISCOUNT UNTIL April 15, $5 discount April 15 - August 18',USER(),SYSDATE(),USER(),SYSDATE()),
		('Friday Day Pass',NULL,1,NULL,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Saturday Day Pass',NULL,1,NULL,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,15,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Sunday Day Pass',NULL,1,NULL,2013,'2013-09-02 00:00:00','2013-09-13 00:00:00',1,1,15,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Pre order - NOVA Open 2013 t-shirt',NULL,1,NULL,2013,NULL,NULL,1,1,12,NULL,'only available for pre-order WITH a weekend badge - needs comment box  for t-shirt size',USER(),SYSDATE(),USER(),SYSDATE()),
		('VIP bag',NULL,1,NULL,2013,NULL,NULL,1,1,80,78,'needs comment box labeled t-shirt size; + area for identifying army for army-spec swag',USER(),SYSDATE(),USER(),SYSDATE()),
		('Deluxe seminar pass','Any 5 seminars + 1 entry in Capital Palette ',3,NULL,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,70,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('40K GT',NULL,2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,65,256,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('40K Narrative',NULL,2,1,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,40,60,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('40K Trios',NULL,2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,90,20,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('40K Invitational',NULL,2,1,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,50,32,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Fantasy',NULL,2,6,2013,'2013-09-01 00:00:00','2013-09-02 00:00:00',1,1,65,64,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Warmachine - all tournaments',NULL,2,5,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,30,64,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Warmachine - any single tournament',NULL,2,5,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,10,64,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Flames of War - Mid-War',NULL,2,2,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,15,32,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Flames of War - Late War',NULL,2,2,2013,'2013-09-01 00:00:00','2013-09-02 00:00:00',1,1,25,32,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Flames of War - Double-feature','Entry into both Mid & Late War tournaments',2,2,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,35,32,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Infinity',NULL,2,3,2013,'2013-08-29 00:00:00','2013-08-30 00:00:00',1,1,20,24,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Last Chance Qualifier',NULL,2,4,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,10,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Unamed Event 1',NULL,2,4,2013,'2013-08-29 00:00:00','2013-08-29 00:00:00',1,1,10,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Unamed Event 2',NULL,2,4,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,10,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Sealed Deck Event ',NULL,2,4,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,25,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Mega Friday Night Magic',NULL,2,4,2013,'2013-08-30 00:00:00','2013-08-30 00:00:00',1,1,10,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Standard Tournament',NULL,2,4,2013,'2013-09-01 00:00:00','2013-09-01 00:00:00',1,1,25,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Modern Tournament',NULL,2,4,2013,'2013-09-02 00:00:00','2013-09-02 00:00:00',1,1,25,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Magic - Weekend extravaganza','All scheduled Magic events (excluding pickups)',2,4,2013,'2013-08-29 00:00:00','2013-09-02 00:00:00',1,1,120,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Capital Palette - Unlimited Entries',NULL,4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,25,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Capital Palette - single model',NULL,4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,5,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Capital Palette -one  collection',NULL,4,NULL,2013,'2013-08-30 00:00:00','2013-09-02 00:00:00',1,1,10,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Donation - Fisher House',NULL,5,NULL,2013,NULL,NULL,1,1,NULL,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Donation - Doctors Without Borders',NULL,5,NULL,2013,NULL,NULL,1,1,NULL,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('GEEK NATION TOURS',NULL,6,NULL,2013,NULL,NULL,1,1,NULL,NULL,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 01 - Airbrushing Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 02 - Airbrushing Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 03 - Using Pigments on Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 04 - Basing Your Models',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 05 - Weathering Techniques',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 06 - Basic Black',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 07 - Weathering Techniques',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 08 - Using Pigments on Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 09 - Basing Your Models',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 10 - Airbrushing Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 11 - Using Pigments on Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 12 - Airbrushing Miniatures',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 13 - Basing Your Models',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE()),
		('Seminar 14 - Weathering Techniques',NULL,3,NULL,2013,NULL,NULL,1,1,15,15,NULL,USER(),SYSDATE(),USER(),SYSDATE())

	;


	
INSERT INTO EVENT_MATERIAL
	(NAME, DESCRIPTION, MATERIAL_TYPE_ID, EVENT_ID, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE)
	VALUES
		('Weekend Badge', 'Standard weekend badge' ,1, 1, USER(),SYSDATE(), USER(), SYSDATE()),
		('Swag Bag', 'Standard swag bag for everyone who buys a weekend pass' ,4, 1, USER(),SYSDATE(), USER(), SYSDATE()),
		('VIP Badge', 'Special badge for VIP members' ,1, 2, USER(),SYSDATE(), USER(), SYSDATE()),
		('VIP Bag', 'Special bag for VIP holders. Upgraded swag.',1, 2, USER(),SYSDATE(), USER(), SYSDATE()),
		('40k Guidebook', 'Mission and rules primer for the 40k GT',2, 3, USER(),SYSDATE(), USER(), SYSDATE()),
		('40k Scoresheet', 'Scoresheet for the 40k GT',3, 3, USER(),SYSDATE(), USER(), SYSDATE()),
		('40k Narrative scoresheet', 'Scoresheet for the 40k Narrative',3, 5, USER(),SYSDATE(), USER(), SYSDATE()),
		('40k Narrative Guidebook', 'Mission and rules primer for the 40k Narrative',2, 5, USER(),SYSDATE(), USER(), SYSDATE()),
		('Fantasy GT Guidebook', 'Mission and rules primer for the Fantasy GT',2, 4, USER(),SYSDATE(), USER(), SYSDATE()),
		('Fantasy GT Scoresheet', 'Scoresheet for the Fantasy GT',3, 4, USER(),SYSDATE(), USER(), SYSDATE())
	;

COMMIT;

INSERT INTO CHANGELOG
	(SCRIPT, RUN_DATE)
VALUES
	('002_insert_baseline_data.sql',NOW())
;
