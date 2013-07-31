<?php

/**************************************************
*
*	Event Class
*
***************************************************/

require_once("query.php");

class Event {

var $query=NULL;
var $table="EVENT";


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
public function createEvent($name, $description, $type_id, $game_system_id, $nova_year, $event_start, $event_end, $is_unique, $is_weekend_badge_req, $price, $available_qty, $note, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}
	if(!is_int($type_id)){return false;}
	if(!is_int($game_system_id)){return false;}
	if(!is_int($is_unique)){return false;}
	if(!is_int($is_weekend_badge_req)){return false;}
	if(!is_int($available_qty)){return false;}
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (NAME, DESCRIPTION, TYPE_ID, GAME_SYSTEM_ID, NOVA_YEAR, EVENT_START, EVENT_END, IS_UNIQUE, IS_WEEKEND_BADGE_REQ, PRICE, AVAILABLE_QTY, NOTE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ('$name', '$description', $type_id, $game_system_id, $nova_year, $event_start, $event_end, $is_unique, $is_weekend_badge_req, $price, $available_qty, '$note', '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteEvent($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

custom functions

**************************************************/

public function getEvents(){
	return $this->query->query("SELECT * FROM $this->table");
}

public function getAvailableEvents(){
	return $this->query->query("SELECT * FROM $this->table WHERE AVAILABLE_QTY>0 OR AVAILABLE_QTY IS NULL");
}

/**************************************************

Query By Column Function(s)

**************************************************/
public function getEventById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getEventByName($name){
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NAME='$name'";

	return $this->query->query($sql);
}

public function getEventByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION='$description'";

	return $this->query->query($sql);
}

public function getEventByTypeId($type_id){
	if(!is_int($type_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE TYPE_ID=$type_id";

	return $this->query->query($sql);
}

public function getEventByGameSystemId($game_system_id){
	if(!is_int($game_system_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE GAME_SYSTEM_ID=$game_system_id";

	return $this->query->query($sql);
}

public function getEventByNovaYear($nova_year){
	$sql = "SELECT * FROM $this->table WHERE NOVA_YEAR=$nova_year";

	return $this->query->query($sql);
}

public function getEventByEventStart($event_start){
	$sql = "SELECT * FROM $this->table WHERE EVENT_START=$event_start";

	return $this->query->query($sql);
}

public function getEventByEventEnd($event_end){
	$sql = "SELECT * FROM $this->table WHERE EVENT_END=$event_end";

	return $this->query->query($sql);
}

public function getEventByIsUnique($is_unique){
	if(!is_int($is_unique)){return false;}

	$sql = "SELECT * FROM $this->table WHERE IS_UNIQUE=$is_unique";

	return $this->query->query($sql);
}

public function getEventByIsWeekendBadgeReq($is_weekend_badge_req){
	if(!is_int($is_weekend_badge_req)){return false;}

	$sql = "SELECT * FROM $this->table WHERE IS_WEEKEND_BADGE_REQ=$is_weekend_badge_req";

	return $this->query->query($sql);
}

public function getEventByPrice($price){
	$sql = "SELECT * FROM $this->table WHERE PRICE=$price";

	return $this->query->query($sql);
}

public function getEventByAvailableQty($available_qty){
	if(!is_int($available_qty)){return false;}

	$sql = "SELECT * FROM $this->table WHERE AVAILABLE_QTY=$available_qty";

	return $this->query->query($sql);
}

public function getEventByNote($note){
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NOTE='$note'";

	return $this->query->query($sql);
}

public function getEventByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getEventByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getEventByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getEventByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
