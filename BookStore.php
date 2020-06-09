<head>
</head>
<body>

<h1>Bookstore Database</h1>
<h2>Created By Tanveer, Craig, Osman and Fan</h2>
<h3> i. Get details of all books in stock. </h3>
<h3> ii. Get details of all back orders. </h3>
<h3> iii. For a given customer, get details of all his/her back orders.</h3>
<h3> iv. For a given customer, get details of all his/her purchases made during a
    specific period of time. </h3>
<h3> v. Give a report of sales during a specific period of time. </h3>
<h3> vi. Find the title of book(s) that have the highest back-order. </h3>
<h3> vii. Give details of books that are supplied by a given publisher. </h3>
<h3> viii. For a given publisher, get details of the head office and all the branches
    for that publisher </h3>
<h3> ix. Get details of books that are in the inventory but there have never been a
    purchase for that specific book. </h3>
<h3> x. Get details of all books that are in the inventory for a given author.  </h3>

</body>

<?php
$servername = "cxc5531.encs.concordia.ca:3306";
$username = "cxc55311";
$password = "pa1234ss";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";


// Use schema
//$sql = "Use cxc55311";
//if($conn -> query($sql) === false) {
//    echo "use query failed";
//}
//
//$sql = "create table if not exists Temp (age int, gender char)";
//if($conn -> query($sql) === false) {
//    echo "create table failed";
//}
?>
</html>
