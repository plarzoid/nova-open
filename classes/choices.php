<?php


/*****************************************************

Include the dependency classes
	(in alphabetical order)

*****************************************************/

require_once("event.php");
require_once("event_material.php");
require_once("lt_account_status.php");
require_once("lt_country.php");
require_once("lt_event_type.php");
require_once("lt_event_material_type.php");
require_once("lt_game_system.php");
require_once("lt_state.php");
require_once("lt_users_role.php");
require_once("person.php");
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
		
		switch($default){
			case "No":
			case "no":
			case "NO":
				return array($no, $yes);
			default:
				return array($yes, $no);
		}
	}

	function getCountryChoices(){
		$country_db = new Lt_country();
		$countries = $country_db->getLt_countrys();
		$ret = array(array("text"=>"Please Select...", "value"=>0));

		foreach($countries as $c){
			$ret[]=array("text"=>$c[NAME], "value"=>$c[ID]);
		}

		return $ret;
	}

	function getStateChoices(){
		$state_db = new Lt_state();
		$states = $state_db->getLt_states();

		$ret = array(array("text"=>"Please Select...", "value"=>0));
		
		foreach($states as $s){
			$ret[] = array("text"=>$s[DESCRIPTION]." (".$s[NAME].")", "value"=>$s[ID]);
		}

		return $ret;

	}

	function getGameSystemChoices(){
		$gs_db = new Lt_game_system();
		$game_systems = $gs_db->getLt_game_systems();

		$ret = array(array("text"=>"Please Select...", "value"=>0));
        
		foreach($game_systems as $s){
            $ret[] = array("text"=>$s[NAME], "value"=>$s[ID]);
        }

        return $ret;
	}

	function getEventTypes(){
		$et_db = new Lt_event_type();
		$types = $et_db->getLt_evet_types();

		$ret = array(array("text"=>"Please Select...", "value"=>0));

	    foreach($types as $t){
 	       $ret[] = array("text"=>$t[NAME], "value"=>$t[ID]);
		}

        return $ret;
	}

	function getEventMaterialTypeChoices(){
		$emt_db = new Lt_event_material_type();
		$types = $emt_db->getLt_event_material_types();

        $ret = array(array("text"=>"Please Select...", "value"=>0));

        foreach($types as $t){
        	$ret[] = array("text"=>$t[NAME], "value"=>$t[ID]);
        }

        return $ret;
	}

	function getEventChoices(){
		$event_db = new Event();
		$events = $event_db->getAvailableEvents();

		$ret = array(array("text"=>"Please Select...", "value"=>0));

        foreach($events as $e){
			$text=$e[NAME]." ($".$e[PRICE]."), ".date("D", $e[EVENT_START]);
            $ret[] = array("text"=>$text, "value"=>$e[ID]);
        }

		return $ret;
    }


	function getEventChoicesByGameSystem($game_system_id){
		$event_db = new Event();
		$events = $event_db->getEventByGameSystemId($game_system_id);

		$ret = array(array("text"=>"Please Select...", "value"=>0));

		foreach($events as $e){
			$ret[] = array("text"=>$e[NAME], "value"=>$e[ID]);
		}

		return $ret;
	}

	function getEventMaterials(){
		$db = new Event_material();
		$materials = $db->getEvent_materials();

		$ret = array(array("text"=>"Please Select...", "value"=>0));

		foreach($materials as $m){
			$ret[] = array("text"=>$m[NAME], "value"=>$m[ID]);
		}

		return $ret;
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

    function getSelectPersonToManageChoices(){

        //Start up a connection to the Users Table
        $person_db = new Person();

		//initialize the return array of choices
        $ret = array(array("text"=>"Add new Attendee...", "value"=>"NEW"));

        //Query for the existing users
        $persons = $person_db->getPersons();

		if(is_array($persons)){
			foreach($persons as $p){
				$ret[] = array("text"=>$p["LAST_NAME"].", ".$p["FIRST_NAME"], "value"=>$p[ID]);
			}
		}

		return $ret;
    }

	function getSelectPersonChoices(){
		//Start up a connection to the Users Table
        $person_db = new Person();

        //initialize the return array of choices
        $ret = array(array("text"=>"Please select...", "value"=>"NULL"));

        //Query for the existing users
        $persons = $person_db->getPersons();

        if(is_array($persons)){
            foreach($persons as $p){
                $ret[] = array("text"=>$p["LAST_NAME"].", ".$p["FIRST_NAME"], "value"=>$p[ID]);
            }
        }

        return $ret;
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
