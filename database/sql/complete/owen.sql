/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE appearance_entry (
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
  KEY FK_APP_ENTRY_MAN_ID (MANUFACTURER_ID),
  KEY FK_APP_ENTRY_ARM_FAC_ID (ARMY_FACTION_ID),
  CONSTRAINT FK_APP_ENTRY_MAN_ID FOREIGN KEY (MANUFACTURER_ID) REFERENCES ref_manufacturer (ID),
  CONSTRAINT FK_APP_ENTRY_ARM_FAC_ID FOREIGN KEY (ARMY_FACTION_ID) REFERENCES ref_army_faction (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE appearance_score (
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
  CONSTRAINT FK_APP_SCORE_ENTRY_ID FOREIGN KEY (ENTRY_ID) REFERENCES appearance_entry (ID),
  CONSTRAINT FK_APP_SCORE_JUDGE_ID FOREIGN KEY (JUDGE_ID) REFERENCES `user` (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE changelog (
  ID int(11) NOT NULL,
  SCRIPT varchar(100) NOT NULL,
  RUN_DATE datetime NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE club (
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
CREATE TABLE `event` (
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
  CONSTRAINT FK_GAME_SYS_ID FOREIGN KEY (GAME_SYSTEM_ID) REFERENCES lt_game_system (ID),
  CONSTRAINT FK_TYPE_ID FOREIGN KEY (TYPE_ID) REFERENCES lt_event_type (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE event_bundle (
  ID int(11) NOT NULL,
  BUNDLE_ID int(11) DEFAULT NULL,
  EVENT_ID int(11) NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_EVENT_BUNDLE_EVENT_ID (EVENT_ID),
  KEY FK_EVENT_BUNDLE_BUNDLE_ID (BUNDLE_ID),
  CONSTRAINT FK_EVENT_BUNDLE_BUNDLE_ID FOREIGN KEY (BUNDLE_ID) REFERENCES event (ID),
  CONSTRAINT FK_EVENT_BUNDLE_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES event (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE event_match (
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
  CONSTRAINT FK_E_M_PERSON_1_ID FOREIGN KEY (PERSON_1_ID) REFERENCES person (ID),
  CONSTRAINT FK_E_M_PERSON_2_ID FOREIGN KEY (PERSON_2_ID) REFERENCES person (ID),
  CONSTRAINT FK_E_M_ROUND_ID FOREIGN KEY (EVENT_ROUND_ID) REFERENCES event_round (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE event_material (
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
  CONSTRAINT FK_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES event (ID),
  CONSTRAINT FK_MAT_TYPE_ID FOREIGN KEY (MATERIAL_TYPE_ID) REFERENCES lt_event_material_type (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE event_round (
  ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  ROUND_NUM int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_E_EVENT_ID (EVENT_ID),
  CONSTRAINT FK_E_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES event (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_account_status (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_appearance_category (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_country (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_event_material_type (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_event_type (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_game_system (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_state (
  ID int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE lt_user_role (
  ID int(11) NOT NULL,
  LABEL varchar(50) NOT NULL,
  DESCRIPTION varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE password_history (
  ID int(11) NOT NULL,
  USER_ID int(11) NOT NULL,
  CHANGED_DATE datetime NOT NULL,
  PASSWORD_VALUE varchar(255) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_PWDHIST_ID_USER_ID (USER_ID),
  CONSTRAINT FK_PWDHIST_ID_USER_ID FOREIGN KEY (USER_ID) REFERENCES `user` (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE person (
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
  CONSTRAINT FK_ST_STATE_ID FOREIGN KEY (STATE_ID) REFERENCES lt_state (ID),
  CONSTRAINT FK_CNTRY_ID FOREIGN KEY (COUNTRY_ID) REFERENCES lt_country (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE properties (
  ID int(11) NOT NULL,
  PROPERTY_NAME varchar(30) NOT NULL,
  PROPERTY_VALUE varchar(100) NOT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ref_army_faction (
  ID int(11) NOT NULL,
  LABEL varchar(100) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  GAME_SYSTEM_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY FK_FACTION_GAMESYS_ID (GAME_SYSTEM_ID),
  CONSTRAINT FK_FACTION_GAMESYS_ID FOREIGN KEY (GAME_SYSTEM_ID) REFERENCES lt_game_system (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ref_manufacturer (
  ID int(11) NOT NULL,
  LABEL varchar(100) NOT NULL,
  DESCRIPTION varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE registration (
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
  CONSTRAINT FK_P_E_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES person (ID),
  CONSTRAINT FK_P_E_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES event (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE team (
  ID int(11) NOT NULL,
  EVENT_ID int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_T_EVENT_ID (EVENT_ID),
  CONSTRAINT FK_T_EVENT_ID FOREIGN KEY (EVENT_ID) REFERENCES event (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
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
  KEY FK_ACTSTATUS_USER_ID (ACCOUNT_STATUS),
  CONSTRAINT FK_ACTSTATUS_USER_ID FOREIGN KEY (ACCOUNT_STATUS) REFERENCES lt_account_status (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE x_club_person (
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
  CONSTRAINT FK_CB_P_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES person (ID),
  CONSTRAINT FK_CB_P_CLUB_ID FOREIGN KEY (CLUB_ID) REFERENCES club (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE x_person_team (
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
  CONSTRAINT FK_P_T_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES person (ID),
  CONSTRAINT FK_P_T_TEAM_ID FOREIGN KEY (TEAM_ID) REFERENCES team (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE x_user_user_role (
  ID int(11) NOT NULL,
  USER_ID int(11) NOT NULL,
  USER_ROLE int(11) NOT NULL,
  LAST_MODIFIED_BY varchar(55) NOT NULL,
  LAST_MODIFIED_DATE datetime NOT NULL,
  CREATED_BY varchar(55) NOT NULL,
  CREATED_DATE datetime NOT NULL,
  PRIMARY KEY (ID),
  KEY FK_USER_ID (USER_ID),
  KEY FK_USER_ROLE_ID (USER_ROLE),
  CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES `user` (ID),
  CONSTRAINT FK_USER_ROLE_ID FOREIGN KEY (USER_ROLE) REFERENCES lt_user_role (ID)
);
/*!40101 SET character_set_client = @saved_cs_client */;
