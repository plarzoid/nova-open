<?php

/**************************************************
*
*	X_person_team Class
*
***************************************************/

require_once("query.php");

class X_person_team {

var $query=NULL;
var $table="X_PERSON_TEAM";


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
public function createX_person_team($team_id, $person_id, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(!is_int($team_id)){return false;}
	if(!is_int($person_id)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (TEAM_ID, PERSON_ID, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ($team_id, $person_id, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteX_person_team($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getX_person_teamById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getX_person_teamByTeamId($team_id){
	if(!is_int($team_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE TEAM_ID=$team_id";

	return $this->query->query($sql);
}

public function getX_person_teamByPersonId($person_id){
	if(!is_int($person_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE PERSON_ID=$person_id";

	return $this->query->query($sql);
}

public function getX_person_teamByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getX_person_teamByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getX_person_teamByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getX_person_teamByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
