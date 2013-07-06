<?php

/**************************************************
*
*	Ref_army_faction Class
*
***************************************************/

require_once("query.php");

class Ref_army_faction {

var $query=NULL;
var $table="REF_ARMY_FACTION";


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
public function createRef_army_faction($label, $description, $game_system_id){

	//Validate the inputs
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}
	if(!is_int($game_system_id)){return false;}

	$sql = "INSERT INTO $this->table (LABEL, DESCRIPTION, GAME_SYSTEM_ID) VALUES ('$label', '$description', $game_system_id)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteRef_army_faction($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getRef_army_factionById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getRef_army_factionByLabel($label){
	if(is_string($label)){if(strlen($label) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LABEL=$label";

	return $this->query->query($sql);
}

public function getRef_army_factionByDescription($description){
	if(is_string($description)){if(strlen($description) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE DESCRIPTION=$description";

	return $this->query->query($sql);
}

public function getRef_army_factionByGameSystemId($game_system_id){
	if(!is_int($game_system_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE GAME_SYSTEM_ID=$game_system_id";

	return $this->query->query($sql);
}

}//close class

?>
