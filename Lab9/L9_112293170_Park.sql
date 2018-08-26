-- ***********************
-- Name: Sang Jun Park
-- ID: 112293170
-- Date: 2018-07-24
-- Purpose: Lab 9 DBS301
-- ***********************

--Q1. Create a sequence with the follwing properties
--Name: seq_ProductID_PK
--Starting value: 1
--Increment Value: 1
--Maximum value: None
--Cache: None

--A1.	
CREATE SEQUENCE seq_ProductID_PK
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

--Q2. Add the following data to the Vendor table
--VendorID: 1
--VendorName: Acme Corp.
--VendorContact: Bob Smith
--VendorContactPhone: 416-555-9087

--VendorID: 2
--VendorName: Hewlett Packard
--VendorContact:
--VendorPhone: 416-555-3234

--A2.
INSERT INTO tblVendorLab9 (VendorID, VendorName, VendorContact,VendorContactPhone)
VALUES (1, 'Acme Corp.', 'Bob Smith', '416-555-9087');

INSERT INTO tblVendorLab9 (VendorID, VendorName, VendorContactPhone)
VALUES (2, 'Hewlett Packard', '416-555-3234');

--Q3. Use the sequence created in question 1 to poulate the Product table
--ProductID: use sequence
--VendorID: 1
--ProductDesc: Dell Mouse
--ProductCost: 25
--ProductSell: 50

--ProductID: use sequence
--VendorID: 2
--ProductDesc: HP Pavilion
--ProductCost: 230
--ProductSell: 670

--ProductID: use sequence
--VendorID: 1
--ProductDesc: Acer HD Monitor
--ProductCost: 55
--ProductSell: 128

--A3.	
INSERT INTO tblProductLab9 (ProductID, VendorID, ProductDesc, ProductCost, ProductSell)
VALUES(seq_ProductID_PK.NEXTVAL, 1, 'Dell Mouse', 25, 50);

INSERT INTO tblProductLab9 (ProductID, VendorID, ProductDesc, ProductCost, ProductSell)
VALUES(seq_ProductID_PK.NEXTVAL, 2, 'HP Pavilion', 230, 670);

INSERT INTO tblProductLab9 (ProductID, VendorID, ProductDesc, ProductCost, ProductSell)
VALUES(seq_ProductID_PK.NEXTVAL, 1, 'Acer HD Monitor', 55, 128);

--Q4. change the cost and sell price of the HP Pavilion product created above to the following.  Use one statement.

--ProductCost: 195
--ProductSell: 650

--A4.
UPDATE tblProductLab9
SET ProductCost = 195, ProductSell = 650
WHERE ProductDesc = 'HP Pavilion';

--Q5. check the current value of the sequence with the following command

--SELECT last_number FROM user_sequences WHERE sequence_name='SEQ_PRODUCTID_PK';
--Now try to reset the sequence back to start at 1.  You cannot drop the sequence and recreate it.  This would cause all users to lose rights to the sequence and in real life you would have to reassign all the user rights again to the sequence.
--If you are successful run the above SELECT statement again to see if it got reset.

--A5.
SELECT last_number FROM user_sequences WHERE sequence_name='SEQ_PRODUCTID_PK';
ALTER SEQUENCE SEQ_PRODUCTID_PK INCREMENT BY -4;
SELECT SEQ_PRODUCTID_PK.NEXTVAL FROM DUAL;
ALTER SEQUENCE SEQ_PRODUCTID_PK INCREMENT BY 1;
SELECT last_number FROM user_sequences WHERE sequence_name='SEQ_PRODUCTID_PK';


