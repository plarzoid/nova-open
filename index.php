<?php

//Include the page class
require_once("classes/page.php");

//instantiate the page
$page = new Page();


if(Session::isNotLoggedIn()){
	include($page->getAcumenRoot()."login.php");
} else {
	echo "Logged in!";
}
?>
