<?php

/**************************************************
*
*	Event_round Class
*
***************************************************/

require_once("query.php");

class Event_round {

var $query=NULL;
var $table="EVENT_ROUND";


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
public function createEvent_round($event_id, $round_num, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(!is_int($event_id)){return false;}
	if(!is_int($round_num)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (EVENT_ID, ROUND_NUM, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ($event_id, $round_num, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteEvent_round($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getEvent_roundById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getEvent_roundByEventId($event_id){
	if(!is_int($event_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ID=$event_id";

	return $this->query->query($sql);
}

public function getEvent_roundByRoundNum($round_num){
	if(!is_int($round_num)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ROUND_NUM=$round_num";

	return $this->query->query($sql);
}

public function getEvent_roundByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getEvent_roundByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getEvent_roundByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getEvent_roundByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
