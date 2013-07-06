<?php

/**************************************************
*
*	Club Class
*
***************************************************/

require_once("query.php");

class Club {

var $query=NULL;
var $table="CLUB";


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
public function createClub($name, $description, $email, $website_url, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}
	if(is_string($website_url)){if(strlen($website_url) == 0){return false;}} else {return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (NAME, DESCRIPTION, EMAIL, WEBSITE_URL, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ('$name', '$description', '$email', '$website_url', '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteClub($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getClubById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getClubByName($name){
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NAME='$name'";

	return $this->query->query($sql);
}

public function getClubByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION='$description'";

	return $this->query->query($sql);
}

public function getClubByEmail($email){
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE EMAIL='$email'";

	return $this->query->query($sql);
}

public function getClubByWebsiteUrl($website_url){
	if(is_string($website_url)){if(strlen($website_url) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE WEBSITE_URL='$website_url'";

	return $this->query->query($sql);
}

public function getClubByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY='$last_modified_by'";

	return $this->query->query($sql);
}

public function getClubByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getClubByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY='$created_by'";

	return $this->query->query($sql);
}

public function getClubByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
