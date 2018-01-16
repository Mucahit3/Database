--======================================================
--
-- Author: Radim Baca, Michal Kratky
-- Create date: 06.03.2017
-- Description: Create a tables database that are used in DAIS lectures
--
--======================================================

-- Drop tables
DROP TABLE Complaint; 
DROP TABLE Purchase;
DROP TABLE Product; 
DROP TABLE Customer; 

--Create tables
CREATE TABLE Product 
(
	pID INTEGER NOT NULL PRIMARY KEY, 
	serialNr VARCHAR(20) NOT NULL, 
	trademark VARCHAR(30) NOT NULL, 
	lastProductionYear INTEGER
);

CREATE TABLE Customer 
(
	cID INTEGER NOT NULL PRIMARY KEY, 
	name VARCHAR(30) NOT NULL, 
	gender VARCHAR(5), 
	registrationYear INTEGER, 
	sendNews INTEGER, 
	email VARCHAR(50) NOT NULL
);

CREATE TABLE Purchase
(
	nID INTEGER NOT NULL PRIMARY KEY,
	cID INTEGER NOT NULL REFERENCES Customer, 
	pID INTEGER NOT NULL REFERENCES Product, 
	purchaseDay DATE NOT NULL,
	price INTEGER NOT NULL, 
	purchaseCount INTEGER NOT NULL
);

CREATE TABLE Complaint 
(
	nID INTEGER NOT NULL REFERENCES Purchase,
	complaintOrder INTEGER NOT NULL, 
	duration INTEGER, 
	price INTEGER, 
	CONSTRAINT PK_Complaint PRIMARY KEY (nID, complaintOrder)
);

INSERT INTO Product VALUES (1, 'OSKA-01-2', 'Whirpool', 2012);
INSERT INTO Product VALUES (2, 'OSKA-01-4', 'Whirpool', 2012);
INSERT INTO Product VALUES (3, 'GEL-0006-7G', 'Whirpool', 2010);
INSERT INTO Product VALUES (4, 'WOS-50-K2', 'Electrolux', 2011);
INSERT INTO Product VALUES (5, 'WOS-40-K', 'Electrolux', 2012);
INSERT INTO Product VALUES (6, 'WOS-10-K80', 'Electrolux', NULL);
INSERT INTO Product VALUES (7, 'Rup-15-6', 'Humbuk', 2010);
INSERT INTO Product VALUES (8, 'HUP', 'Green line', 2012);
INSERT INTO Product VALUES (9, 'WAP 26', 'Green line', NULL);
INSERT INTO Product VALUES (10, 'Bongo Ultra 256', 'Green line', 2010);

INSERT INTO Customer VALUES (1, 'olda', 'man', NULL, 0, 'old.setrhand@gmail.com');
INSERT INTO Customer VALUES (2, 'pepik', 'man', 1999, 0, 'pepa.z.depa@gmail.com');
INSERT INTO Customer VALUES (3, 'vinetu', 'man', 2005, 1, 'winer.netu@seznam.cz');
INSERT INTO Customer VALUES (4, 'sandokan', 'man', 2006, 1, 'sandal.okanal@seznam.cz');
INSERT INTO Customer VALUES (5, 'amazonka', 'woman', 2005, 0, 'amazonka@seznam.cz');
INSERT INTO Customer VALUES (6, 'dryada', 'woman', 2006, 1, 'dr.ada@seznam.cz');
INSERT INTO Customer VALUES (7, 'fantomas', 'man', NULL, NULL, 'fantom.as@gmail.com');
INSERT INTO Customer VALUES (8, 'kilian', 'man', 2000, NULL, 'kilian.jornet@gmail.com');

INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (1, 2, 1, TO_DATE('03.08.2013 01:36', 'DD.MM.YYYY HH24:MI'), 3503, 0);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (2, 6, 1, TO_DATE('30.10.2012 23:38', 'DD.MM.YYYY HH24:MI'), 1668, 1);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (3, 5, 1, TO_DATE('21.05.2013 02:02', 'DD.MM.YYYY HH24:MI'), 220, 9);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (4, 7, 1, TO_DATE('19.07.2014 00:02', 'DD.MM.YYYY HH24:MI'), 394, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (5, 3, 1, TO_DATE('14.01.2014 11:54', 'DD.MM.YYYY HH24:MI'), 2871, 4);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (6, 5, 1, TO_DATE('17.06.2014 10:45', 'DD.MM.YYYY HH24:MI'), 1047, 2);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (7, 7, 1, TO_DATE('24.04.2012 17:45', 'DD.MM.YYYY HH24:MI'), 917, 9);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (8, 3, 3, TO_DATE('03.12.2012 15:49', 'DD.MM.YYYY HH24:MI'), 4129, 9);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (9, 6, 3, TO_DATE('08.12.2012 21:28', 'DD.MM.YYYY HH24:MI'), 3420, 6);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (10, 3, 3, TO_DATE('14.09.2013 16:57', 'DD.MM.YYYY HH24:MI'), 4072, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (11, 7, 3, TO_DATE('27.10.2012 08:20', 'DD.MM.YYYY HH24:MI'), 3698, 1);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (12, 7, 4, TO_DATE('20.07.2012 15:40', 'DD.MM.YYYY HH24:MI'), 4210, 1);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (13, 5, 4, TO_DATE('31.01.2014 14:00', 'DD.MM.YYYY HH24:MI'), 4339, 6);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (14, 1, 4, TO_DATE('10.10.2014 20:49', 'DD.MM.YYYY HH24:MI'), 2646, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (15, 4, 4, TO_DATE('14.09.2012 09:46', 'DD.MM.YYYY HH24:MI'), 832, 2);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (16, 2, 4, TO_DATE('06.11.2013 15:43', 'DD.MM.YYYY HH24:MI'), 319, 3);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (17, 2, 4, TO_DATE('03.07.2013 20:55', 'DD.MM.YYYY HH24:MI'), 4670, 7);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (18, 1, 5, TO_DATE('13.08.2012 15:58', 'DD.MM.YYYY HH24:MI'), 3965, 7);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (19, 2, 6, TO_DATE('01.01.2014 23:17', 'DD.MM.YYYY HH24:MI'), 4581, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (20, 4, 6, TO_DATE('23.08.2013 01:58', 'DD.MM.YYYY HH24:MI'), 4729, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (21, 3, 6, TO_DATE('04.11.2014 15:38', 'DD.MM.YYYY HH24:MI'), 4098, 5);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (22, 3, 7, TO_DATE('01.08.2012 04:21', 'DD.MM.YYYY HH24:MI'), 2903, 3);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (23, 3, 8, TO_DATE('27.10.2012 19:24', 'DD.MM.YYYY HH24:MI'), 4655, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (24, 3, 9, TO_DATE('12.07.2012 22:50', 'DD.MM.YYYY HH24:MI'), 3056, 9);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (25, 3, 9, TO_DATE('15.06.2012 07:49', 'DD.MM.YYYY HH24:MI'), 4190, 2);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (26, 7, 9, TO_DATE('11.08.2012 11:19', 'DD.MM.YYYY HH24:MI'), 2031, 1);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (27, 6, 9, TO_DATE('30.07.2014 06:38', 'DD.MM.YYYY HH24:MI'), 2912, 8);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (28, 7, 9, TO_DATE('29.11.2013 05:55', 'DD.MM.YYYY HH24:MI'), 3779, 9);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (29, 7, 9, TO_DATE('14.03.2013 00:34', 'DD.MM.YYYY HH24:MI'), 362, 1);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (30, 2, 10, TO_DATE('11.05.2012 17:03', 'DD.MM.YYYY HH24:MI'), 2253, 5);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (31, 4, 10, TO_DATE('09.02.2014 16:21', 'DD.MM.YYYY HH24:MI'), 4193, 0);
INSERT INTO Purchase(nID, cID, pID, purchaseDay, price, purchaseCount) VALUES (32, 6, 10, TO_DATE('28.01.2012 20:25', 'DD.MM.YYYY HH24:MI'), 371, 9);

INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (1, 1, 8, 2356);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (1, 2, 4, 7575);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (2, 1, 1, 2170);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (2, 2, 15, 1778);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (2, 3, 6, 7717);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (3, 1, 13, 207);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (4, 1, 11, 654);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (4, 2, 15, 2031);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (6, 1, 20, 1491);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (6, 2, 6, 1048);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (6, 3, 6, 7561);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (6, 4, 3, 646);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (7, 1, 8, 1536);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (7, 2, 1, 798);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (7, 3, 5, 31115);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (7, 4, 6, 1763);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (11, 1, 10, 4163);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (11, 2, 17, 2985);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (14, 1, 8, 2861);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (14, 2, 2, 2381);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (18, 1, 14, 3404);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (18, 2, 16, 2939);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (22, 1, 14, 1994);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (22, 2, 18, 25039);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (22, 3, 13, 2594);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (24, 1, 2, 4813);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (24, 2, 7, 2749);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (24, 3, 2, 76084);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (25, 1, 18, 91486);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (25, 2, 2, 2756);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (25, 3, 14, 4482);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (25, 4, 18, 3388);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (27, 1, 17, 3630);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (27, 2, 8, 3872);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (27, 3, 12, 1912);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (28, 1, 14, 9259);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (29, 1, 5, 237);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (29, 2, 4, 251);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (29, 3, 7, 595);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (30, 1, 7, 2288);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (30, 2, 3, 3286);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (30, 3, 11, 4736);
INSERT INTO Complaint (nID, complaintOrder, duration, price) VALUES (31, 1, 7, 3151);

COMMIT;