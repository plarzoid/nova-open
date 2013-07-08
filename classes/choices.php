<?php


/*****************************************************

Include the dependency classes
	(in alphabetical order)

*****************************************************/

require_once("lt_account_status.php");
require_once("lt_users_role.php");
require_once("users.php");


/*****************************************************

Class Declaration

*****************************************************/


class Choices {

	//choices arrays


	function Choices() {
		//do nothing, really
	}

	function getYesNoChoices($default="No"){
		$yes = array("value"=>1, "text"=>"Yes");
		$no  = array("value"=>0, "text"=>"No");
		//returns choices for a Yes/No select box, with the default set to $default
		if(($default=="No") || ($default=="no") || ($default=="NO") 
			|| ($default==false) || ($default == "false") || ($default=="FALSE")){
			return array($no, $yes);
		} else {	
			return array($yes, $no);
		}
	}

	function getSelectUserToManageChoices(){

		//Start up a connection to the Users Table
		$user_db = new Users();
		
		//initialize the return array of choices
		$ret = array(array("text"=>"Create new User...", "value"=>"NEW"));

		//Query for the existing users
		$users = $user_db->getUsers();

		return $this->createChoices($ret, $users, "USERNAME", "ID");
	}

	function getAccountStatusChoices(){
		
		//Start up the Account Status interface
		$as_db = new Lt_account_status();

		//get the various status options
		$statuses = $as_db->getAllLt_account_status();

		return $this->createChoices(array(), $statuses, "LABEL", "ID");
	}

	function getUserRoleChoices(){
		
		//Start up the database interface
		$role_options_db = new Lt_users_role();

		//get the roles
		$roles = $role_options_db->getRoles();

		return $this->createChoices(array(), $roles, "LABEL", "ID");
	}


	function createChoices($initial_array, $options, $text_fieldname, $value_fieldname){
		$ret = $initial_array;

		//Add the users to the choices array
        if(is_array($options)){
            foreach($options as $option){
                $ret[] = array("text"=>$option[$text_fieldname], "value"=>$option[$value_fieldname]);
            }
        }

        return $ret;
	}
}
?>
