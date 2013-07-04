<?php

/**************************************************
*
*	Event_match Class
*
***************************************************/

require_once("query.php");

class Event_match {

var $query=NULL;
var $table="EVENT_MATCH";


/***************************************************

Constructor & Destructor

***************************************************/

public function __construct(){
	$this->query = new Query();
}

public function __destruct(){}


/**************************************************

Create Function

**************************************************/
public function createEvent_match($person_1_id, $person_2_id, $event_round_id, $result_cd, $last_modified_by, $last_modified_date, $created_by, $created_date, $unique){

	//Validate the inputs
	if(!is_int($person_1_id)){return false;}
	if(!is_int($person_2_id)){return false;}
	if(!is_int($event_round_id)){return false;}
	if(is_string($result_cd)){if(strlen($result_cd) == 0){return false;}} else {return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (PERSON_1_ID, PERSON_2_ID, EVENT_ROUND_ID, RESULT_CD, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE, UNIQUE) VALUES ($person_1_id, $person_2_id, $event_round_id, '$result_cd', '$last_modified_by', $last_modified_date, '$created_by', $created_date, $unique)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteEvent_match($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getEvent_matchById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getEvent_matchByPerson1Id($person_1_id){
	if(!is_int($person_1_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE PERSON_1_ID=$person_1_id";

	return $this->query->query($sql);
}

public function getEvent_matchByPerson2Id($person_2_id){
	if(!is_int($person_2_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE PERSON_2_ID=$person_2_id";

	return $this->query->query($sql);
}

public function getEvent_matchByEventRoundId($event_round_id){
	if(!is_int($event_round_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ROUND_ID=$event_round_id";

	return $this->query->query($sql);
}

public function getEvent_matchByResultCd($result_cd){
	if(is_string($result_cd)){if(strlen($result_cd) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE RESULT_CD=$result_cd";

	return $this->query->query($sql);
}

public function getEvent_matchByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getEvent_matchByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getEvent_matchByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getEvent_matchByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

public function getEvent_matchByUnique($unique){
	$sql = "SELECT * FROM $this->table WHERE UNIQUE=$unique";

	return $this->query->query($sql);
}

}//close class

?>
