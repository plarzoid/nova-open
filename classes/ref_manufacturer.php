<?php

/**************************************************
*
*	Ref_manufacturer Class
*
***************************************************/

require_once("query.php");

class Ref_manufacturer {

var $query=NULL;
var $table="REF_MANUFACTURER";


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
public function createRef_manufacturer($label, $description){

	//Validate the inputs
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (LABEL, DESCRIPTION) VALUES ('$label', '$description')";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteRef_manufacturer($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getRef_manufacturerById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getRef_manufacturerByLabel($label){
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LABEL=$label";

	return $this->query->query($sql);
}

public function getRef_manufacturerByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION=$description";

	return $this->query->query($sql);
}

}//close class

?>
