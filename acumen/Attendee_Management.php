<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."person.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

$person_db = new Person();

//Form Vars
$form_action=$_SERVER[PHP_SELF]."?view=Attendee_Management";
$form_method="post";

//Select user to manage forms
$page->register("person_select", "select", array("use_post"=>1, 
	"get_choices_array_func"=>"getSelectPersonToManageChoices", "get_choices_array_func_args"=>null));
$page->register("submit_person_select", "submit", array("use_post"=>1, "value"=>"Select"));
$page->register("selected_person", "hidden", array("use_post"=>1));

$page->getChoices();

//Pull out the selected user, if possible, so we know what to do.
if($page->submitIsSet("submit_person_select")){
	$selected_person = $page->getVar("person_select");
} else {
	$selected_person = $page->getVar("selected_person");
}

if(!is_numeric($selected_person)){
	$defaults = array("IS_ACTIVE"=>1);
} else {
	$person_db = new Person();
	$defaults = $person_db->getPersonById($selected_person+0);  //needs an int
	$defaults = $defaults[0];
}

//Register variables with the page
$page->register("first_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["FIRST_NAME"]));
$page->register("middle_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["MIDDLE_NAME"]));
$page->register("last_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["LAST_NAME"]));
$page->register("email", 			"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["EMAIL"]));
$page->register("address",          "textbox",  array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["ADDRESS"]));
$page->register("city",             "textbox",  array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["CITY"]));
$page->register("state",            "select",   array("use_post"=>1,  "default_val"=>$defaults["STATE_ID"],
	"get_choices_array_func"=>"getStateChoices", "get_choices_array_func_args"=>null));
$page->register("country",          "select",   array("use_post"=>1, "default_val"=>$defaults["COUNTRY_ID"],
	"get_choices_array_func"=>"getCountryChoices", "get_choices_array_func_args"=>null));
$page->register("zip",              "textbox",  array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["ZIP"]));
$page->register("phone",            "textbox",  array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["PHONE_NUMBER"]));
$page->register("website",          "textbox",  array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["WEBSITE_URL"]));
$page->register("note",             "textarea", array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["NOTE"]));
$page->register("account_active", 	"select", 	array("use_post"=>1, "default_val"=>$defaults["IS_ACTIVE"], 
    "get_choices_array_func"=>"getYesNoChoices", "get_choices_array_func_args"=>array("YES")));
$page->register("submit_person", 		"submit", 	array("use_post"=>1, "value"=>"Submit"));

$page->getChoices();

/*********************************************************************

  Processing

*********************************************************************/

if($page->submitIsSet("submit_person")){
	
	//Retrieve all the variables off the page
	$first = $page->getVar("first_name");
	$middle = $page->getVar("middle_name");
	$last = $page->getVar("last_name");
	$email = $page->getVar("email");
	$address = $page->getVar("address");
	$city = $page->getVar("city");
	$country = $page->getVar("country");
	$state = $page->getVar("state");
	$zip = $page->getVar("zip");
	$phone = $page->getVar("phone");
	$website = $page->getVar("website");
	$notes = $page->getVar("note");
	$account_active = $page->getVar("account_active");

	//Initialize errors array
	$errors = array();

	//Check the e-mail
	if(!Check::validEmail($email)){
		$errors[email]="Must be of format: x@x.x";
	}
	
	//Check the names
	if(strlen($first) == 0){$errors[first_name]="Cannot be blank!";}
    if(strlen($first) > 50){$errors[first_name]="Must be 50 chars or less!";}
    if(strlen($middle) > 50){$errors[middle_name]="Must be 50 chars or less!";}
	if(strlen($last) == 0){$errors[last_name]="Cannot be blank!";}
    if(strlen($last) > 50){$errors[last_name]="Must be 50 chars or less!";}

	if(strlen($address) == 0){$errors[address]="Cannot be blank!";}
	if(strlen($address) > 255){$errors[address]="Must be 255 chars or less!";}
    if(strlen($city) == 0){$errors[city]="Cannot be blank!";}
    if(strlen($city) > 50){$errors[city]="Must be 50 chars or less!";}
    if(strlen($zip) == 0){$errors[zip]="Cannot be blank!";}
    if(strlen($zip) > 10){$errors[zip]="Must be 10 chars or less!";}
    if(strlen($phone) > 20){$errors[phone]="Must be 20 chars or less!";}
    if(strlen($website) > 50){$errors[website]="Must be 50 chars or less!";}
    if(strlen($note) > 1000){$errors[note]="Must be 1000 chars or less!";}
	
	if(empty($errors)){

		if(!strcmp($selected_person, "NEW")){
			$person_id = $person_db->createPerson($first_name, $middle_name, $last_name, 
												$email, $address, $city, $country, $state, $zip,
												$phone, $website, $notes, $account_active+0,
												Session::username());
			
			if($person_id){
				$success=true;
				$success_string="New Attendee added Successfully!";
			}
		} else {
			$update_success = $person_db->updatePerson($selected_person+0,	$first_name, $middle_name, $last_name, 
													$email, $address, $city, $country, $state, $zip,
													$phone, $website, $notes,$account_active+0,
													Session::username());
			if($update_success){
                $success=true;
                $success_string="Attendee updated Successfully!";
			}
		}

		if(!$success){
			$failure=true;
			$failure_string="Database error has occurred!";
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

include($page->getTemplateRoot()."manage_person_header.html");

if($selected_person){
	include($page->getTemplateRoot()."manage_person.html");
}

include($page->getTemplateRoot()."manage_person_footer.html");

//Include the Footer HTML
//$page->displayFooter();

?>
