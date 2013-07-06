<?php

/**************************************************
*
*	Users Class
*
***************************************************/

require_once("query.php");

class Users {

var $query=NULL;
var $table="USERS";


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
public function createUsers($username, $first_name, $middle_name, $last_name, $email, $account_status, $cnt_login_fail, $last_login_date, $is_pw_change_required, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(is_string($username)){if(strlen($username) == 0){return false;}} else {return false;}
	if(is_string($first_name)){if(strlen($first_name) == 0){return false;}} else {return false;}
	if(is_string($middle_name)){if(strlen($middle_name) == 0){return false;}} else {return false;}
	if(is_string($last_name)){if(strlen($last_name) == 0){return false;}} else {return false;}
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}
	if(!is_int($account_status)){return false;}
	if(!is_int($cnt_login_fail)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (USERNAME, FIRST_NAME, MIDDLE_NAME, LAST_NAME, EMAIL, ACCOUNT_STATUS, CNT_LOGIN_FAIL, LAST_LOGIN_DATE, IS_PW_CHANGE_REQUIRED, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ('$username', '$first_name', '$middle_name', '$last_name', '$email', $account_status, $cnt_login_fail, $last_login_date, $is_pw_change_required, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteUsers($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


public function incrementLoginTries($id){
    if(!is_int($id)){return false;}

    $sql = "UPDATE $this->table SET CNT_LOGIN_FAIL=CNT_LOGIN_FAIL+1 WHERE ID=$id";

   return $this->query->update($sql);
}

public function resetLoginTries($id){
   if(!is_int($id)){return false;}

   $sql = "UPDATE $this->table SET CNT_LOGIN_FAIL=0 WHERE ID=$id";

return $this->query->update($sql);
}

public function updateLastLogin($id){
	if(!is_int($id)){return false;}

	$sql = "UPDATE $this->table SET LAST_LOGIN_DATE=NOW() WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getUsersById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getUsersByUsername($username){
	if(is_string($username)){if(strlen($username) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE USERNAME='$username'";

	return $this->query->query($sql);
}

public function getUsersByFirstName($first_name){
	if(is_string($first_name)){if(strlen($first_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE FIRST_NAME='$first_name'";

	return $this->query->query($sql);
}

public function getUsersByMiddleName($middle_name){
	if(is_string($middle_name)){if(strlen($middle_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE MIDDLE_NAME='$middle_name'";

	return $this->query->query($sql);
}

public function getUsersByLastName($last_name){
	if(is_string($last_name)){if(strlen($last_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_NAME='$last_name'";

	return $this->query->query($sql);
}

public function getUsersByEmail($email){
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE EMAIL='$email'";

	return $this->query->query($sql);
}

public function getUsersByAccountStatus($account_status){
	if(!is_int($account_status)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ACCOUNT_STATUS=$account_status";

	return $this->query->query($sql);
}

public function getUsersByCntLoginFail($cnt_login_fail){
	if(!is_int($cnt_login_fail)){return false;}

	$sql = "SELECT * FROM $this->table WHERE CNT_LOGIN_FAIL=$cnt_login_fail";

	return $this->query->query($sql);
}

public function getUsersByLastLoginDate($last_login_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_LOGIN_DATE=$last_login_date";

	return $this->query->query($sql);
}

public function getUsersByIsPwChangeRequired($is_pw_change_required){
	$sql = "SELECT * FROM $this->table WHERE IS_PW_CHANGE_REQUIRED=$is_pw_change_required";

	return $this->query->query($sql);
}

public function getUsersByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getUsersByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getUsersByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getUsersByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
