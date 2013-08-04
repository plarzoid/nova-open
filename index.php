<?php

/************************************************************

  Startup the page

************************************************************/

//Include the page class
require_once("classes/page.php");

//instantiate the page
$page = new Page();

/************************************************************

  Handle logout action

*************************************************************/
if($_REQUEST[action]=="logout"){
	Session::logout();
	$logout=true;
}


/************************************************************

  Build Index Page

************************************************************/
//Arrays of views based on role
$user_views = array("Events");
$admin_views = array("Attendee_Management", "Registration_Management", "User_Management", "Events");
$judge_views = array();

if(Session::isNotLoggedIn()){
	$acumen=$page->getAcumenRoot()."login.php";
}

if(Session::isLoggedIn()){
	//set up the link
	$url_prefix="index.php?view=";
	
	//switch views based on role
	switch(Session::role_id()){
	case 1:	$views=$admin_views; break;
	case 2: $views=$judge_views; break;
	default: $views=$user_views; break;
	}

	//pull the requested view from the URL
	$page->register("view", "hidden", array());
	$view=$page->getVar("view");

	if(empty($view)){$view=$views[0];}
	
	//include the desired sub-script
	$acumen=$page->getAcumenRoot().$view.".php";
}

$page->startTemplate();

if(Session::isNotLoggedIn()){if($logout){include($page->getTemplateRoot()."logout.html");}}

if(Session::isLoggedIn()){$page->createTabs($url_prefix, $view, $views);}

if(file_exists($acumen)){
	include($acumen);
} else {
	include($page->getTemplateRoot()."file_not_found.html");
}
if(Session::isLoggedIn()){ $page->closeTabs();}

//footer
$page->displayFooter();

?>
