<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."users.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

//Form Vars
$form_method=$_SERVER[PHP_SELF];
$form_action="post";

//Register variables with the page
$page->register("username", "textbox", array("use_post"=>1, "box_size"=>20));
$page->register("password", "password", array("use_post"=>1, "box_size"=>20));
$page->register("login", "submit", array("use_post"=>1, "value"=>"Login"));

/*********************************************************************

  Processing

*********************************************************************/



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
