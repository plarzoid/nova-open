<?php

/*********************************************************************

	Page Setup

	Items in the acumen layer are always called by something outside
		So, there's never a need to instantiate the Page class

*********************************************************************/

//utilize the Page's root
require_once($page->getClassRoot()."users.php");
require_once($page->getClassRoot()."password_history.php");
require_once($page->getClassRoot()."x_users_role.php");

/*********************************************************************

  Variables & HTML Inputs

*********************************************************************/

//database interfaces
$role_db = new X_users_role();

//Form Vars
$form_action=$_SERVER[PHP_SELF]."?view=".$view;
$form_method="post";

//Select user to manage forms
$page->register("user_select", "select", array("use_post"=>1, 
	"get_choices_array_func"=>"getSelectUserToManageChoices", "get_choices_array_func_args"=>null));
$page->register("submit_user_select", "submit", array("use_post"=>1, "value"=>"Select"));
$page->register("selected_user", "hidden", array("use_post"=>1));

$page->getChoices();

//Pull out the selected user, if possible, so we know what to do.
if($page->submitIsSet("submit_user_select")){
	$selected_user = $page->getVar("user_select");
} else {
	$selected_user = $page->getVar("selected_user");
}

if(!is_numeric($selected_user)){
	$defaults = array("ACCOUNT_STATUS"=>1);
} else {
	$user_db = new Users();
	$defaults = $user_db->getUsersById($selected_user+0);  //needs an int
	$defaults = $defaults[0];

	$roles = $role_db->getX_users_roleByUsersid($selected_user+0);
	$defaults["USER_ROLE"] = $roles[0]["USERS_ROLE"];
}

//Register variables with the page
$page->register("username", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["USERNAME"]));
$page->register("password", 		"password", array("use_post"=>1, "box_size"=>20));
$page->register("confirm_password", "password", array("use_post"=>1, "box_size"=>20));
$page->register("first_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["FIRST_NAME"]));
$page->register("middle_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["MIDDLE_NAME"]));
$page->register("last_name", 		"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["LAST_NAME"]));
$page->register("email", 			"textbox", 	array("use_post"=>1, "box_size"=>20, "default_val"=>$defaults["EMAIL"]));
$page->register("user_role",		"select",	array("use_post"=>1, "default_val"=>$defaults["USER_ROLE"],
	"get_choices_array_func"=>"getUserRoleChoices", "get_choices_array_func_args"=>null));
$page->register("account_status", 	"select", 	array("use_post"=>1, "default_val"=>$defaults["ACCOUNT_STATUS"], 
    "get_choices_array_func"=>"getAccountStatusChoices", "get_choices_array_func_args"=>null));
$page->register("submit_user", 		"submit", 	array("use_post"=>1, "value"=>"Submit"));

$page->getChoices();

/*********************************************************************

  Processing

*********************************************************************/

if($page->submitIsSet("submit_user")){
	
	//Retrieve all the variables off the page
	$username = $page->getVar("username");
	$password = $page->getVar("password");
	$password_c = $page->getVar("confirm_password");
	$first = $page->getVar("first_name");
	$middle = $page->getVar("middle_name");
	$last = $page->getVar("last_name");
	$email = $page->getVar("email");
	$role = $page->getVar("user_role");
	$account_status = $page->getVar("account_status");

	$user_db = new Users();

	//Initialize errors array
	$errors = array();

	//If a new user, make sure the username is unique
    if(!strcmp($selected_user, "NEW")){
	
		$user = $user_db->getUsersByUsername($username);
		if(is_array($user)){
	    	$errors[username]="Username already exists!";
		}
	}

	//Check that the username is valid
	if(strlen($username) == 0){$errors[username]="Username cannot be blank!";}
	if(strlen($username) > 50){$errors[username]="Username must be 50 chars or less!";}

	//If a new user, or new passwords for an existing one, then make sure they match
	if(!strcmp($selected_user, "NEW")){
		if(strlen($password) == 0){$errors[password]="Cannot be blank!";}
		if(strlen($password) == 0){$errors[confirm_password]="Cannot be blank!";}
	}
	if((strlen($password) > 0) && (strlen($password_c) > 0)){
		if(strcmp($password, $password_c)){
			$errors[password]="Passwords do not match.";
			$errors[confirm_password]="Passwords do not match.";
		}
	}
	
	//Check the e-mail
	if(!Check::validEmail($email)){
		$errors[email]="Must be of format: x@x.x";
	}
	
	//Check the names
	if(strlen($first) == 0){$errors[first_name]="Cannot be blank!";}
    if(strlen($first) > 50){$errors[first_name]="Must be 50 chars or less!";}
	if(strlen($middle) == 0){$errors[middle_name]="Cannot be blank!";}
    if(strlen($middle) > 50){$errors[middle_name]="Must be 50 chars or less!";}
	if(strlen($last) == 0){$errors[last_name]="Cannot be blank!";}
    if(strlen($last) > 50){$errors[last_name]="Must be 50 chars or less!";}

	if(empty($errors)){

		//create password_history database interface
		$ph_db = new Password_history();

		if(!strcmp($selected_user, "NEW")){
			$new_user_id = $user_db->createUser($username, 
												$first_name, $middle_name, $last_name, 
												$email, $account_status+0, Session::username());
			
			if($new_user_id){
				$success_password = $ph_db->createPassword_history($new_user_id+0, md5($password), Session::username());
							
				$success_role = $role_db->createX_users_role($new_user_id+0, $role+0, Session::username());

				if($success_password && $success_role){
					$success=true;
					$success_string="New User created Successfully!";
				}
			}
		} else {
			$update_success = $user_db->updateUser(	$selected_user+0, $username, 
													$first_name, $middle_name, $last_name, 
													$email, $account_status+0, Session::username());

			$role_update_success = $role_db->updateX_users_role($selected_user+0, $role+0, Session::username());

			if(strlen($password) > 0){
				$password_update_success = $ph_db->updatePassword_history($selected_user+0, md5($password), Session::username());
			} else {
				$password_update_success=true;
			}

			if($update_success && $password_update_success && $role_update_success){
                $success=true;
                $success_string="User updated Successfully!";
            }
		}

		if(!$success){
			$failure=true;
			$failure_string="Database error has occurred!";
		}
	}
}

/*********************************************************************

  Create the Page

*********************************************************************/

//INclude the Header HTML
//$page->startTemplate();

//Include the HTML Template
if($success){
	$page->setDisplayMode("text");
} else {
	$page->setDisplayMode("form");
}

include($page->getTemplateRoot()."manage_users_header.html");

if($selected_user){
	include($page->getTemplateRoot()."manage_users.html");
}

include($page->getTemplateRoot()."manage_users_footer.html");

//Include the Footer HTML
//$page->displayFooter();

?>
