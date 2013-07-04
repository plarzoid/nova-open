#!/usr/bin/php
<?php
//turn off notices
error_reporting(E_ERROR & ~E_NOTICE);

//Test Zone
//END Test Zone

/*************************************************

Check for the right number of inputs

*************************************************/

$inputs = $argv;
if(count($inputs) != 3){
	echo "Usage: create_classes.php <sql script> <output directory>\n";
	return;
}


/************************************************

Check accessability of SQL file

************************************************/
$sql_file = $inputs[1];

if(!file_exists($sql_file)){
	echo "Unable to locate file: $sql_file.\n";
	return;
}

if(!is_readable($sql_file)){
	echo "Unable to read file: $sql_file.\n";
	return;
}

$sql_fptr = fopen($sql_file, "r");

/************************************************

Check accessability of Class directory

************************************************/
$class_dir = $inputs[2];

if(!is_dir($class_dir)){
    echo "Directory does not exist: $class_dir.\n";
    return;
}   

if(!is_writable($class_dir)){
    echo "Unable to read file: $class_dir.\n";
    return;
}

echo "Opening files...\n";


/****************************************************

Start parsing the file

****************************************************/

//disable column detection, until we've encountered a create table line
$table_opened=false;

$line = fgets($sql_fptr);

while($line){

/************************************************

Get the table name

************************************************/
if(is_numeric(strpos(strToLower($line), 'create table'))){

	$matches=array();
	preg_match("~\s([^\s]+)\s?\(~", $line, $matches);

	$table_name = strToLower(end($matches));
	$proper_table_name = ucfirst($table_name);;

	echo "\n======================================================================\n";
	echo "\n";
	echo "Found Table: '$table_name'\n";
	echo "Proper Table name: '$proper_table_name'\n";

	//create the empty columns array
	$columns = array();

	//Create the empty keys array
	$keys = array("primary"=>"", "foreign"=>array());

	//enable column detection
	$table_opened=true;
}

/************************************************

Get the columns of the table

************************************************/
if($table_opened && 
	(strpos($line, "(") == false) && (strpos($line, ")") == false) && 
	(strpos(strToLower($line), "constraint") == false)){

	$column_parts = explode(" ", $line);
	if(count($column_parts) > 1){
		$name = trim($column_parts[0]);
		$varname = "\$".strToLower($name);
		$type = $column_parts[1];
		$column_entry = array("name"=>$name, "varname"=>$varname, "type"=>$type);

		if(preg_match("~int~", strtolower($type))){
			$column_entry[validateFn]='if(!is_int('.$varname.')){return false;}';
		} else if(preg_match("~varchar~", strtolower($type))){
		    $column_entry[validateFn]="if(is_string(".$varname.")){if(strlen(".$varname.") == 0){return false;}} else {return false;}";
		} else if(preg_match("~boolean~", strtolower($type))){
		    $column_entry[validateFn]='if(!is_bool('.$varname.')){return false;}';
		}

		$columns[]=$column_entry;

		echo "Found Column: ".$column_entry[name]."\n";
	}
}


/************************************************

Get the keys

************************************************/

if($table_opened && is_numeric(strpos(strToLower($line),'constraint'))){

	$matches=array();
	$key_detection_pattern="~constraint ([^\s]+) (primary|foreign) key (references )?\(([^\s]+)\)~";
	preg_match($key_detection_pattern, strToLower($line), $matches);

	if(!strcmp($matches[2], "primary")){

		$keys["primary"] = strToUpper(end($matches));

		foreach($columns as $key=>$column_array){
			if(!strcmp($columns[$key]["name"], $keys["primary"])){
				$columns[$key]["primary_key"]=true;
				$primary_key = array("name"=>$columns[$key][name], "varname"=>$columns[$key][varname]);
				echo "Found Primary Key: ".$keys["primary"]."\n";
			}
		}
	}

	if(!strcmp($matches[2], "foreign")){
		$keys["foreign"][] = strToUpper(end($matches));
		echo "Found Foreign Key: ".end($keys["foreign"])."\n";
	}
	
}


/************************************************

Detect end of table, write file

************************************************/

if($table_opened && preg_match("~\);~", $line)){

    //Create and open the file
	$class_fptr = fopen($class_dir.$table_name.".php", 'w');

	//check for successful open
	if($class_fptr == false){echo "Failed to open file!"; return;}

	echo "\nOpening file: ".$classes_dir.$table_name.".php\n";

/************************************************

Generate the function names for the columns

************************************************/

foreach($columns as $k=>$c){
	$name = explode("_", strToLower($c[name]));
	$new_name = "";

	foreach($name as $chunk){
		$new_name.=ucfirst($chunk);
	}

	$columns[$k][function_name]=$new_name;
}
	

/************************************************

Write the class file

************************************************/

$class_header= '<?php

/**************************************************
*
*	'.$proper_table_name.' Class
*
***************************************************/

require_once("query.php");

class '.$proper_table_name.' {

var $query=NULL;
var $table="'.$table_name.'";

public function __construct(){
	$this->query = new Query();
}

public function __destruct(){}

';

echo "Writing class header...\n";
fputs($class_fptr, $class_header);


/***************************
* Write the create function
***************************/
$createFn = "public function create$proper_table_name(";

foreach($columns as $k=>$c){
	if(!$c[primary_key]){
		$createFn.=$c[varname];
		if($k != end(array_keys($columns))){$createFn.=", ";}
	}
}

$createFn.="){\n";
$createFn.="\n\t//Validate the inputs\n";

foreach($columns as $c){
	 if(!$c[primary_key]){$createFn.="\t".$c[validateFn]."\n";}
}

$createFn.="\n\n";

$createFn.="\t\$sql = \"INSERT INTO \$this->table (";
foreach($columns as $k=>$c){
    if(!$c[primary_key]){
		$createFn.=$c[name];
		if($k != end(array_keys($columns))){$createFn.=", ";}
	}
}
$createFn.=") VALUES (";
foreach($columns as $k=>$c){
    if(!$c[primary_key]){
		if(preg_match("~varchar~", strtolower($c[type]))){$createFn.="'";}
		$createFn.=$c[varname];
		if(preg_match("~varchar~", strtolower($c[type]))){$createFn.="'";}
		if($k != end(array_keys($columns))){$createFn.=", ";}
	}
}
$createFn.=')";';

$createFn.="\n\n";

$createFn.="\treturn \$this->query->query(\$sql);";
$createFn.="\n}\n\n";

echo "Writing create function...\n";
fputs($class_fptr, $createFn);


/**************************
* Delete function
**************************/
$deleteFn = "";
$deleteFn.= "public function delete".$proper_table_name."(".$primary_key[varname]."){\n";
$deleteFn.= "\tif(!is_int(".$primary_key[varname].")){return false;}\n\n";
$deleteFn.= "\t\$sql = \"DELETE FROM \$this->table WHERE ".$primary_key[name]."=".$primary_key[varname]."\";\n\n";
$deleteFn.= "\treturn \$this->query->update(\$sql);\n";
$deleteFn.= "}\n\n";

echo "Writing delete function...\n";
fputs($class_fptr, $deleteFn);

/**************************
* Individual 'getBy' functions
**************************/
foreach($columns as $column){
	$columnFn="";
	$columnFn.= "public function get".$proper_table_name."By".$column[function_name]."($column[varname]){\n";
	$columnFn.= "\t".$column[validateFn]."\n\n";
	$columnFn.= "\t\$sql = \"SELECT * FROM \$this->table WHERE ".$column[name]."=".$column[varname]."\";\n\n";
	$columnFn.= "\treturn \$this->query->query(\$sql);\n";
	$columnFn.= "}\n\n";

	echo "Writing column function for ".$column[name]."...\n";
	fputs($class_fptr, $columnFn);
}

/**************************
*  Write the class footer
**************************/
$class_footer= "}//close class\n?>\n";

echo "Writing class footer...\n";
fputs($class_fptr, $class_footer);
flush();

echo "Closing file\n";
fclose($class_fptr);

//turn off column detection
$table_opened=false;

} //close the end of table and write file detection clause

//get the next line, for the next iteration of the loop
$line = fgets($sql_fptr);

}//close the fgets loop

/************************************************

Close the files

************************************************/
echo "\nClosing SQL file...\n";
fclose($sql_fptr);

?>
