<?php
include_once 'config.php';
include_once '../header.php';

$questionNumber = $_GET['question'];

switch ($questionNumber) {

    case 1:
        $question = 'Get details of all back orders.';
        $query = 'select * from Book, Inventory where Book.ISBN = Inventory.ISBN AND QtyOnHand > 0';
        show($questionNumber, $question, $query);
        break;
    case 2:
        $question = 'Get details of all back orders.';
        $query = 'select Book.*, CustomerBookstoreOrder.BookstoreName, CustomerBookstoreOrder.OrderNumber, Customer.FirstName, Customer.LastName from Book, CustomerBookstoreOrder, Customer where Book.ISBN = CustomerBookstoreOrder.ISBN AND CustomerBookstoreOrder.CustomerID = Customer.CustomerID AND BackOrder = 1';
        show($questionNumber, $question, $query);
        break;
    default:
        echo 'Not Done yet';

}

function getResult($query)
{
    $result = [
        'columnName' => [],
        'data' => [],
    ];
    $pdo = connectDB();
    //Fetch data
    $stm = $pdo->query($query);
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

function show($questionNumber, $question, $query)
{
    $result = getResult($query);
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

    //Printing the table
    echo
        '<div class="mt-5 p-5">' .
        '<h4>Question</h4>' .
        '<p>' . $questionNumber . ') ' . $question . '</p>' . '<br>' .
        '<h4>Query</h4>' .
        '<p>' . $query . '</p>' . '<br>' .
        '<table class="table">
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

// show(1, 'first One', 'SELECT * FROM Customers');

include_once '../footer.php';
