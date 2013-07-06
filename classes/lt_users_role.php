<?php

/**************************************************
*
*	Lt_users_role Class
*
***************************************************/

require_once("query.php");

class Lt_users_role {

var $query=NULL;
var $table="LT_USERS_ROLE";


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
public function createLt_users_role($label, $description){

	//Validate the inputs
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (LABEL, DESCRIPTION) VALUES ('$label', '$description')";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteLt_users_role($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getLt_users_roleById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getLt_users_roleByLabel($label){
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LABEL='$label'";

	return $this->query->query($sql);
}

public function getLt_users_roleByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION='$description'";

	return $this->query->query($sql);
}

}//close class

?>
