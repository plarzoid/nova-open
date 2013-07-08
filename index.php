<?php

//Include the page class
require_once("classes/page.php");

//instantiate the page
$page = new Page();

//Arrays of views based on role
$user_views = array();
$admin_views = array("User_Management");
$judge_views = array();

$page->startTemplate();

if(Session::isNotLoggedIn()){
	include($page->getAcumenRoot()."login.php");
} else {
	//set up the link
	$url_prefix="index.php?view=";
	
	//TODO switch views based on role
	$views=$admin_views;

	//pull the requested view from the URL
	$page->register("view", "hidden", array());
	$view=$page->getVar("view");

	if(empty($view)){$view=$views[0];}

	//draw the tabs
	$page->createTabs($url_prefix, $view, $views);
	
	//include the desired sub-script
	$view_to_include=$page->getAcumenRoot().$view.".php";
    if(file_exists($view_to_include)){
		include($view_to_include);
    } else {
        include($page->getTemplateRoot()."file_not_found.html");
    }

	//proper html, don't leave the tables open
	$page->closeTabs();
}


//footer
$page->displayFooter();
?>
