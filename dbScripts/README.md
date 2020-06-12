# BookStore DB design
## Entity
**Publisher** ( _PublisherNumber_, PublisherName, Website, HeadOfficeName, Email, PhoneNumber, Address, City, PostalCode, Province)   

**Publisher_Branch** (_PublisherNumber_, _BranchName_, Representative)    
	Foreign key (PublisherNumber) reference Publisher (PublisherNumber)      
Weak entity of Publisher

**Bookstore** (_BookstoreName_ , Email, PhoneNumber, Address, City, PostalCode, Province)

**Customer** ( _CustomerID_, FirstName, LastName, CompanyName, PhoneNumber, Address, City, PostalCode, Province, CumulativePurchaseNumber)   

**Book** ( _ISBN_, Title, Subject, CostPrice, SellingPrice, PublisherNumber, PublisherYtdQtySold, PublisherQtyOnHand)    
	Foreign key (PublisherNumber) reference Publisher (PublisherNumber)
 Referential integrity (one and mandatory).      
A book must have one and only one publisher.

**Author** ( _SIN_, FirstName, LastName)   


- - - -
## Relationship
**Book_Author** ( _ISBN_, _SIN_)     
	Foreign key (ISBN) references Book (ISBN)   
	Foreign key (SIN) references Author (SIN)       
 Many to many. A book can have multiple authors, an author can write many books.

**Reader_Interest** ( _CustomerID_, _BookGenreInterest_)     
	Foreign key (CustomerID) references Customer (CustomerID)        
 Many to many.  A customer may be interested in many interests,  a interest may related to many customers.

**Inventory** ( _ISBN_, _BookstoreName_, QtySold, QtyOnHand)    
	Foreign key (ISBN) references Book (ISBN)   
	Foreign key (BookstoreName) references Bookstore (BookstoreName)        
 Many to many. A inventory record shows how many books are stored in one bookstore for a particular book. A book can be stored in many bookstores , a bookstore can have many inventory for many books.

**BookOrder** ( _OrderNumber_, OrderQty, OrderDate)    
 There are two kinds of orders: order between customer and bookstore; order between bookstore and publisher. They both have properties OrderQty and OrderDate. However, the backorder are different. 

**CustomerBookstoreOrder** ( _OrderNumber_, _ISBN_, _BookstoreName_,  CustomerID, Backorder)    
	Foreign key (OrderNumber) references BookOrder (OrderNumber)   
	Foreign key (ISBN) references Inventory (ISBN)   
	Foreign key (BookstoreName) references Inventory (BookstoreName)   
	Foreign key (CustomerID) references Customer (CustomerID)        
 Backorder is derived from BookOrder.OrderQty and Inventory(ISBN, BookstoreName).QtyOnhand, if Bookstore.QtyOnHand < BookOrder.OrderQty, then BackOrder is True.    
 CustomerBookstoreOrder to Inventory is many to many. Primary key is the union or the primary key of Inventory and BookOrder.    
 Each CustomerBookstoreOrder can have only one CustomerID; one CustomerID may have multiple CustomerBookstoreOrders.

**PublisherBookstoreOrder** ( _OrderNumber_, _ISBN_, _BookstoreName_,  PublisherNum, BranchName, Backorder)
	Foreign key (OrderNumber) references BookOrder (OrderNumber)   
	Foreign key (ISBN) references Inventory (ISBN)   
	Foreign key (BookstoreName) references Inventory (BookstoreName)   
	Foreign key (PublisherNum) references Publisher_Branch (PublisherNum)   
	Foreign key (BranchName) references Publisher_Branch (BranchName)   
 Backorder is derived from BookOrder.OrderQty and Book(ISBN).PublisherQtyOnHand.   
 PublisherBookstoreOrder to Inventory is many to many   
 Each PublisherBookstoreOrder can have only one PublisherBranch, one PubliherBranch may have  multiple PublisherBookstoreOrder.   


