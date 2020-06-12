USE cxc55311;
CREATE TABLE Publisher
(
    PublisherNumber VARCHAR(20),
    PublisherName   VARCHAR(100),
    Website         VARCHAR(100),
    HeadOfficeName  VARCHAR(100),
    Email           VARCHAR(100),
    PhoneNumber     VARCHAR(100),
    Address         VARCHAR(100),
    City            VARCHAR(100),
    PostalCode      VARCHAR(100),
    Province        VARCHAR(100),
    PRIMARY KEY (PublisherNumber)
);

CREATE TABLE Publisher_Branch
(
    PublisherNumber VARCHAR(20),
    BranchName      VARCHAR(100),
    Representative  VARCHAR(100) NOT NULL,
    PRIMARY KEY (PublisherNumber, BranchName),
    FOREIGN KEY (PublisherNumber) REFERENCES Publisher (PublisherNumber)
        ON DELETE CASCADE
);

CREATE TABLE Bookstore
(
    BookstoreName VARCHAR(100),
    Email         VARCHAR(100),
    PhoneNumber   VARCHAR(100),
    Address       VARCHAR(100),
    City          VARCHAR(100),
    PostalCode    VARCHAR(100),
    Province      VARCHAR(100),
    PRIMARY KEY (BookstoreName)
);

CREATE TABLE Customer
(
    CustomerID               VARCHAR(20),
    FirstName                VARCHAR(100) NOT NULL,
    LastName                 VARCHAR(100) NOT NULL,
    CompanyName              VARCHAR(100),
    PhoneNumber              VARCHAR(100),
    Address                  VARCHAR(100),
    City                     VARCHAR(100),
    PostalCode               VARCHAR(100),
    Province                 VARCHAR(100),
    CumulativePurchaseNumber INT,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Book
(
    ISBN                VARCHAR(20),
    Title               VARCHAR(100) NOT NULL,
    Subject             VARCHAR(100),
    CostPrice           DOUBLE,
    SellingPrice        DOUBLE,
    PublisherNumber     VARCHAR(20),
    PublisherYtdQtySold INT,
    PublisherQtyOnHand  INT,
    PRIMARY KEY (ISBN),
    FOREIGN KEY (PublisherNumber) REFERENCES Publisher (PublisherNumber)
        ON DELETE SET NULL
);

CREATE TABLE Author
(
    SIN       VARCHAR(20),
    FirstName VARCHAR(100),
    LastName  VARCHAR(100),
    PRIMARY KEY (SIN)
);

CREATE TABLE Book_Author
(
    ISBN VARCHAR(20),
    SIN  VARCHAR(20),
    PRIMARY KEY (ISBN, SIN),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (SIN) REFERENCES Author (SIN)
);

CREATE TABLE Reader_Interest
(
    CustomerID        VARCHAR(20),
    BookGenreInterest VARCHAR(100),
    PRIMARY KEY (CustomerID, BookGenreInterest),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
        ON DELETE CASCADE
);

CREATE TABLE Inventory
(
    ISBN          VARCHAR(20),
    BookstoreName VARCHAR(100),
    QtySold       INT,
    QtyOnHand     INT,
    PRIMARY KEY (ISBN, BookstoreName),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (BookstoreName) REFERENCES Bookstore (BookstoreName)
        ON DELETE CASCADE
);

CREATE TABLE BookOrder
(
    OrderNumber VARCHAR(20),
    OrderQty    INT,
    OrderDate   DATE,
    PRIMARY KEY (OrderNumber)
);

CREATE TABLE CustomerBookstoreOrder
(
    OrderNumber   VARCHAR(20),
    ISBN          VARCHAR(20),
    BookstoreName VARCHAR(100),
    CustomerID    VARCHAR(20),
    BackOrder     BOOL,
    PRIMARY KEY (OrderNumber, ISBN, BookstoreName),
    FOREIGN KEY (OrderNumber) REFERENCES BookOrder (OrderNumber) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Inventory (ISBN),
    FOREIGN KEY (BookstoreName) REFERENCES Inventory (BookStoreName),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE PublisherBookstoreOrder
(
    OrderNumber     VARCHAR(20),
    ISBN            VARCHAR(20),
    BookstoreName   VARCHAR(100),
    PublisherNumber VARCHAR(20),
    BranchName      VARCHAR(100),
    BackOrder       BOOL,
    PRIMARY KEY (OrderNumber, ISBN, BookstoreName),
    FOREIGN KEY (OrderNumber) REFERENCES BookOrder (OrderNumber) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Inventory (ISBN),
    FOREIGN KEY (BookstoreName) REFERENCES Inventory (BookStoreName),
    FOREIGN KEY (PublisherNumber, BranchName) REFERENCES Publisher_Branch (PublisherNumber, BranchName)
);



