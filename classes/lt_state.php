<?php

/**************************************************
*
*	Lt_state Class
*
***************************************************/

require_once("query.php");

class Lt_state {

var $query=NULL;
var $table="LT_STATE";


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
public function createLt_state($name, $description){

	//Validate the inputs
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (NAME, DESCRIPTION) VALUES ('$name', '$description')";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteLt_state($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Custom Functions

**************************************************/
public function getLt_states(){
	$sql = "SELECT * FROM $this->table";
	return $this->query->query($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getLt_stateById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getLt_stateByName($name){
	if(is_string($name)){if(strlen($name) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE NAME='$name'";

	return $this->query->query($sql);
}

public function getLt_stateByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION='$description'";

	return $this->query->query($sql);
}

}//close class

?>
