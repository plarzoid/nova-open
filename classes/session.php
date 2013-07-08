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

	function role_id(){
		return $_SESSION[role_id];
	}

	function role_name(){
		return $_SESSION[role_name];
	}

	function isLoggedIn() {
		return $_SESSION[is_logged_in];
	}

	function isNotLoggedIn() {
		return !$_SESSION[is_logged_in];
	}

	function login($userid, $username, $role_id=3, $role_name="User") {
		$_SESSION[userid] = $userid;
		$_SESSION[username] = $username;
		$_SESSION[role_id] = $role_id;
		$_SESSION[role_name] = $role_name;
		$_SESSION[is_logged_in] = true;
	}

	function logout() {
		unset($_SESSION[userid]);
		unset($_SESSION[is_logged_in]);
		unset($_SESSION[username]);
		unset($_SESSION[role_id]);
		unset($_SESSION[role_name]);
	}

}

?>
