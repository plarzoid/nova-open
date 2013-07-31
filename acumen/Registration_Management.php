<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."person.php");
require_once($page->getClassRoot()."event.php");
require_once($page->getClassRoot()."registration.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

//database interfaces
$person_db = new Person();
$event_db = new Event();
$reg_db = new Registration();

//Form Vars
$form_action=$_SERVER[PHP_SELF]."?view=Registration_Management";
$form_method="post";

//Select user to manage forms
$page->register("person_select", "select", array("use_post"=>1, 
	"get_choices_array_func"=>"getSelectPersonChoices", "get_choices_array_func_args"=>null));
$page->register("select_person_submit", "submit", array("use_post"=>1, "value"=>"Select"));
$page->register("selected_person", "hidden", array("use_post"=>1));

$page->getChoices();

//Pull out the selected user, if possible, so we know what to do.
if($page->submitIsSet("select_person_submit")){
	$selected_person = $page->getVar("person_select");
} else {
	$selected_person = $page->getVar("selected_person");
}

/*********************************************************************

  Existing Registrations listing & Deletion

*********************************************************************/

if(is_numeric($selected_person)){
    $page->register("add_reg", "submit", array("use_post"=>1, "value"=>"Add Event"));

	//get list of existing regsitrations for the user
    $regs = $reg_db->getRegistrationByPersonId($selected_person+0);  //needs an int

	//Register delete buttons for them, and handle any deletions
	foreach($regs as $r){
		$page->register("delete_".$r[ID], "submit", array("use_post"=>1, "value"=>"Delete"));

		if($page->submitIsSet("delete_".$r[ID])){
			$reg_db->deleteRegistration($r[ID]+0);
		}
	}
}


/********************************************************************

New Event Registrations

********************************************************************/

if(is_numeric($selected_person)){

    $page->register("num_regs", "hidden", array("use_post"=>1));
    $num_regs = $page->getVar("num_regs");

    if(!is_numeric($num_regs)){$num_regs=1;}//set a default starting value

    if($page->submitIsSet("add_reg")){$num_regs++;}

    //Register variables with the page
    for($i=0; $i < $num_regs; $i++){
        $page->register("registration_".$i,     "select",   array("use_post"=>1,
            "get_choices_array_func"=>"getEventChoices", "get_choices_array_func_args"=>null));
    }
    $page->getChoices();

	$page->register("submit_regs", "submit", array("use_post"=>1, "value"=>"Submit"));

	if($page->submitIsSet("submit_regs")){
    	$overall_success=true;

	    $person_id = $selected_person;

		for($i=0; $i<$num_regs; $i++){
			$event_id=$page->getVar("registration_".$i);

        	if($event_id != 0){
	            $success = $reg_db->createRegistration($person_id+0, $event_id+0, 1, Session::username());

	            $overall_success = $overall_success && $success;
	        }
	    }
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

if(is_numeric($selected_person)){
	$regs = $reg_db->getRegistrationByPersonId($selected_person+0);
} else {
	$events = $event_db->getEvents();

	foreach(array_keys($events) as $key){
		$registrations = $reg_db->getRegistrationByEventId($events[$key][ID]);
		if($events[$key][AVAILABLE_QTY]==NULL){$events[$key][AVAILABLE_QTY]="Unltd";}
		$events[$key][REGISTRATIONS]=count($registrations);
	}
}
include($page->getTemplateRoot()."registration_management.html");

//Include the Footer HTML
//$page->displayFooter();

?>
