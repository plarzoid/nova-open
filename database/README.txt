DATABASE PREREQUISITES
You will need full control of a mySQL database instance of your preferred name. The recommended database name is "nova_open".

DATABASE SETUP
To create a new instance of the nova_open database, there are two options:

A. Start from a fresh mysql database and run the full install
	1. Run \baseline\001_nova_baseline.sql, to create the database tables
	2. Run \baseline\002_insert_baseline_data.sql, to insert the initial set of lookup database
	3. Run each of the delta scripts in the \delta\ folder in numerical order
	4. Run the script \mock_data\insert_mock_data.sql, to insert test database
	5. Run reach of the scripts under the \view\ folder
	
B. Stand up a full snapshot of the test database using the unified sql script
	1. Open \complete\create_complete_nova_open_database.sql and set the USE [Database] to your desired target database
	2. Run \complete\create_complete_nova_open_database.sql
	
UPDATE AN EXISTING INSTANCE
To update an existing instance with the latest database changes:

	1. Run the command "select * from changelog" against your database instance and note the last delta script.
	2. Look at the delta script folder and run any scripts you are missing
	3. Run each of the scripts under the \view\ folder
	4. (Optional) If there are major changes to the database structure, you may need to re-run the \mock_data\insert_mock_data.sql script
