/*******************************************************************
/* This script creates the main registration validation view
/* plus any related views that replace subqueries to the main view.
/* The purpose of this view is to find issues with registration data.
/*******************************************************************/

-- Create a subquery view to return the set of available bundled events for each person

CREATE OR REPLACE VIEW VW_AVAILABLE_BUNDLED_EVENT AS

	SELECT 
		REGISTRATION.PERSON_ID,
		EVENT_BUNDLE.BUNDLE_ID,
		EVENT_BUNDLE.EVENT_ID
	FROM REGISTRATION INNER JOIN EVENT_BUNDLE 
		ON REGISTRATION.EVENT_ID = EVENT_BUNDLE.BUNDLE_ID
;



-- Create the main registration validation view

CREATE OR REPLACE VIEW VW_REGISTRATION_VALIDATION AS

/* Query to find all players who do not have a weekend badge
   but are registered for an event that requires one */

SELECT DISTINCT 
	REGISTRATION.PERSON_ID, 'No Badge' VALIDATION_WARNING
FROM 
	REGISTRATION INNER JOIN EVENT
		ON REGISTRATION.EVENT_ID = EVENT.ID
WHERE 
	REGISTRATION.PERSON_ID NOT IN
	-- People with badges
	 (SELECT REGISTRATION.PERSON_ID FROM REGISTRATION 
		INNER JOIN EVENT ON REGISTRATION.EVENT_ID = EVENT.ID 
		WHERE EVENT.TYPE_ID = 8)
	AND REGISTRATION.EVENT_ID NOT IN
	-- Don't count events that do not require a badge
	 (SELECT REGISTRATION.EVENT_ID FROM REGISTRATION 
		INNER JOIN EVENT ON REGISTRATION.EVENT_ID = EVENT.ID 
		WHERE IS_WEEKEND_BADGE_REQ = 0)

UNION ALL


/* Query to find all players who registered for an event bundle
   but are not registered for any of the budled events */

SELECT 
	VW_AVAILABLE_BUNDLED_EVENT.PERSON_ID, 'Has bundle without bundled events' VALIDATION_WARNING
FROM 
	VW_AVAILABLE_BUNDLED_EVENT 
	LEFT JOIN REGISTRATION
		ON VW_AVAILABLE_BUNDLED_EVENT.PERSON_ID = REGISTRATION.PERSON_ID 
		AND VW_AVAILABLE_BUNDLED_EVENT.EVENT_ID = REGISTRATION.EVENT_ID	
GROUP BY 
	VW_AVAILABLE_BUNDLED_EVENT.PERSON_ID, VW_AVAILABLE_BUNDLED_EVENT.BUNDLE_ID
HAVING 
	COUNT(REGISTRATION.EVENT_ID) = 0

;