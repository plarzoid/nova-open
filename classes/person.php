<?php

/**************************************************
*
*	Person Class
*
***************************************************/

require_once("query.php");

class Person {

var $query=NULL;
var $table="PERSON";


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
public function createPerson($first_name, $middle_name, $last_name, $email, $address, $city, $state_id, $country_id, $zip, $phone_number, $website_url, $note, $is_active, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(is_string($first_name)){if(strlen($first_name) == 0){return false;}} else {return false;}
	if(is_string($middle_name)){if(strlen($middle_name) == 0){return false;}} else {return false;}
	if(is_string($last_name)){if(strlen($last_name) == 0){return false;}} else {return false;}
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}
	if(is_string($address)){if(strlen($address) == 0){return false;}} else {return false;}
	if(is_string($city)){if(strlen($city) == 0){return false;}} else {return false;}
	if(!is_int($state_id)){return false;}
	if(!is_int($country_id)){return false;}
	if(is_string($zip)){if(strlen($zip) == 0){return false;}} else {return false;}
	if(is_string($phone_number)){if(strlen($phone_number) == 0){return false;}} else {return false;}
	if(is_string($website_url)){if(strlen($website_url) == 0){return false;}} else {return false;}
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}
	if(!is_int($is_active)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (FIRST_NAME, MIDDLE_NAME, LAST_NAME, EMAIL, ADDRESS, CITY, STATE_ID, COUNTRY_ID, ZIP, PHONE_NUMBER, WEBSITE_URL, NOTE, IS_ACTIVE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ('$first_name', '$middle_name', '$last_name', '$email', '$address', '$city', $state_id, $country_id, '$zip', '$phone_number', '$website_url', '$note', $is_active, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deletePerson($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getPersonById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getPersonByFirstName($first_name){
	if(is_string($first_name)){if(strlen($first_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE FIRST_NAME=$first_name";

	return $this->query->query($sql);
}

public function getPersonByMiddleName($middle_name){
	if(is_string($middle_name)){if(strlen($middle_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE MIDDLE_NAME=$middle_name";

	return $this->query->query($sql);
}

public function getPersonByLastName($last_name){
	if(is_string($last_name)){if(strlen($last_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_NAME=$last_name";

	return $this->query->query($sql);
}

public function getPersonByEmail($email){
	if(is_string($email)){if(strlen($email) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE EMAIL=$email";

	return $this->query->query($sql);
}

public function getPersonByAddress($address){
	if(is_string($address)){if(strlen($address) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE ADDRESS=$address";

	return $this->query->query($sql);
}

public function getPersonByCity($city){
	if(is_string($city)){if(strlen($city) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CITY=$city";

	return $this->query->query($sql);
}

public function getPersonByStateId($state_id){
	if(!is_int($state_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE STATE_ID=$state_id";

	return $this->query->query($sql);
}

public function getPersonByCountryId($country_id){
	if(!is_int($country_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE COUNTRY_ID=$country_id";

	return $this->query->query($sql);
}

public function getPersonByZip($zip){
	if(is_string($zip)){if(strlen($zip) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE ZIP=$zip";

	return $this->query->query($sql);
}

public function getPersonByPhoneNumber($phone_number){
	if(is_string($phone_number)){if(strlen($phone_number) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE PHONE_NUMBER=$phone_number";

	return $this->query->query($sql);
}

public function getPersonByWebsiteUrl($website_url){
	if(is_string($website_url)){if(strlen($website_url) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE WEBSITE_URL=$website_url";

	return $this->query->query($sql);
}

public function getPersonByNote($note){
	if(is_string($note)){if(strlen($note) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NOTE=$note";

	return $this->query->query($sql);
}

public function getPersonByIsActive($is_active){
	if(!is_int($is_active)){return false;}

	$sql = "SELECT * FROM $this->table WHERE IS_ACTIVE=$is_active";

	return $this->query->query($sql);
}

public function getPersonByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getPersonByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getPersonByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getPersonByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
