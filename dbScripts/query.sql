USE cxc55311;
# i, Get details of all books in stock
SELECT *
FROM (SELECT ISBN
      FROM Inventory,
           Bookstore
      WHERE Inventory.BookstoreName = Bookstore.BookstoreName) AS T,
     Book,
     Book_Author,
     Author
WHERE T.ISBN = Book.ISBN
  and T.ISBN = Book_Author.ISBN
  and Book_Author.SIN = Author.SIN;

# ii, Get details of all backorders
SELECT *
FROM BookOrder AS B,
     PublisherBookstoreOrder AS P,
     CustomerBookstoreOrder AS C
WHERE (B.OrderNumber = P.OrderNumber AND P.BackOrder)
   OR (B.OrderNumber = C.OrderNumber AND C.BackOrder);

-- iii, For a given customer, get details of all his/her back order
SELECT *
FROM (SELECT B.OrderNumber, OrderQty, OrderDate, ISBN, BookstoreName, C.CustomerID, BackOrder
      FROM BookOrder AS B,
           CustomerBookstoreOrder AS CBO,
           Customer AS C
      WHERE B.OrderNumber = CBO.OrderNumber
        AND CBO.CustomerID = C.CustomerID
        AND CBO.BackOrder) AS T
WHERE T.CustomerID = '234';

# iv, For a given customer, get details of all his/her purchases made during a specific period of time
SELECT *
FROM (SELECT C.CustomerID, B.OrderNumber, B.OrderDate
      FROM BookOrder AS B,
           CustomerBookstoreOrder AS CBO,
           Customer AS C
      WHERE B.OrderNumber = CBO.OrderNumber
        AND CBO.CustomerID = C.CustomerID
        AND (NOT CBO.BackOrder)
        AND (B.OrderDate BETWEEN '2020-1-1' AND '2020-7-1')) AS T
WHERE T.CustomerID = '234';

# v, Give a report of sales during a specific period of time
SELECT *
FROM BookOrder AS B,
     CustomerBookstoreOrder AS CBO,
     Customer AS C
WHERE B.OrderNumber = CBO.OrderNumber
  AND CBO.CustomerID = C.CustomerID
  AND (NOT CBO.BackOrder)
  AND (B.OrderDate BETWEEN '2020-1-1' AND '2020-7-1');

# vi, Find the title of books that have the highest back-order
SELECT T.Title AS BookTitle, MAX(T.NumberOfBackOrders)
FROM (SELECT DISTINCT B.Title, COUNT(B.Title) AS NumberOfBackOrders
      FROM CustomerBookstoreOrder AS CBO,
           Book AS B
      WHERE B.ISBN = CBO.ISBN
        AND CBO.BackOrder) AS T
;

# vii, Give details of books that are supplied by a given publisher
SELECT *
FROM Book AS B,
     Publisher AS P
WHERE B.PublisherNumber = P.PublisherNumber
  AND P.PublisherNumber = '1'


# viii, For a given publisher, get details of the head office and all the branches for that publisher
SELECT P.HeadOfficeName, PB.BranchName
FROM Publisher AS P,
     Publisher_Branch AS PB
WHERE P.PublisherNumber = PB.PublisherNumber
  AND P.PublisherNumber = '1';

# ix, Get details of books that are in the inventory but there have never been a purchase for that specific book
SELECT B.ISBN, Title, Subject, PublisherNumber
FROM Inventory AS I,
     Book AS B
WHERE B.ISBN = I.ISBN
  AND B.ISBN NOT IN (SELECT DISTINCT CBO.ISBN
                     FROM CustomerBookstoreOrder AS CBO)

# x, Get details of all books that are in the inventory for a given author
SELECT A.SIN, A.FirstName, A.LastName, B.*, I.QtyOnHand, I.QtySold
      FROM Book AS B,
           Author AS A,
           Inventory AS I,
           Book_Author AS BA
      WHERE B.ISBN = BA.ISBN
        AND BA.SIN = A.SIN
        AND B.ISBN = I.ISBN
        AND A.SIN = '900-800-702';

