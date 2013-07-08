<?php

/**************************************************
*
*	Password_history Class
*
***************************************************/

require_once("query.php");

class Password_history {

var $query=NULL;
var $table="PASSWORD_HISTORY";


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
public function createPassword_history($users_id, $password_value, $created_by){

	//Validate the inputs
	if(!is_int($users_id)){return false;}
	if(is_string($password_value)){if(strlen($password_value) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table ";
	$sql.= "(USERS_ID, CHANGED_DATE, PASSWORD_VALUE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) ";
	$sql.= "VALUES ";
	$sql.= "($users_id, 0, '$password_value', '', 0, '$created_by', NOW())";

	return $this->query->insert($sql);
}


public function updatePassword_history($users_id, $password_value, $last_modified_by){

	//Validate the inputs
    if(!is_int($users_id)){return false;}
	if(is_string($password_value)){if(strlen($password_value) == 0){return false;}} else {return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	//build the query
	$sql = "UPDATE $this->table SET ";
	$sql.= "PASSWORD_VALUE='$password_value', ";
	$sql.= "LAST_MODIFIED_BY='$last_modified_by', ";
	$sql.= "CHANGED_DATE=NOW(), LAST_MODIFIED_DATE=NOW() ";
	$sql.= "WHERE USERS_ID=$users_id";

	//execute it
	return $this->query->update($sql);
}

/**************************************************

Delete Function

**************************************************/
public function deletePassword_history($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getPassword_historyById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getPassword_historyByUsersId($users_id){
	if(!is_int($users_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE USERS_ID=$users_id";

	return $this->query->query($sql);
}

public function getPassword_historyByChangedDate($changed_date){
	$sql = "SELECT * FROM $this->table WHERE CHANGED_DATE=$changed_date";

	return $this->query->query($sql);
}

public function getPassword_historyByPasswordValue($password_value){
	if(is_string($password_value)){if(strlen($password_value) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE PASSWORD_VALUE='$password_value'";

	return $this->query->query($sql);
}

public function getPassword_historyByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getPassword_historyByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getPassword_historyByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getPassword_historyByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
