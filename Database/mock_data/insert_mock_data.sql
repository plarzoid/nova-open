INSERT INTO PERSON (ID, FIRST_NAME, LAST_NAME, EMAIL, ADDRESS, CITY, STATE_ID, COUNTRY_ID, ZIP, PHONE_NUMBER, IS_ACTIVE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,'Joe','Smith','joe.smith@test.org',NULL,'Nowhere',35,NULL,'12345',NULL,1,'Admin',NOW(),'Admin',NOW()),
(2,'Jane','Doe','jane.doe@test.org','123 Nowhere Ln','A Place',26,1,'45678','123-456-7891',1,'Admin',NOW(),'Admin',NOW()),
(3,'Chris','Kim','chris.kim@test.com','456 Address','Cityville',10,1,'23847','123-456-7892',1,'Admin',NOW(),'Admin',NOW()),
(4,'John','Connor','john.connor@cyberdyne.com','1 Overseas Address','Township',NULL,NULL,NULL,'123-456-7893',1,'Admin',NOW(),'Admin',NOW());

INSERT INTO REGISTRATION (ID, PERSON_ID, EVENT_ID, QUANTITY, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,1,1,1,'Admin',NOW(),'Admin',NOW()),
(2,1,7,1,'Admin',NOW(),'Admin',NOW()),
(3,1,10,1,'Admin',NOW(),'Admin',NOW()),
(4,2,1,1,'Admin',NOW(),'Admin',NOW()),
(5,2,14,1,'Admin',NOW(),'Admin',NOW()),
(6,2,15,1,'Admin',NOW(),'Admin',NOW()),
(7,2,16,1,'Admin',NOW(),'Admin',NOW()),
(8,2,33,1,'Admin',NOW(),'Admin',NOW()),
(9,3,2,1,'Admin',NOW(),'Admin',NOW()),
(10,3,48,1,'Admin',NOW(),'Admin',NOW()),
(11,3,49,1,'Admin',NOW(),'Admin',NOW()),
(12,4,8,1,'Admin',NOW(),'Admin',NOW()),
(13,4,9,1,'Admin',NOW(),'Admin',NOW()),
(14,4,10,1,'Admin',NOW(),'Admin',NOW());

INSERT INTO USER (ID, USERNAME, FIRST_NAME, MIDDLE_NAME, LAST_NAME, EMAIL, ACCOUNT_STATUS, CNT_LOGIN_FAIL, LAST_LOGIN_DATE, IS_PW_CHANGE_REQUIRED, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,'joe.smith','Joe','S.','Smith','joe.smith@test.org',1,0,NOW(),0,'Admin',NOW(),'Admin',NOW()),
(2,'captain.judge','Captain',NULL,'Judge','cpt.judge@test.com',1,0,NOW(),0,'Admin',NOW(),'Admin',NOW()),
(3,'super.shades','Shades',NULL,'The Man','shades.theman@test.com',1,0,NOW(),0,'Admin',NOW(),'Admin',NOW());


INSERT INTO X_USER_USER_ROLE (ID, USER_ID, USER_ROLE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,1,1,'Admin',NOW(),'Admin',NOW()),
(2,1,3,'Admin',NOW(),'Admin',NOW()),
(3,2,2,'Admin',NOW(),'Admin',NOW()),
(4,2,3,'Admin',NOW(),'Admin',NOW()),
(5,3,2,'Admin',NOW(),'Admin',NOW()),
(6,3,3,'Admin',NOW(),'Admin',NOW());

INSERT INTO REF_ARMY_FACTION (ID, LABEL, DESCRIPTION, GAME_SYSTEM_ID) VALUES 
(1,'Space Marines','Basic Space Marines',1),
(2,'Imperial Guard',NULL,1),
(3,'Eldar','GW Eldar',1),
(4,'Assorted 40k','Mixed 40k models',1),
(5,'German','Wermacht units',2),
(6,'Australian','FoW Aussies',2),
(7,'Cryx',NULL,5),
(8,'Eriadne',NULL,3),
(9,'Menoth',NULL,5),
(10,'Goblins',NULL,6),
(11,'Bretonnians',NULL,6),
(12,'High Elves',NULL,6),
(13,'Assorted Fantasy','Mixed fantasy models',NULL);

INSERT INTO REF_MANUFACTURER (ID, LABEL, DESCRIPTION) VALUES 
(1,'GW','Games Workshop'),
(2,'PP','Privateer Press'),
(3,'BF','Battlefront'),
(4,'Reaper','Reaper Minis'),
(5,'WoC','Wizards of the Coast'),
(6,'Victoria','Victoria Miniatures'),
(7,'Custom','Custom, scratchbuilt, or self-sculpted'),
(8,'Corvus','Corvus Belli');

INSERT INTO APPEARANCE_ENTRY (ID, ARTIST_ID, EVENT_ID, LABEL, DESCRIPTION, CATEGORY_ID, MANUFACTURER_ID, ARMY_FACTION_ID, NOTE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,1,7,'SM Army','Space Marine Army',1,1,1,'This is a super sweet army of dudes','Admin',NOW(),'Admin',NOW()),
(2,1,25,'Awesome Mini','A kickass mini',2,8,8,NULL,'Admin',NOW(),'Admin',NOW()),
(3,2,25,'Another scifi model','A small scifi model',2,1,3,NULL,'Admin',NOW(),'Admin',NOW()),
(4,2,25,'Fantasty diorama','A bunch of minis',7,1,12,NULL,'Admin',NOW(),'Admin',NOW()),
(5,2,25,'Another fantasty diorama','This person is prolific',7,1,11,NULL,'Admin',NOW(),'Admin',NOW()),
(6,3,7,'Eldar FTW','An eldar army',1,1,3,NULL,'Admin',NOW(),'Admin',NOW());

INSERT INTO APPEARANCE_SCORE (ID, ENTRY_ID, JUDGE_ID, BASE_SCORE, SCORE_MODIFIER, JUDGE_COMMENT, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES 
(1,1,1,70,4,'This is a super long comment because why not, this field is a memo field so it can be rull long','Admin',NOW(),'Admin',NOW()),
(2,1,2,80,-3,'This seemed pretty good at first, but loses points on closer examination','Admin',NOW(),'Admin',NOW()),
(3,1,3,70,-1,'No comment','Admin',NOW(),'Admin',NOW()),
(4,2,1,90,-4,NULL,'Admin',NOW(),'Admin',NOW()),
(5,2,3,80,5,NULL,'Admin',NOW(),'Admin',NOW()),
(6,3,2,80,2,NULL,'Admin',NOW(),'Admin',NOW()),
(7,3,3,80,-1,NULL,'Admin',NOW(),'Admin',NOW()),
(8,4,1,50,5,NULL,'Admin',NOW(),'Admin',NOW()),
(9,4,2,50,2,NULL,'Admin',NOW(),'Admin',NOW()),
(10,4,3,20,4,'Does not meet basic standards','Admin',NOW(),'Admin',NOW()),
(11,5,1,70,2,NULL,'Admin',NOW(),'Admin',NOW()),
(12,6,2,90,3,'Awesome!','Admin',NOW(),'Admin',NOW()),
(13,6,3,80,-1,NULL,'Admin',NOW(),'Admin',NOW());




