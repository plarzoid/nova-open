<?php

/*********************************************

  Session class that manages the $_SESSION variable

*********************************************/

class Session {

	function init () {
		session_start();
	}

	function userid() {
		return $_SESSION[userid];
	}

	function username() {
		return $_SESSION[username];
	}

	function isLoggedIn() {
		return $_SESSION[is_logged_in];
	}

	function isNotLoggedIn() {
		return !$_SESSION[is_logged_in];
	}

	function login($userid, $username) {
		$_SESSION[userid] = $userid;
		$_SESSION[is_logged_in] = true;
		$_SESSION[username] = $username;
	}

	function logout() {
		unset($_SESSION[userid]);
		unset($_SESSION[is_logged_in]);
		unset($_SESSION[username]);
	}

}

?>
