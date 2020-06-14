<?php
/*
//Essentials to connect to the db
define("HOST", "cxc5531.encs.concordia.ca:3306");
define("USER_NAME", "cxc55311");
define("PASSWORD", "pa1234ss");
define("DB_NAME", "cxc55311");

//Setting up data source name (DSN)
//This string specifies the db we would like to use
$dsn = 'mysql:host=' . HOST . ';dbname=' . DB_NAME;

//Instantiate PHP Data Object (PDO)
$pdo = new PDO($dsn, USER_NAME, PASSWORD);

//Setting up the way we want to fetch the data from db
//In this case the fetched data will be in obj form
$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

$stm = $pdo->query('SELECT * FROM Author');
 */

//********************************

function connectDB()
{
    define("HOST", "localhost");
    define("USER_NAME", "root");
    define("PASSWORD", "root");
    define("DB_NAME", "cxc55311");

    //Setting up data source name (DSN)
    //This string specifies the db we would like to use
    $dsn = 'mysql:host=' . HOST . ';dbname=' . DB_NAME;

    //Instantiate PHP Data Object (PDO)
    $pdo = new PDO($dsn, USER_NAME, PASSWORD);

    //Setting up the way we want to fetch the data from db
    //In this case the fetched data will be in obj form
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

    return $pdo;

}
