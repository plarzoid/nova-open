<?php

/**************************************************
*
*	X_club_person Class
*
***************************************************/

require_once("query.php");

class X_club_person {

var $query=NULL;
var $table="X_CLUB_PERSON";


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
public function createX_club_person($person_id, $club_id, $is_lead, $last_modified_by, $last_modified_date, $created_by, $created_date, $unique){

	//Validate the inputs
	if(!is_int($person_id)){return false;}
	if(!is_int($club_id)){return false;}
	if(!is_int($is_lead)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (PERSON_ID, CLUB_ID, IS_LEAD, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE, UNIQUE) VALUES ($person_id, $club_id, $is_lead, '$last_modified_by', $last_modified_date, '$created_by', $created_date, $unique)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteX_club_person($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getX_club_personById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getX_club_personByPersonId($person_id){
	if(!is_int($person_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE PERSON_ID=$person_id";

	return $this->query->query($sql);
}

public function getX_club_personByClubId($club_id){
	if(!is_int($club_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE CLUB_ID=$club_id";

	return $this->query->query($sql);
}

public function getX_club_personByIsLead($is_lead){
	if(!is_int($is_lead)){return false;}

	$sql = "SELECT * FROM $this->table WHERE IS_LEAD=$is_lead";

	return $this->query->query($sql);
}

public function getX_club_personByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getX_club_personByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getX_club_personByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getX_club_personByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

public function getX_club_personByUnique($unique){
	$sql = "SELECT * FROM $this->table WHERE UNIQUE=$unique";

	return $this->query->query($sql);
}

}//close class

?>
