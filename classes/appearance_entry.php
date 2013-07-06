<?php

/**************************************************
*
*	Appearance_entry Class
*
***************************************************/

require_once("query.php");

class Appearance_entry {

var $query=NULL;
var $table="APPEARANCE_ENTRY";


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
public function createAppearance_entry($artist_id, $event_id, $label, $description, $category_id, $manufacturer_id, $army_faction_id, $note, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(!is_int($artist_id)){return false;}
	if(!is_int($event_id)){return false;}
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}
	if(!is_int($category_id)){return false;}
	if(!is_int($manufacturer_id)){return false;}
	if(!is_int($army_faction_id)){return false;}
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (ARTIST_ID, EVENT_ID, LABEL, DESCRIPTION, CATEGORY_ID, MANUFACTURER_ID, ARMY_FACTION_ID, NOTE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ($artist_id, $event_id, '$label', '$description', $category_id, $manufacturer_id, $army_faction_id, '$note', '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteAppearance_entry($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getAppearance_entryById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getAppearance_entryByArtistId($artist_id){
	if(!is_int($artist_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ARTIST_ID=$artist_id";

	return $this->query->query($sql);
}

public function getAppearance_entryByEventId($event_id){
	if(!is_int($event_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE EVENT_ID=$event_id";

	return $this->query->query($sql);
}

public function getAppearance_entryByLabel($label){
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LABEL=$label";

	return $this->query->query($sql);
}

public function getAppearance_entryByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION=$description";

	return $this->query->query($sql);
}

public function getAppearance_entryByCategoryId($category_id){
	if(!is_int($category_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE CATEGORY_ID=$category_id";

	return $this->query->query($sql);
}

public function getAppearance_entryByManufacturerId($manufacturer_id){
	if(!is_int($manufacturer_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE MANUFACTURER_ID=$manufacturer_id";

	return $this->query->query($sql);
}

public function getAppearance_entryByArmyFactionId($army_faction_id){
	if(!is_int($army_faction_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ARMY_FACTION_ID=$army_faction_id";

	return $this->query->query($sql);
}

public function getAppearance_entryByNote($note){
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NOTE=$note";

	return $this->query->query($sql);
}

public function getAppearance_entryByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getAppearance_entryByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getAppearance_entryByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getAppearance_entryByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
