<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."users.php");
require_once($page->getClassRoot()."password_history.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

//Form Vars
$form_action=$_SERVER[PHP_SELF];
$form_method="post";

//Register variables with the page
$page->register("username", "textbox", array("use_post"=>1, "box_size"=>20));
$page->register("password", "password", array("use_post"=>1, "box_size"=>20));
$page->register("login", "submit", array("use_post"=>1, "value"=>"Login"));

/*********************************************************************

  Processing

*********************************************************************/

if($page->submitIsSet("login")){
	$username = $page->getVar("username");
	$password = $page->getVar("password");

	$user_db = new Users();

    //Get the User
	$user = $user_db->getUsersByUsername($username);
	if(is_array($user)){
	    $user=$user[0]; //strip array wrapper
	} else {
		return false;
	}

	//If actually a user, get the Password history
	$ph = new Password_history();

	$pass = $ph->getPassword_historyByUser_id($user[id]);
	if(is_array($pass)){
	    $pass=$pass[0]; //strip array wrapper
	} else {
		return false;
    }

	//Compare the expected password with what the user entered
	if($pass[PASSWORD_VALUE] == md5($password)){
	    $user_db->resetLoginTries($user[ID]);
	    $user_db->updateLastLogin($user[ID]);
	    return $user[ID];
	} else {
		$user_db->incrementLoginTries($user[ID]);
		return false;
	}

	if(is_array($result)){
		var_dump($result);
	} else {
		$errors[general] = "Username and/or Password Incorrect!  Try again.";
	}
}

/*********************************************************************

  Create the Page

*********************************************************************/

//INclude the Header HTML
$page->startTemplate();

//Include the HTML Template
$page->setDisplayMode("form");
include($page->getTemplateRoot()."login.html");

//Include the Footer HTML
$page->displayFooter();

?>
