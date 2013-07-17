<?php

/*********************************************************************

	Page Setup

*********************************************************************/

include("classes/page.php");

$page = new Page();

//utilize the Page's root
require_once($page->getClassRoot()."users.php");
require_once($page->getClassRoot()."password_history.php");
require_once($page->getClassRoot()."x_users_role.php");
require_once($page->getClassRoot()."lt_users_role.php");


/*********************************************************************

  Handle the logout action

*********************************************************************/

if($_REQUEST[action]=="logout"){
	Session::logout();
	$logout=true;
	$meta='<META http-equiv="refresh" content="2;login.php">';
}


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

	$pass = $ph->getPassword_historyByUsersid($user[ID]+0);

	if(is_array($pass)){
	    $pass=$pass[0]; //strip array wrapper
	} else {
		return false;
    }

	//Compare the expected password with what the user entered
	if($pass[PASSWORD_VALUE] == md5($password)){

	    $user_db->resetLoginTries($user[ID]+0);
	    $user_db->updateLastLogin($user[ID]+0);
	
		$role_db = new X_users_role();
		$role = $role_db->getX_Users_roleByUsersid($user[ID]+0);

		$roles_db = new Lt_users_role();
		$role_name = $roles_db->getLt_users_roleById($role[0][USERS_ROLE]+0);

		Session::login($user[ID], $user[USERNAME], $role_name[0][ID], $role_name[0][LABEL]);
		$success=true;
		$meta='<META http-equiv="refresh" content="5;index.php">';

	} else {

		$user_db->incrementLoginTries($user[ID]);
		$success=false;
		$errors[general] = "Username and/or Password Incorrect!  Try again.";

	}
}

/*********************************************************************

  Create the Page

*********************************************************************/

$page->startTemplate($meta);

if(Session::isNotLoggedIn()){if($logout){include($page->getTemplateRoot()."logout.html");}}

//Include the HTML Template
$page->setDisplayMode("form");
include($page->getTemplateRoot()."login.html");

$page->displayFooter();

?>
