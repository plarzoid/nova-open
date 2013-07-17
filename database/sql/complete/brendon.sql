/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE APPEARANCE_ENTRY (
  ID int(11) NOT NULL,
  ARTIST_ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  LABEL varchar(100) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  CATEGORY_ID int(11) NOT NULL,
  MANUFACTURER_ID int(11) DEFAULT NULL,
  ARMY_FACTION_ID int(11) DEFAULT NULL,
  NOTE varchar(255) DEFAULT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_APP_ENTRY_EVENT_ID (EVENT_ID),
  KEY FK_APP_ENTRY_MAN_ID (MANUFACTURER_ID),
  KEY FK_APP_ENTRY_ARM_FAC_ID (ARMY_FACTION_ID),
  CONSTRAINT FK_APP_ENTRY_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID),
  CONSTRAINT FK_APP_ENTRY_MAN_ID FOREIGN KEY (MANUFACTURER_ID) REFERENCES REF_MANUFACTURER (ID),
  CONSTRAINT FK_APP_ENTRY_ARM_FAC_ID FOREIGN KEY (ARMY_FACTION_ID) REFERENCES REF_ARMY_FACTION (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE APPEARANCE_SCORE (
  ID int(11) NOT NULL,
  ENTRY_ID int(11) NOT NULL,
  JUDGE_ID int(11) NOT NULL,
  BASE_SCORE int(11) NOT NULL,
  SCORE_MODIFIER int(11) DEFAULT NULL,
  JUDGE_COMMENT text,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_APP_SCORE_ENTRY_ID (ENTRY_ID),
  KEY FK_APP_SCORE_JUDGE_ID (JUDGE_ID),
  CONSTRAINT FK_APP_SCORE_ENTRY_ID FOREIGN KEY (ENTRY_ID) REFERENCES APPEARANCE_ENTRY (ID),
  CONSTRAINT FK_APP_SCORE_JUDGE_ID FOREIGN KEY (JUDGE_ID) REFERENCES `USERS` (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE CHANGELOG (
  ID int(11) NOT NULL,
  SCRIPT varchar(100) NOT NULL,
  RUN_DATE datetime NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE CLUB (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  EMAIL varchar(50) DEFAULT NULL,
  WEBSITE_URL varchar(50) DEFAULT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT` (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  TYPE_ID int(11) NOT NULL,
  GAME_SYSTEM_ID int(11) DEFAULT NULL,
  NOVA_YEAR year(4) NOT NULL,
  EVENT_START datetime DEFAULT NULL,
  EVENT_END datetime DEFAULT NULL,
  IS_UNIQUE tinyint(1) NOT NULL DEFAULT '1',
  IS_WEEKEND_BADGE_REQ tinyint(1) NOT NULL DEFAULT '1',
  PRICE decimal(5,2) DEFAULT '0.00',
  AVAILABLE_QTY int(11) DEFAULT NULL,
  NOTE varchar(1000) DEFAULT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_GAME_SYS_ID (GAME_SYSTEM_ID),
  KEY FK_TYPE_ID (TYPE_ID),
  CONSTRAINT FK_GAME_SYS_ID FOREIGN KEY (GAME_SYSTEM_ID) REFERENCES LT_GAME_SYSTEM (ID),
  CONSTRAINT FK_TYPE_ID FOREIGN KEY (TYPE_ID) REFERENCES LT_EVENT_TYPE (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE EVENT_BUNDLE (
  ID int(11) NOT NULL,
  BUNDLE_ID int(11) DEFAULT NULL,
  EVENT_ID int(11) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_EVENT_BUNDLE_EVENT_ID (EVENT_ID),
  KEY FK_EVENT_BUNDLE_BUNDLE_ID (BUNDLE_ID),
  CONSTRAINT FK_EVENT_BUNDLE_BUNDLE_ID FOREIGN KEY (BUNDLE_ID) REFERENCES EVENT (ID),
  CONSTRAINT FK_EVENT_BUNDLE_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE EVENT_MATCH (
  ID int(11) NOT NULL,
  PERSON_1_ID int(11) NOT NULL,
  PERSON_2_ID int(11) NOT NULL,
  EVENT_ROUND_ID int(11) NOT NULL,
  RESULT_CD varchar(20) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY IDX_E_M_PERSON_ID_ROUND_ID (PERSON_1_ID,PERSON_2_ID,EVENT_ROUND_ID),
  KEY FK_E_M_PERSON_2_ID (PERSON_2_ID),
  KEY FK_E_M_ROUND_ID (EVENT_ROUND_ID),
  CONSTRAINT FK_E_M_PERSON_1_ID FOREIGN KEY (PERSON_1_ID) REFERENCES PERSON (ID),
  CONSTRAINT FK_E_M_PERSON_2_ID FOREIGN KEY (PERSON_2_ID) REFERENCES PERSON (ID),
  CONSTRAINT FK_E_M_ROUND_ID FOREIGN KEY (EVENT_ROUND_ID) REFERENCES EVENT_ROUND (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE EVENT_MATERIAL (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  MATERIAL_TYPE_ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_EVENT_ID (EVENT_ID),
  KEY FK_MAT_TYPE_ID (MATERIAL_TYPE_ID),
  CONSTRAINT FK_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID),
  CONSTRAINT FK_MAT_TYPE_ID FOREIGN KEY (MATERIAL_TYPE_ID) REFERENCES LT_EVENT_MATERIAL_TYPE (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE EVENT_ROUND (
  ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  ROUND_NUM int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_E_EVENT_ID (EVENT_ID),
  CONSTRAINT FK_E_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_ACCOUNT_STATUS (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_APPEARANCE_CATEGORY (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_COUNTRY (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_EVENT_MATERIAL_TYPE (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_EVENT_TYPE (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_GAME_SYSTEM (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_STATE (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE LT_USERS_ROLE (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE PASSWORD_HISTORY (
  ID int(11) NOT NULL,
  USERS_ID int(11) NOT NULL,
  CHANGED_DATE datetime NOT NULL,
  PASSWORD_VALUE varchar(255) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_PWDHIST_ID_USERS_ID (USERS_ID),
  CONSTRAINT FK_PWDHIST_ID_USERS_ID FOREIGN KEY (USERS_ID) REFERENCES `USERS` (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE PERSON (
  ID int(11) NOT NULL,
  FIRST_NAME varchar(20) NOT NULL,
  MIDDLE_NAME varchar(20) DEFAULT NULL,
  LAST_NAME varchar(20) NOT NULL,
  EMAIL varchar(255) NOT NULL,
  ADDRESS varchar(255) DEFAULT NULL,
  CITY varchar(50) DEFAULT NULL,
  STATE_ID int(11) DEFAULT NULL,
  COUNTRY_ID int(11) DEFAULT NULL,
  ZIP varchar(10) DEFAULT NULL,
  PHONE_NUMBER varchar(20) DEFAULT NULL,
  WEBSITE_URL varchar(50) DEFAULT NULL,
  NOTE varchar(1000) DEFAULT NULL,
  IS_ACTIVE tinyint(1) NOT NULL DEFAULT '1',
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_ST_STATE_ID (STATE_ID),
  KEY FK_CNTRY_ID (COUNTRY_ID),
  CONSTRAINT FK_ST_STATE_ID FOREIGN KEY (STATE_ID) REFERENCES LT_STATE (ID),
  CONSTRAINT FK_CNTRY_ID FOREIGN KEY (COUNTRY_ID) REFERENCES LT_COUNTRY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE PROPERTIES (
  ID int(11) NOT NULL,
  PROPERTY_NAME varchar(30) NOT NULL,
  PROPERTY_VALUE varchar(100) NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE REF_ARMY_FACTION (
  ID int(11) NOT NULL,
  LABEL varchar(100) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  GAME_SYSTEM_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_FACTION_GAMESYS_ID (GAME_SYSTEM_ID),
  CONSTRAINT FK_FACTION_GAMESYS_ID FOREIGN KEY (GAME_SYSTEM_ID) REFERENCES LT_GAME_SYSTEM (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE REF_MANUFACTURER (
  ID int(11) NOT NULL,
  LABEL varchar(100) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE REGISTRATION (
  ID int(11) NOT NULL,
  PERSON_ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  QUANTITY int(11) NOT NULL DEFAULT '1',
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_P_E_EVENT_ID (EVENT_ID),
  KEY IDX_R_PERSON_ID_EVENT_ID (PERSON_ID,EVENT_ID),
  CONSTRAINT FK_P_E_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID),
  CONSTRAINT FK_P_E_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE TEAM (
  ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_T_EVENT_ID (EVENT_ID),
  CONSTRAINT FK_T_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES EVENT (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE USERS (
  ID int(11) NOT NULL,
  USERNAME varchar(50) NOT NULL,
  FIRST_NAME varchar(50) NOT NULL,
  MIDDLE_NAME varchar(50) DEFAULT NULL,
  LAST_NAME varchar(50) NOT NULL,
  EMAIL varchar(255) NOT NULL,
  ACCOUNT_STATUS int(11) NOT NULL,
  CNT_LOGIN_FAIL int(11) NOT NULL,
  LAST_LOGIN_DATE datetime NOT NULL,
  IS_PW_CHANGE_REQUIRED bit(1) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_ACTSTATUS_USERS_ID (ACCOUNT_STATUS),
  CONSTRAINT FK_ACTSTATUS_USERS_ID FOREIGN KEY (ACCOUNT_STATUS) REFERENCES LT_ACCOUNT_STATUS (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE X_CLUB_PERSON (
  ID int(11) NOT NULL,
  PERSON_ID int(11) NOT NULL,
  CLUB_ID int(11) NOT NULL,
  IS_LEAD tinyint(1) NOT NULL DEFAULT '0',
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY IDX_CB_P_PERSON_ID_CLUB_ID (PERSON_ID,CLUB_ID),
  KEY FK_CB_P_CLUB_ID (CLUB_ID),
  CONSTRAINT FK_CB_P_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID),
  CONSTRAINT FK_CB_P_CLUB_ID FOREIGN KEY (CLUB_ID) REFERENCES CLUB (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE X_PERSON_TEAM (
  ID int(11) NOT NULL,
  TEAM_ID int(11) NOT NULL,
  PERSON_ID int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_P_T_PERSON_ID (PERSON_ID),
  KEY FK_P_T_TEAM_ID (TEAM_ID),
  CONSTRAINT FK_P_T_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID),
  CONSTRAINT FK_P_T_TEAM_ID FOREIGN KEY (TEAM_ID) REFERENCES TEAM (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE X_USERS_ROLE (
  ID int(11) NOT NULL,
  USERS_ID int(11) NOT NULL,
  USERS_ROLE int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_USERS_ID (USERS_ID),
  KEY FK_USERS_ROLE_ID (USERS_ROLE),
  CONSTRAINT FK_USERS_ID FOREIGN KEY (USERS_ID) REFERENCES `USERS` (ID),
  CONSTRAINT FK_USERS_ROLE_ID FOREIGN KEY (USERS_ROLE) REFERENCES LT_USERS_ROLE (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
