<?php

/**************************************************
*
*	Registration Class
*
***************************************************/

require_once("query.php");
require_once("event.php");
require_once("person.php");

class Registration {

var $query=NULL;
var $table="REGISTRATION";


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
public function createRegistration($person_id, $event_id, $quantity, $created_by){

	//Validate the inputs
	if(!is_int($person_id)){return false;}
	if(!is_int($event_id)){return false;}
	if(!is_int($quantity)){return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table ";
	$sql.= "(PERSON_ID, EVENT_ID, QUANTITY, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ";
	$sql.= "($person_id, $event_id, $quantity, '', 0, '$created_by', NOW())";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteRegistration($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getRegistrationById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	$event = $this->query->query($sql);
	
	$event_db = new Event();

	$event_details = $event_db->getEventById($event[0][EVENT_ID]+0);
	unset($event_details[0][ID]);
	return array(array_merge($event[0], $event_details[0]));
}

public function getRegistrationByPersonId($person_id){
	if(!is_int($person_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE PERSON_ID=$person_id";

	$regs = $this->query->query($sql);
	
	if(count($regs) == 1) return $this->getRegistrationById($regs[0][ID]+0);

	$event_db = new Event();

	foreach(array_keys($regs) as $key){
		$event_details = $event_db->getEventById($regs[$key][EVENT_ID]+0);
		unset($event_details[0][ID]);
		$regs[$key] = array_merge($regs[$key], $event_details[0]);
	}

	return $regs;

}

public function getRegistrationByEventId($event_id){
	if(!is_int($event_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ID=$event_id";

	return $this->query->query($sql);
}

public function getRegistrationByQuantity($quantity){
	if(!is_int($quantity)){return false;}

	$sql = "SELECT * FROM $this->table WHERE QUANTITY=$quantity";

	return $this->query->query($sql);
}

public function getRegistrationByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getRegistrationByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getRegistrationByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getRegistrationByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

public function getRegistrationByKey($key){
	$sql = "SELECT * FROM $this->table WHERE KEY=$key";

	return $this->query->query($sql);
}

}//close class

?>
