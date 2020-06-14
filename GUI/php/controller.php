<?php
include_once 'config.php';
include_once '../header.php';

$questionNumber = $_GET['question'];

switch ($questionNumber) {

    case 1:
        $question = 'Get details of all books in stock.';
        $query =
            "SELECT b.*, i.BookstoreName, i.QtySold, i.QtyOnHand, p.PublisherName
        FROM Book AS b, Inventory AS i, Publisher as p
        WHERE b.ISBN = i.ISBN AND b.PublisherNumber = p.PublisherNumber AND QtyOnHand > 0";
        show(3.1, $question, $query, $specific);
        break;

    case 2:
        $question = 'Get details of all back orders.';
        $specific = "Back Orders include both customers and publishers' back order(s)";
        $query =
            "SELECT  B.*, C.ISBN, C.BookstoreName, C.CustomerID, P.PublisherNumber, P.BranchName, CA.FirstName, CA.LastName
                FROM BookOrder AS B, PublisherBookstoreOrder AS P, CustomerBookstoreOrder AS C, Customer as CA
                WHERE (B.OrderNumber = P.OrderNumber AND P.BackOrder)
                OR (B.OrderNumber = C.OrderNumber AND C.BackOrder AND CA.CustomerID = c.CustomerID);";
        show(3.2, $question, $query, $specific);
        break;

    case 3:
        $question = 'For a given customer, get details of all his/her back orders.';
        $specific = "Result for customer(First Name: Alice & Last Name: Mo)";
        $query =
            "SELECT bo.*, cb.ISBN, b.Title AS `Book Title`, b.Subject AS `Book Subject`, cb.BookstoreName, c.CustomerID, c.FirstName AS `Cus. First Name`, c.LastName AS `Cus. Last Name`
        FROM BookOrder AS bo, CustomerBookstoreOrder AS cb, Customer AS c, Book AS b
        WHERE cb.OrderNumber = bo.OrderNumber AND cb.ISBN = b.ISBN AND cb.CustomerID = c.CustomerID
        AND c.FirstName = 'Alice' AND c.LastName = 'Mo' AND cb.BackOrder";
        show(3.3, $question, $query, $specific);
        break;

    case 4:
        $question = 'For a given customer, get details of all his/her purchases made during a specific period of time.';
        $specific = "Result for customer (First Name: Alice & Last Name: Mo) & Date between: 2020-01-01 to 2020-07-01";
        $query =
            "SELECT bo.*, cb.ISBN, cb.BookstoreName, b.Title AS `Book Title`, b.Subject AS `Book Subject`,
            c.CustomerID, c.FirstName AS `Cus. First Name`, c.LastName AS `Cus. Last Name`,
            CASE
            WHEN cb.BackOrder THEN 'Back Ordered' ELSE 'Not Back Ordered'
            END AS `Back Order`
            FROM Book AS b, CustomerBookstoreOrder AS cb, Customer AS c, BookOrder
            AS bo WHERE cb.OrderNumber = bo.OrderNumber AND cb.CustomerID = c.CustomerID
            AND cb.ISBN = b.ISBN AND bo.OrderDate BETWEEN '2020-01-01' AND '2020-07-01'
            AND c.FirstName = 'Alice' AND c.LastName = 'Mo'";
        show(3.4, $question, $query, $specific);
        break;

    case 5:
        $question = 'Give a report of sales during a specific period of time.';
        $specific = "Result between date: 2020-01-01 to 2020-07-01";
        $query =
            "SELECT *
            FROM BookOrder AS B,
            CustomerBookstoreOrder AS CBO,
            Customer AS C
            WHERE B.OrderNumber = CBO.OrderNumber
            AND CBO.CustomerID = C.CustomerID
            AND (NOT CBO.BackOrder)
            AND (B.OrderDate BETWEEN '2020-01-01' AND '2020-07-01');";
        show(3.5, $question, $query, $specific);
        break;

    case 6:
        $question = 'Find the title of book(s) that have the highest back-order.';
        $specific = "Count of Back Order includes both customers and publishers' back order(s)";
        $query =
            "SELECT T.Title AS BookTitle, MAX(T.NumberOfBackOrders) AS `Total BackOrder`
            FROM (SELECT B.Title, COUNT( B.Title) AS NumberOfBackOrders
            FROM CustomerBookstoreOrder AS CBO, PublisherBookstoreOrder AS PBO,
            Book AS B
            WHERE (B.ISBN = CBO.ISBN  AND CBO.BackOrder)
            OR (B.ISBN = PBO.ISBN AND PBO.BackOrder)
            AND (CBO.ISBN = PBO.ISBN)) AS T;";
        show(3.6, $question, $query, $specific);
        break;

    case 7:
        $question = 'Give details of books that are supplied by a given publisher.';
        $specific = "Result for publisher name O'REILLY";
        $query =
            "SELECT * FROM Book AS B, Publisher AS P
            WHERE B.PublisherNumber = P.PublisherNumber
            AND P.PublisherName = 'O\'REILLY'";
        show(3.7, $question, $query, $specific);
        break;

    case 8:
        $question = 'For a given publisher, get details of the head office and all the branches for that publisher.';
        $specific = "Result for publisher name O'REILLY";
        $query =
            "SELECT * FROM Publisher, Publisher_Branch
            WHERE Publisher.PublisherNumber = Publisher_Branch.PublisherNumber
            AND Publisher.PublisherName = 'O\'REILLY'";
        show(3.8, $question, $query, $specific);
        break;

    case 9:
        $question = 'Get details of books that are in the inventory but there have never been a purchase for that specific book.';
        $query =
            "SELECT B.ISBN, Title, Subject, PublisherNumber
            FROM Inventory AS I,
            Book AS B
            WHERE B.ISBN = I.ISBN
            AND B.ISBN NOT IN (SELECT DISTINCT CBO.ISBN
            FROM CustomerBookstoreOrder AS CBO)";
        show(3.9, $question, $query);
        break;

    case 10:
        $question = 'Get details of all books that are in the inventory for a given author.';
        $specific = "Result for author (FirstName: Henry & LastName: Korth)";
        $query =
            "SELECT A.SIN, A.FirstName, A.LastName, B.*, I.QtyOnHand, I.QtySold
            FROM Book AS B, Author AS A, Inventory AS I, Book_Author AS BA
            WHERE B.ISBN = BA.ISBN
            AND BA.SIN = A.SIN
            AND B.ISBN = I.ISBN
            AND A.FirstName = 'Henry' AND A.LastName = 'Korth';";
        show(3.10, $question, $query, $specific);
        break;
    case 11:
        echo '<h3 class="text-center mt-2">Count of all relational tables</h3>';

        $question = "For each relation R created in your database, report the result of the following SQL statement: SELECT COUNT(*) FROM R";
        $specific = "Relation between Book and Author";
        $query = "SELECT COUNT(*) AS Book_Author FROM Book_Author;";
        show(5, $question, $query, $specific);

        $specific = "Relation between Reader and Interest";
        $query = "SELECT COUNT(*) AS Reader_Interest FROM Reader_Interest;";
        show("", "", $query, $specific);

        $specific = "Inventory ( ISBN, BookstoreName, QtySold, QtyOnHand)";
        $query = "SELECT COUNT(*) AS Inventory FROM Inventory;";
        show("", "", $query, $specific);

        $specific = "BookOrder ( OrderNumber, OrderQty, OrderDate)";
        $query = "SELECT COUNT(*) AS BookOrder FROM BookOrder;";
        show("", "", $query, $specific);

        $specific = "CustomerBookstoreOrder ( OrderNumber, ISBN, BookstoreName, CustomerID, Backorder)";
        $query = "SELECT COUNT(*) AS CustomerBookstoreOrder FROM CustomerBookstoreOrder;";
        show("", "", $query, $specific);

        $specific = "PublisherBookstoreOrder ( OrderNumber, ISBN, BookstoreName, PublisherNum, BranchName, Backorder)";
        $query = "SELECT COUNT(*) AS PublisherBookstoreOrder FROM PublisherBookstoreOrder;";
        show("", "", $query, $specific);
        break;

    case 12:
        echo '<h3 class="text-center mt-2">Data present in all Entities</h3>';
        $specific = "All data in entity publisher";
        $query = "SELECT * FROM Publisher;";
        show("", "", $query, $specific);

        $specific = "All data in entity Publisher_Branch";
        $query = "SELECT * FROM Publisher_Branch;";
        show("", "", $query, $specific);

        $specific = "All data in entity Bookstore";
        $query = "SELECT * FROM Bookstore;";
        show("", "", $query, $specific);

        $specific = "All data in entity Customer";
        $query = "SELECT * FROM Customer;";
        show("", "", $query, $specific);

        $specific = "All data in entity Book";
        $query = "SELECT * FROM Book;";
        show("", "", $query, $specific);

        $specific = "All data in entity Author";
        $query = "SELECT * FROM Author;";
        show("", "", $query, $specific);

        echo '<h3 class="text-center mt-2">Data present in all Relational Tables</h3>';

        $specific = "All data in Book_Author";
        $query = "SELECT * FROM Book_Author;";
        show("", "", $query, $specific);

        $specific = "All data in Reader_Interest";
        $query = "SELECT * FROM Reader_Interest;";
        show("", "", $query, $specific);

        $specific = "All data in Inventory";
        $query = "SELECT * FROM Inventory;";
        show("", "", $query, $specific);

        $specific = "All data in BookOrder";
        $query = "SELECT * FROM BookOrder;";
        show("", "", $query, $specific);

        $specific = "All data in CustomerBookstoreOrder";
        $query = "SELECT * FROM CustomerBookstoreOrder;";
        show("", "", $query, $specific);

        $specific = "All data in PublisherBookstoreOrder";
        $query = "SELECT * FROM PublisherBookstoreOrder;";
        show("", "", $query, $specific);
        break;
    case 13:
        echo '<img src="erd.png" class="img-fluid" alt="E/R Diagram">';
        break;
    default:
        echo '<h1 class="text-center mt-2">Not A valid request</h1>';

}

function fetchData($query)
{
    $pdo = connectDB();
    //Fetch data
    $stm = $pdo->query($query);
    return $stm;
}

function parseResult($query)
{
    $result = [
        'columnName' => [],
        'data' => [],
    ];
    $stm = fetchData($query);
    //Get column names
    $i = 0;
    while ($column = $stm->getColumnMeta($i++)) {
        $result['columnName'][$i] = $column['name'];
    }
    $i = 0;
    while ($row = $stm->fetch()) {
        $result['data'][$i++] = $row;
    }

    return $result;
}

function show($questionNumber = 0, $question = "", $query, $specific = "")
{
    $result = parseResult($query);
    $tableColumn = '';
    $tableData = '';

    //Getting the table column header ready
    foreach ($result['columnName'] as $column) {
        $tableColumn .= '<th scope="col">' .
            $column .
            '</th>';
    }

    //Getting the table body ready
    foreach ($result['data'] as $row) {
        $tableData .= '<tr>';
        foreach ($result['columnName'] as $column) {
            $tableData .= '<td>' .
            $row->$column .
                '</td>';
        }
        $tableData .= '</tr>';
    }
    $display = $question == "" ? 'd-none' : '';
    //Printing the table
    echo
        '<div class="mt-1 px-3">' .
        '<h4 class=" ' . $display . ' ">Question</h4>' .
        '<p class="' . $display . '">' . $questionNumber . ') ' . $question . '</p>' . '<br>' .
        '<h4>Query</h4>' .
        '<pre> <code>' . $query . ' </code> </pre>' . '<br>' .
        '<span>' . $specific . '</span>' . '<br>' .
        '<table class="table mt-3">
            <thead>
                <tr>' .
        $tableColumn
        . '</tr>
            </thead>' .
        '<tbody>' .
        $tableData
        . '</tbody>' .
        '</table>' .
        '</div>'
    ;

}

include_once '../footer.php';
