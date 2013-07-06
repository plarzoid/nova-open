<?php

/**************************************************
*
*	X_users_role Class
*
***************************************************/

require_once("query.php");

class X_users_role {

var $query=NULL;
var $table="X_USERS_ROLE";


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
public function createX_users_role($users_id, $users_role, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(!is_int($users_id)){return false;}
	if(!is_int($users_role)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (USERS_ID, USERS_ROLE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ($users_id, $users_role, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteX_users_role($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getX_users_roleById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getX_users_roleByUsersId($users_id){
	if(!is_int($users_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE USERS_ID=$users_id";

	return $this->query->query($sql);
}

public function getX_users_roleByUsersRole($users_role){
	if(!is_int($users_role)){return false;}

	$sql = "SELECT * FROM $this->table WHERE USERS_ROLE=$users_role";

	return $this->query->query($sql);
}

public function getX_users_roleByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getX_users_roleByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getX_users_roleByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getX_users_roleByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
