<?php

/**************************************************
*
*	Event_bundle Class
*
***************************************************/

require_once("query.php");

class Event_bundle {

var $query=NULL;
var $table="EVENT_BUNDLE";


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
public function createEvent_bundle($bundle_id, $event_id){

	//Validate the inputs
	if(!is_int($bundle_id)){return false;}
	if(!is_int($event_id)){return false;}

	$sql = "INSERT INTO $this->table (BUNDLE_ID, EVENT_ID) VALUES ($bundle_id, $event_id)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteEvent_bundle($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getEvent_bundleById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getEvent_bundleByBundleId($bundle_id){
	if(!is_int($bundle_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE BUNDLE_ID=$bundle_id";

	return $this->query->query($sql);
}

public function getEvent_bundleByEventId($event_id){
	if(!is_int($event_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ID=$event_id";

	return $this->query->query($sql);
}

}//close class

?>
