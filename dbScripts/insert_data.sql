USE cxc55311;
INSERT INTO Publisher (PublisherNumber, PublisherName, Website, HeadOfficeName, Email,
                       PhoneNumber, Address, City, PostalCode, Province)
VALUES ('1', 'O\'REILLY', 'www.oreilly.com', 'Head office', 'master@oreilly.com',
        '123-456-7890', '100 Street', 'Montreal', 'H5J 3Y1', 'Quebec'),
       ('2', 'Anvil Press', 'www.anvilpress.com', 'Anvil Head Office', 'master@anvil.com', '547-252-5047',
         '3008 Broad Road', 'Vancouver', 'V6B 3X5', 'British Columbia'),
       ('3', 'ARP Books', 'www.arpbooks.org', 'ARP Head Office', 'contact@arpbooks.com', '204-942-7058', '205-70 Arthur Street',
        'Winnipeg', 'R3B 1G7', 'Manitoba'),
       ('4', 'Bibliotheque Quebecoise', 'www.livres-bq.com', 'Livre Quartier General', 'dnm@librairieduquebec.fr',
        '514-523-1523', '1815 avenue De Lorimier', 'Montreal', 'H2K 3W6', 'Quebec'),
       ('5', 'Black Moss Press', 'www.blackmosspress.com', 'Moss Head Office', 'alblackmosspress@gmail.com',
        '519-222-7476', '2450 Byng Road', 'Windsor', ' N8W 3E8', 'Ontario'),
       ('6', 'Black Rose Books', 'www.blackrosebooks.net', 'Black Rose Head Office', 'contact@blackrose.com',
        '514-570-2665', '35788 Rue Leo Pariseau', 'Montreal', 'H2X 0A4', 'Quebec'),
       ('7', 'Brick Books', 'www.brickbooks.ca', 'Brick Head Office', 'brenda@brickbooks.ca', '613-328-4947',
        '487 King St. W', 'Kingston', 'K7L 2X7', 'Ontario'),
       ('8', 'Canadian Poetry Press', 'www.canadianpoetry.org', 'Poetry Head Office', 'contact@cadpoetry.org',
        '519-661-2111', '1151 Richmond St', 'London', 'N6A 3K7', 'Ontario'),
       ('9', 'Cormorant Books', 'www.cormorantbooks.com', 'Cormorant Head Office', 'publicity@cormorantbooks.com',
       '416-925-8887', '260 Spadina Avenue Suite 502', 'Toronto', 'M5T 2E4', 'Ontario'),
       ('10', 'Coach House Books', 'www.chbooks.com', 'Coach Head Office', 'mail@chbooks.com', '416-979-2217',
        '80 bpNichol Lane', 'Toronto', 'M5S 3J4', 'Ontario');

INSERT INTO Publisher_Branch(PublisherNumber, BranchName, Representative)
VALUES ('1', 'Saint-Catherine', 'Michael Jack'),
       ('2', 'Anvil South', 'John Doe'),
       ('3', 'ARP East', 'Frank Serpico'),
       ('4', 'Le Double Trouble', 'Guy Leblanc'),
       ('5', 'Moss Apple Road', 'Jen Fresno'),
       ('6', 'Prince-Arthur', 'Isabelle Marceau'),
       ('7', 'Brick North', 'Trevor Walter'),
       ('8', 'Queens', 'Mary Destiny'),
       ('9', 'Rosedale', 'Patrick Winters'),
       ('10', 'Chestnut', 'Clementine April');


INSERT INTO Bookstore (BookstoreName, Email, PhoneNumber, Address, City, PostalCode, Province)
VALUES ('Indigo', 'contact@indigo.com', '438-123-4567', 'Street Main', 'Toronto', 'M4V M4T', 'Ontario'),
       ('Fair\'s Fair Books', 'contact@fairbooks.com', '403-255-4011', '104 61 Ave SE', 'Calgary', 'T2G 0S2', 'Alberta'),
       ('Monkeyshines', 'contact@moneykshines.com', '403-240-1723', '2215 33rd Ave SW', 'Calgary', ' T2T 1Z9', 'Alberta'),
       ('Albion Books', 'contact@albionbooks.com', '604-662-3113', '523 Richards St.', 'Vancouver', 'V6B 2Z6',
        'British Columbia'),
       ('Book Warehouse', 'query@bookwarehouse.com', '604-872-5711', '632 West Broadway ', 'Vancouver', 'V5Z 1G1',
        'British Columbia'),
       ('Mill Street Books', 'contact@millbooks.com', '613-256-9090', '52 Mill St. ', 'Almonte', 'K0A 1A0', 'Ontario'),
       ('Epic Books', 'inquiry@epicbooks.com', '905-525-6538', '226 Locke St. S. ', 'Hamilton', 'L8R 3B2', 'Ontario'),
       ('Attic Books', 'info@atticbooks.ca ', '519-432-7277', '240 Dundas St.', 'London', 'N6A 1H3', 'Ontario'),
       ('Appetite for Books', 'info@appetitebooks.ca', '514-369-2002', '388 Victoria Ave', 'Westmount', 'H3Z 2N4', 'Quebec'),
       ('Argo Bookshop', 'info@argobookshop.ca', '514-931-3442', '1915 rue Sainte-Catherine ouest', 'Montreal', 'H3H 1M3',
        'Quebec');

INSERT INTO Customer (CustomerID, FirstName, LastName, CompanyName, PhoneNumber, Address,
                      City, PostalCode, Province, CumulativePurchaseNumber)
VALUES ('234', 'Alice', 'Mo', 'Zoom', '514-945-2446', '7 Street AAA', 'Montreal', 'H5M 3C2', 'Quebec', '100'),
       ('101', 'Joe', 'Palloc', 'Titus', '204-214-3546', '223 West Side Ave', 'Winnipeg', 'R2C 0A5', 'Manitoba', '200'),
       ('765', 'Jane', 'Ruther', 'Pear', '416-453-4576', '101 Truffle Road', 'Toronto', 'M5X M5V', 'Ontario', '50'),
       ('444', 'Brad', 'Sherwood', 'Cactus', '416-300-2458', '22 Paleo Avenue', 'Toronto', 'M6R M6S', 'Ontario', '80'),
       ('221', 'Polly', 'Tenu', 'Orange', '416-213-7484', '9876 Hickson St.', 'Toronto', 'M7G M1F', 'Ontario', '60'),
       ('565', 'Alfred', 'Worth', 'Wayne', '604-298-6565', '969 Witherspoon Road', 'Vancouver', 'V5K 1A9',
        'British Columbia', '25'),
       ('999', 'Penny', 'Lane', 'Butterfly', '604-564-2234', '1091 Abbington Street', 'Vancouver', 'V9K 1E9',
        'British Columbia', '30'),
       ('888', 'George', 'Brigkin', 'Peach', '604-232-7874', '234 Brown Street', 'Vancouver', 'V7K 2C4',
        'British Columbia', '40'),
       ('689', 'Felix', 'Tremblay', 'Rond', '514-345-4545', '3456 Mont-Royal Ave', 'Montreal', 'H3N 1T2', 'Quebec', '70'),
       ('345', 'Monique', 'Rideau', 'Pomme', '438-567-2343', '452 Saint-Patrick St', 'Montreal', 'H6K H9J', 'Quebec',
        '80');


INSERT INTO Book (ISBN, Title, Subject, CostPrice, SellingPrice, PublisherNumber, PublisherYtdQtySold,
                  PublisherQtyOnHand)
VALUES ('987-6-54-60197', 'Database System', 'Textbook', '150', '200', '1', '1000', '2000'),
       ('498-3-34-14690', 'How to make hamburger', 'Cookbook', '20', '50', '1', '500', '800'),
       ('563-4-56-35673', 'Chicken Soup Book', 'Cookbook', '15', '25', '2', '1500', '200'),
       ('765-2-34-67894', 'Darkness Within', 'Fantasy', '30', '60', '3', '800', '400'),
       ('876-8-56-98765', 'Autobiography of Tim', 'Biography', '20', '80', '4', '400', '0'),
       ('234-4-23-45674', 'WW2: Tanks', 'History', '50', '100', '5', '700', '100'),
       ('908-1-44-56765', 'Space Veteran', 'Sci-Fi', '45', '65', '6', '450', '300'),
       ('765-3-80-56745', 'Shoe String Adventures', 'Novel', '20', '30', '7', '300', '250'),
       ('456-3-45-67544', 'Quiet Trust', 'Romance', '10', '15', '8', '500', '100'),
       ('876-8-56-45675', 'Counting Shapes', 'Childhood', '5', '10', '9', '450', '50');

INSERT INTO Author (SIN, FirstName, LastName)
VALUES ('900-800-700', 'Abraham', 'Silberschatz'),
       ('900-800-701', 'Henry', 'Korth'),
       ('900-800-702', 'Albert', 'Einstein'),
       ('310-347-729', 'Aaren', 'Ainslie'),
       ('110-202-223', 'Netti', ' Fan'),
       ('970-177-142', 'Alyda', ' Rowena'),
       ('001-001-200', 'Pippa', ' Ariella'),
       ('000-091-002', 'Merlina', ' Casi'),
       ('023-304-109', 'Jena', ' Debra'),
       ('190-001-000', 'Krysta', ' Jillie');

INSERT INTO Book_Author (ISBN, SIN)
VALUES ('987-6-54-60197', '900-800-700'),
       ('987-6-54-60197', '900-800-701'),
       ('498-3-34-14690', '900-800-702'),
       ('563-4-56-35673', '310-347-729'),
       ('765-2-34-67894', '110-202-223'),
       ('876-8-56-98765', '970-177-142'),
       ('234-4-23-45674', '001-001-200'),
       ('908-1-44-56765', '000-091-002'),
       ('765-3-80-56745', '023-304-109'),
       ('456-3-45-67544', '190-001-000');

INSERT INTO Reader_Interest (CustomerID, BookGenreInterest)
VALUES ('234', 'Novel'),
       ('101', 'Fantasy'),
       ('765', 'History'),
       ('444', 'Sci-Fi'),
       ('221', 'Cookbook'),
       ('565', 'Biography'),
       ('999', 'Romance'),
       ('888', 'Novel'),
       ('689', 'Textbook'),
       ('345', 'History');

INSERT INTO Inventory (ISBN, BookstoreName, QtySold, QtyOnHand)
VALUES ('987-6-54-60197', 'Indigo', '0', '5'),
       ('498-3-34-14690', 'Fair\'s Fair Books', '100', '150'),
       ('563-4-56-35673', 'Albion Books', '20', '10'),
       ('765-2-34-67894', 'Book Warehouse', '40', '8'),
       ('876-8-56-98765', 'Mill Street Books', '10', '10'),
       ('234-4-23-45674', 'Epic Books', '22', '13'),
       ('908-1-44-56765', 'Attic Books', '1', '14'),
       ('765-3-80-56745', 'Appetite for Books', '34', '18'),
       ('456-3-45-67544', 'Argo Bookshop', '98', '2'),
       ('876-8-56-45675', 'Monkeyshines', '20', '5');

INSERT INTO BookOrder (OrderNumber, OrderQty, OrderDate)
VALUES ('7349', '10', '2020-5-20'),
       ('7350', '20', '2020-5-20'),
       ('8945', '15', '2020-6-3'),
       ('1234', '4', '2020-4-19'),
       ('4564', '10', '2020-4-2'),
       ('3847', '5', '2020-1-18'),
       ('2345', '8', '2020-2-23'),
       ('5674', '3', '2020-4-15'),
       ('4345', '2', '2020-3-20'),
       ('1983', '11', '2020-5-1'),
       ('8374', '13', '2020-2-27'),
       ('8928', '50', '2020-3-22'),
       ('3245', '100', '2020-2-11'),
       ('6755', '120', '2020-3-19'),
       ('9876', '80', '2020-1-28'),
       ('2938', '90', '2020-5-22'),
       ('4944', '75', '2020-4-20'),
       ('2334', '110', '2020-5-10'),
       ('6054', '90', '2020-3-11'),
       ('2232', '200', '2020-5-13');

INSERT INTO CustomerBookstoreOrder (OrderNumber, ISBN, BookstoreName, CustomerID, BackOrder)
VALUES ('7349', '498-3-34-14690', 'Indigo', '234', false),
       ('7350', '987-6-54-60197', 'Fair\'s Fair Books', '234', true),
       ('1234', '563-4-56-35673', 'Albion Books', '101', false),
       ('4564', '765-2-34-67894', 'Book Warehouse', '765', false),
       ('3847', '876-8-56-98765', 'Mill Street Books', '444', false),
       ('2345', '234-4-23-45674', 'Epic Books', '221', false),
       ('5674', '908-1-44-56765', 'Attic Books', '565', false),
       ('4345', '765-3-80-56745', 'Appetite for Books', '999', false),
       ('1983', '456-3-45-67544', 'Argo Bookshop', '888', false),
       ('8374', '876-8-56-45675', 'Monkeyshines', '689', false);

INSERT INTO PublisherBookstoreOrder (OrderNumber, ISBN, BookstoreName, PublisherNumber, BranchName, BackOrder)
VALUES ('8945', '498-3-34-14690', 'Indigo', '1', 'Saint-Catherine', false),
       ('8928', '563-4-56-35673', 'Albion Books', '2', 'Anvil South', false),
       ('3245', '765-2-34-67894', 'Book Warehouse', '3', 'ARP East', false),
       ('6755', '876-8-56-98765', 'Mill Street Books', '4', 'Le Double Trouble', true),
       ('9876', '234-4-23-45674', 'Epic Books', '5', 'Moss Apple Road', false),
       ('2938', '908-1-44-56765', 'Attic Books', '6', 'Prince-Arthur', false),
       ('4944', '765-3-80-56745', 'Appetite for Books', '7', 'Brick North', false),
       ('2334', '456-3-45-67544', 'Argo Bookshop', '8', 'Queens', false),
       ('6054', '876-8-56-45675', 'Monkeyshines', '9', 'Rosedale', false),
       ('2232', '987-6-54-60197', 'Fair\'s Fair Books', '1', 'Saint-Catherine', false);


