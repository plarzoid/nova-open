<?php

/**************************************************
*
*	Event_material Class
*
***************************************************/

require_once("query.php");

class Event_material {

var $query=NULL;
var $table="EVENT_MATERIAL";


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
public function createEvent_material($name, $description, $material_type_id, $event_id, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}
	if(!is_int($material_type_id)){return false;}
	if(!is_int($event_id)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (NAME, DESCRIPTION, MATERIAL_TYPE_ID, EVENT_ID, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ('$name', '$description', $material_type_id, $event_id, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteEvent_material($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getEvent_materialById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getEvent_materialByName($name){
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NAME=$name";

	return $this->query->query($sql);
}

public function getEvent_materialByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION=$description";

	return $this->query->query($sql);
}

public function getEvent_materialByMaterialTypeId($material_type_id){
	if(!is_int($material_type_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE MATERIAL_TYPE_ID=$material_type_id";

	return $this->query->query($sql);
}

public function getEvent_materialByEventId($event_id){
	if(!is_int($event_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ID=$event_id";

	return $this->query->query($sql);
}

public function getEvent_materialByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getEvent_materialByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getEvent_materialByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getEvent_materialByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
