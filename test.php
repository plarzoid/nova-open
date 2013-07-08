<?php

require_once("classes/page.php");

$page = new Page();

Session::login(1, 'Admin');

include($page->getAcumenRoot()."manage_users.php");

?>
