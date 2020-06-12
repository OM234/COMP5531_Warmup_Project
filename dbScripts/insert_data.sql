USE cxc55311;
INSERT INTO Publisher (PublisherNumber, PublisherName, Website, HeadOfficeName, Email,
                       PhoneNumber, Address, City, PostalCode, Province)
VALUES ('1', 'O\'REILLY', 'www.oreilly.com', 'Head office', 'master@oreilly.com',
        '123-456-7890', 'Street 100', 'Montreal', '654321', 'Quebec');

INSERT INTO Publisher_Branch(PublisherNumber, BranchName, Representative)
VALUES ('1', 'Saint-Catherine', 'Michael Jack');

INSERT INTO Bookstore (BookstoreName, Email, PhoneNumber, Address, City, PostalCode, Province)
VALUES ('Indigo', 'contact@indigo.com', '438-123-4567', 'Street Main', 'New York', '123456', 'New York');

INSERT INTO Customer (CustomerID, FirstName, LastName, CompanyName, PhoneNumber, Address,
                      City, PostalCode, Province, CumulativePurchaseNumber)
VALUES ('234', 'Alice', 'Mo', 'Zoom', '541-945-2446', '7 Street AAA', 'Montreal', '654321', 'Quebec', '100');

INSERT INTO Book (ISBN, Title, Subject, CostPrice, SellingPrice, PublisherNumber, PublisherYtdQtySold,
                  PublisherQtyOnHand)
VALUES ('987-6-54-60197', 'Database System', 'Textbook', '150', '200', '1', '1000', '2000');
INSERT INTO Book (ISBN, Title, Subject, CostPrice, SellingPrice, PublisherNumber, PublisherYtdQtySold,
                  PublisherQtyOnHand)
VALUES ('498-3-34-14690', 'How to make hamburger', 'Cookbook', '20', '50', '1', '500', '800');

INSERT INTO Author (SIN, FirstName, LastName)
VALUES ('900-800-700', 'Abraham', 'Silberschatz');
INSERT INTO Author (SIN, FirstName, LastName)
VALUES ('900-800-701', 'Henry', 'Korth');
INSERT INTO Author (SIN, FirstName, LastName)
VALUES ('900-800-702', 'Albert', 'Einstein');

INSERT INTO Book_Author (ISBN, SIN)
VALUES ('987-6-54-60197', '900-800-700');
INSERT INTO Book_Author (ISBN, SIN)
VALUES ('987-6-54-60197', '900-800-701');
INSERT INTO Book_Author (ISBN, SIN)
VALUES ('498-3-34-14690', '900-800-702');

INSERT INTO Reader_Interest (CustomerID, BookGenreInterest)
VALUES ('234', 'Novel');

INSERT INTO Inventory (ISBN, BookstoreName, QtySold, QtyOnHand)
VALUES ('987-6-54-60197', 'Indigo', '0', '5');
INSERT INTO Inventory (ISBN, BookstoreName, QtySold, QtyOnHand)
VALUES ('498-3-34-14690', 'Indigo', '100', '150');

INSERT INTO BookOrder (OrderNumber, OrderQty, OrderDate)
VALUES ('7349', '10', '2020-5-20');
INSERT INTO BookOrder (OrderNumber, OrderQty, OrderDate)
VALUES ('7350', '20', '2020-5-20');
INSERT INTO BookOrder (OrderNumber, OrderQty, OrderDate)
VALUES ('8945', '50', '2020-6-3');

INSERT INTO CustomerBookstoreOrder (OrderNumber, ISBN, BookstoreName, CustomerID, BackOrder)
VALUES ('7349', '498-3-34-14690', 'Indigo', '234', false);
INSERT INTO CustomerBookstoreOrder (OrderNumber, ISBN, BookstoreName, CustomerID, BackOrder)
VALUES ('7350', '987-6-54-60197', 'Indigo', '234', true);

INSERT INTO PublisherBookstoreOrder (OrderNumber, ISBN, BookstoreName, PublisherNumber, BranchName, BackOrder)
VALUES ('8945', '498-3-34-14690', 'Indigo', '1', 'Saint-Catherine', false);

