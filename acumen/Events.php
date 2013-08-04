<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."event.php");
require_once($page->getClassRoot()."registration.php");
require_once($page->getClassRoot()."person.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

//database interfaces

$event_db = new Event();
$reg_db = new Registration();
$person_db = new Person();

//Form Vars
$form_action=$_SERVER[PHP_SELF]."?view=".$view;
$form_method="post";


/********************************************************************

Gathering the two primary inputs: Game System and Event

********************************************************************/

/*************
Game Sstem
*************/

//Select user to manage forms
$page->register("game_system_select", "select", array("use_post"=>1, 
	"get_choices_array_func"=>"getGameSystemChoices", "get_choices_array_func_args"=>null));
$page->register("submit_game_system_select", "submit", array("use_post"=>1, "value"=>"Select"));
$page->register("selected_game_system", "hidden", array("use_post"=>1));

$page->getChoices();

//Pull out the selected game_system
if($page->submitIsSet("submit_game_system_select")){
	$selected_game_system = $page->getVar("game_system_select");
} else {
	$selected_game_system = $page->getVar("selected_game_system");
}

/***********
Event
***********/
if(is_numeric($selected_game_system)){

	$page->register("event_select", "select", array("use_post"=>1, 
    	"get_choices_array_func"=>"getEventChoicesByGameSystem", "get_choices_array_func_args"=>array($selected_game_system+0)));
	$page->register("submit_event_select", "submit", array("use_post"=>1, "value"=>"Select"));
	$page->register("selected_event", "hidden", array("use_post"=>1));

	$page->getChoices();

	//Pull out the event
	if($page->submitIsSet("submit_event_select")){
		$selected_event = $page->getVar("event_select");
	} else {
		$selected_event = $page->getVar("selected_event");
	}

}

/***********************************************************************

Prep the rest of the page

***********************************************************************/

if(is_numeric($selected_event)){

	$event = $event_db->getEventById($selected_event+0);

	if($event[0][AVAILABLE_QTY]==NULL){$event[0][AVAILABLE_QTY]="Unltd.";}

	$registrations = $reg_db->getRegistrationByEventId($selected_event+0);

	if(is_array($registrations[0])){//wrapper
		$attendees = array();
		
		foreach($registrations as $r){
			$attendee = $person_db->getPersonById($r[PERSON_ID]+0);
			$attendee[0][REGISTRATION_ID]=$r[ID];

			$attendees[]=$attendee[0];
		}

	} else {
		$registrations=false;
	}
}

/*********************************************************************

  Create the Page

*********************************************************************/

//INclude the Header HTML
//$page->startTemplate();

//Include the HTML Template
if($success){
	$page->setDisplayMode("text");
} else {
	$page->setDisplayMode("form");
}

include($page->getTemplateRoot()."events_header.html");

if($selected_event){
	include($page->getTemplateRoot()."event_registrations.html");
}

?>
