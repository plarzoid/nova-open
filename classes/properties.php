<?php

/**************************************************
*
*	Properties Class
*
***************************************************/

require_once("query.php");

class Properties {

var $query=NULL;
var $table="PROPERTIES";


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
public function createProperties($property_name, $property_value){

	//Validate the inputs
	if(is_string($property_name)){if(strlen($property_name) == 0){return false;}} else {return false;}
	if(is_string($property_value)){if(strlen($property_value) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (PROPERTY_NAME, PROPERTY_VALUE) VALUES ('$property_name', '$property_value')";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteProperties($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getPropertiesById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getPropertiesByPropertyName($property_name){
	if(is_string($property_name)){if(strlen($property_name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE PROPERTY_NAME='$property_name'";

	return $this->query->query($sql);
}

public function getPropertiesByPropertyValue($property_value){
	if(is_string($property_value)){if(strlen($property_value) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE PROPERTY_VALUE='$property_value'";

	return $this->query->query($sql);
}

}//close class

?>
