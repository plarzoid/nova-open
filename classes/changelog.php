<?php

/**************************************************
*
*	Changelog Class
*
***************************************************/

require_once("query.php");

class Changelog {

var $query=NULL;
var $table="CHANGELOG";


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
public function createChangelog($script, $run_date){

	//Validate the inputs
	if(is_string($script)){if(strlen($script) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (SCRIPT, RUN_DATE) VALUES ('$script', $run_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteChangelog($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getChangelogById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getChangelogByScript($script){
	if(is_string($script)){if(strlen($script) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE SCRIPT='$script'";

	return $this->query->query($sql);
}

public function getChangelogByRunDate($run_date){
	$sql = "SELECT * FROM $this->table WHERE RUN_DATE=$run_date";

	return $this->query->query($sql);
}

}//close class

?>
