<?php

/**************************************************
*
*	Appearance_score Class
*
***************************************************/

require_once("query.php");

class Appearance_score {

var $query=NULL;
var $table="APPEARANCE_SCORE";


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
public function createAppearance_score($entry_id, $judge_id, $base_score, $score_modifier, $judge_comment, $last_modified_by, $last_modified_date, $created_by, $created_date){

	//Validate the inputs
	if(!is_int($entry_id)){return false;}
	if(!is_int($judge_id)){return false;}
	if(!is_int($base_score)){return false;}
	if(!is_int($score_modifier)){return false;}
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "INSERT INTO $this->table (ENTRY_ID, JUDGE_ID, BASE_SCORE, SCORE_MODIFIER, JUDGE_COMMENT, LAST_MODIFIED_BY, LAST_MODIFIED_DATE, CREATED_BY, CREATED_DATE) VALUES ($entry_id, $judge_id, $base_score, $score_modifier, $judge_comment, '$last_modified_by', $last_modified_date, '$created_by', $created_date)";

	return $this->query->query($sql);
}


/**************************************************

Delete Function

**************************************************/
public function deleteAppearance_score($id){
	if(!is_int($id)){return false;}

	$sql = "DELETE FROM $this->table WHERE ID=$id";

	return $this->query->update($sql);
}


/**************************************************

Query By Column Function(s)

**************************************************/
public function getAppearance_scoreById($id){
	if(!is_int($id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ID=$id";

	return $this->query->query($sql);
}

public function getAppearance_scoreByEntryId($entry_id){
	if(!is_int($entry_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE ENTRY_ID=$entry_id";

	return $this->query->query($sql);
}

public function getAppearance_scoreByJudgeId($judge_id){
	if(!is_int($judge_id)){return false;}

	$sql = "SELECT * FROM $this->table WHERE JUDGE_ID=$judge_id";

	return $this->query->query($sql);
}

public function getAppearance_scoreByBaseScore($base_score){
	if(!is_int($base_score)){return false;}

	$sql = "SELECT * FROM $this->table WHERE BASE_SCORE=$base_score";

	return $this->query->query($sql);
}

public function getAppearance_scoreByScoreModifier($score_modifier){
	if(!is_int($score_modifier)){return false;}

	$sql = "SELECT * FROM $this->table WHERE SCORE_MODIFIER=$score_modifier";

	return $this->query->query($sql);
}

public function getAppearance_scoreByJudgeComment($judge_comment){
	$sql = "SELECT * FROM $this->table WHERE JUDGE_COMMENT=$judge_comment";

	return $this->query->query($sql);
}

public function getAppearance_scoreByLastModifiedBy($last_modified_by){
	if(is_string($last_modified_by)){if(strlen($last_modified_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_BY=$last_modified_by";

	return $this->query->query($sql);
}

public function getAppearance_scoreByLastModifiedDate($last_modified_date){
	$sql = "SELECT * FROM $this->table WHERE LAST_MODIFIED_DATE=$last_modified_date";

	return $this->query->query($sql);
}

public function getAppearance_scoreByCreatedBy($created_by){
	if(is_string($created_by)){if(strlen($created_by) == 0){return false;}} else {return false;}

	$sql = "SELECT * FROM $this->table WHERE CREATED_BY=$created_by";

	return $this->query->query($sql);
}

public function getAppearance_scoreByCreatedDate($created_date){
	$sql = "SELECT * FROM $this->table WHERE CREATED_DATE=$created_date";

	return $this->query->query($sql);
}

}//close class

?>
