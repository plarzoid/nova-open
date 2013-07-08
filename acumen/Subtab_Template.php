<?php

	//array of views for the next set of tabs
	$subviews = array("Modify_Users", "User_Roles");

	//prep the URL
	$url_prefix = $url_prefix.$view."&subview=";

	//get the sub_view
	$page->register("subview", "hidden", array());
	$subview = $page->getVar("subview");

	if(empty($subview)){$subview=$subviews[0];}

	//draw the tabs
	$page->createTabs($url_prefix, $subview, $subviews);

	$subview_to_include=$page->getAcumenRoot().$subview.".php";
	if(file_exists($subview_to_include)){
		include($subview_to_include);
	} else {
		include($page->getTemplateRoot()."file_not_found.html");
	}

	//close the tabs
	$page->closeTabs();

?>
