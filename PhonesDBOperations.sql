USE PhoneStore 

GO 

CREATE TABLE Reviewer(
		Rid INT PRIMARY KEY,
		Name VARCHAR(50),
)
DROP TABLE Reviewer

CREATE TABLE AppReview(
	Rid INT FOREIGN KEY REFERENCES Reviewer(Rid),
	APKid INT FOREIGN KEY REFERENCES APK(APKid),
	Review VARCHAR(50),
	CONSTRAINT pk_appReview PRIMARY KEY(Rid, APKid)
)

ALTER TABLE Reviewer 
ADD Age INT, City VARCHAR(50)

UPDATE Reviewer SET Age = 20, City = 'Cluj' WHERE Rid = 1201 
UPDATE Reviewer SET Age = 22, City = 'Alba' WHERE Rid = 1202 
UPDATE Reviewer SET Age = 18, City = 'Arad' WHERE Rid = 1203 
UPDATE Reviewer SET Age = 20, City = 'Craiova' WHERE Rid = 1204 
UPDATE Reviewer SET Age = 16, City = 'Turda' WHERE Rid = 1205 

ALTER TABLE AppReview
ADD Stars INT

UPDATE AppReview SET Stars = 5 WHERE Rid = 1201 AND APKid = 101
UPDATE AppReview SET Stars = 4 WHERE Rid = 1202 AND APKid = 102
UPDATE AppReview SET Stars = 3 WHERE Rid = 1202 AND APKid = 103
UPDATE AppReview SET Stars = 5 WHERE Rid = 1201 AND APKid = 104
UPDATE AppReview SET Stars = 2 WHERE Rid = 1204 AND APKid = 102
UPDATE AppReview SET Stars = 5 WHERE Rid = 1204 AND APKid = 106

INSERT INTO Reviewer VALUES	(1201, 'Maria'),(1202, 'Aex'),(1203, 'Danny'),(1204, 'George'),(1205, 'Jessy')

INSERT INTO AppReview VALUES(1201, 101, 'Brilliant'), (1201, 102, 'Useful'), (1202, 103, 'Meh'), (1201, 104, 'I use it daily'), (1204, 102, 'Kinda buggy'),(1204, 106, 'Well done')

INSERT INTO APK(APKid, Name) VALUES (101,'GCam'), (102, 'Maps'), (103, 'Recorder')
INSERT INTO APK(APKid, Name) VALUES (104,'Facebook'), (105, 'Instagram'), (106, 'WhatsApp'), (107, 'Tinder')

--null value to be deleted later--
INSERT INTO APK(APKid) VALUES(104)

INSERT INTO OS(OSid, OSname, BuildNumber) VALUES (401, 'Android', 10.2), (402, 'iOS', 13.4), (403, 'BlackOS', 7.0), (492, 'DeletedOS', 1.1)

INSERT INTO AppStore(ASid, OS, Name) VALUES (301, 401, 'PlayStore'), (302, 402, 'AppStore'), (303, 403, 'AppGallery'), (304, 401, 'DeletedStore')

---These 2 won't work---
INSERT INTO AppStore(ASid, OS, Name) VALUES (399, 404, 'WrongStore')
INSERT INTO AppStore(ASid, OS, Name) VALUES (301, 402, 'RepeatedKey')
------------------------

INSERT INTO Compatibility(ASid, APKid) VALUES(301, 101), (302, 102)
INSERT INTO Compatibility(ASid, APKid) VALUES(301, 104), (302, 104), (303, 104), (301, 105), (302, 105), (303, 105), (301,106),(302,106),(301,107),(302,107)

INSERT INTO Brands(Bid, Name) VALUES (501, 'Google'), (502, 'Apple'), (503, 'Huawei'), (504,'Samsung'), (505,'Razer')
INSERT INTO Brands(Bid, Name) VALUES (506, 'Honor')

UPDATE Brands 
SET Years = 
CASE Bid
	WHEN 501 THEN 20
	WHEN 502 THEN 32
	WHEN 503 THEN 13
	WHEN 504 THEN 22
	WHEN 505 THEN 8
	WHEN 506 THEN 4
	END
WHERE Bid IN (501,502,503,504,505,506)

SELECT  * FROM Brands

INSERT INTO Phones(PHid, Bid, OS, ModelName, BatterryCap, Warranty)
VALUES  (601, 501, 401, 'Pixel 4', 2800, 3),
		(602, 502, 402, 'iPhone 11', 3000, 5),
		(603, 502, 402, 'iPhonee 11 Pro', 3200, 5),
		(604, 501, 401, 'Galaxy Note 10', 4000, 2),
		(605, 501, 401, 'Galaxy S10', 3800, 2),
		(620, 501, 401, 'Galaxy A50', 3000, 2)
-- will be edited --
INSERT INTO Phones VALUES (607, 501, 401, 'P30 Pro', 4200, 2)

INSERT INTO Phones VALUES 
	(608, 502, 402, 'iPhone 8+', 2300, 3),
	(609, 502, 402, 'iPhone 8', 2100, 3),
	(610, 501, 401, 'Pixel 3a', 3300, 3),
	(611, 504, 401, 'Galaxy Fold', 4500, 1),
	(612, 504, 401, 'A10', 3200, 1),
	(613, 504, 401, 'A50', 3200, 1)

INSERT INTO Phones VALUES
	(614, 504, 401, 'Galaxy S10+', 4200, 3),
	(615, 504, 401, 'Galaxy A30+', 3600, 2)

INSERT INTO Carriers(Caid, Name) VALUES
		(701, 'AT&T'),
		(702,'Vodafone'),
		(703,'Orange'),
		(704,'Verison')

INSERT INTO CreditOptions(COid, Amount) VALUES
		(901, 200),
		(902, 300),
		(903, 400)

INSERT INTO InternetOptions(IOid, BroadBand) VALUES
		(1001, '3G'),
		(1002, '4G'),
		(1003, '5Ge'),
		(1004, '5G')

INSERT INTO Service (Sid, Internet, Credit, CAid) VALUES
		(801, 1001, 901, 701),
		(802, 1002, 902, 701),
		(803, 1004, 903, 702),
		(804, 1004, 903, 703),
		(805, 1002, 902, 704)

ALTER TABLE FinalPurchase
ADD TotalPrice INT

ALTER TABLE Brands
ADD Years INT

ALTER TABLE Phones
ADD Warranty INT


--- they were needed later, ignore them ---
DELETE FROM Phones
SELECT * FROM Service
DELETE FROM FinalPurchase
---------------------------------------------
INSERT INTO FinalPurchase(Pid, Sid, PHid, TotalPrice) VALUES
		(1101, 801, 601, 900),
		(1102, 802, 602, 700),
		(1103, 803, 603, 1200),
		(1104, 804, 604, 1100),
		(1105, 805, 605, 1150)

---Deleted data---
DELETE 
FROM AppStore
WHERE Name LIKE 'Del%'

DELETE 
FROM OS
WHERE BuildNumber BETWEEN 1.0 AND 1.5

DELETE 
FROM APK
WHERE Name IS NULL
-------------------
---Updated data---
UPDATE Phones
SET PHid = 606
WHERE PHid = 620

UPDATE Phones
SET Bid = 503
WHERE ModelName LIKE 'P30%'

UPDATE OS
SET OSname = 'HuangMengOS'
WHERE OSname LIKE 'Black%'

UPDATE APK
SET Name = 'LiveRecorder'
WHERE APKid = 103

UPDATE Phones
SET OS = 403
WHERE Bid in (506, 503)
--set the phones from the Honor and Huawei brand to HuangMengOS--

UPDATE Phones
SET Bid = 504
WHERE ModelName LIKE 'Galaxy%'

--use this to check the updated/removed data 
SELECT * 
FROM Phones, AppStore, OS

--SELECT queries
SELECT ph.ModelName, os.OSname
FROM Phones ph, OS os
WHERE os.OSid = ph.OS
UNION
SELECT os.BuildNumber
FROM OS os
WHERE OS.OSid = 401 OR OS.OSid = 402

SELECT * 
FROM Phones

--- a ---
--- Gets the names of all the phones and brands in th DB
SELECT ph.ModelName
FROM Phones ph
UNION 
SELECT ph.ModelName
FROM Phones ph
WHERE ph.OS = 401 OR ph.OS = 402
	
/*SELECT ph.ModelName
FROM Phones ph
UNION*/

SELECT os.OSname, os.BuildNumber
FROM OS os
WHERE os.OSid = 401 OR os.OSid = 402
-----------

--- b ---
--- Selects all the phones from Apple and Samsung that contain 
---    the digits 8 or 1 in the model name
SELECT ph.ModelName, ph.PHid
FROM Phones ph
WHERE ph.ModelName LIKE '%8%' OR ph.ModelName LIKE '%1%'
INTERSECT 
SELECT ph.ModelName, ph.PHid
FROM Phones ph
WHERE ph.Bid IN (502, 504)

--- c ---
--- Show the phones made by Samsung and Apple, 
--- except for the '+ sized' ones
SELECT ph.ModelName AS 'Model'
FROM Phones ph
WHERE ph.Bid in (502, 504)

EXCEPT

SELECT ph.ModelName
FROM Phones ph
WHERE ph.ModelName like '%+%' 

--- d ---
--- Show the first 5 Apps that can be downloaded on different app stores ---
SELECT TOP 5 APK.APKid AS 'Id', APK.Name AS 'APP', AppStore.Name AS 'Store'
FROM ((Compatibility
INNER JOIN APK ON APK.APKid = Compatibility.APKid)
INNER JOIN AppStore ON  AppStore.ASid = Compatibility.ASid);

--- Show all the available recharging options 
SELECT Service.Sid, Carriers.Name AS 'Carrier', InternetOptions.BroadBand AS 'Internet', CreditOptions.Amount AS 'Credit amount' 
FROM 
	(((SERVICE 
	INNER JOIN Carriers ON Carriers.Caid = Service.CAid)
	INNER JOIN CreditOptions ON CreditOptions.COid = Service.Credit)
	INNER JOIN InternetOptions ON InternetOptions.IOid = Service.Internet);

--- Show all the phones made by the brands with ID 502 and 504
SELECT ph.PHid, ph.Bid as 'Brand ID', ph.ModelName
FROM Phones ph
LEFT JOIN Brands br ON br.Bid = ph.PHid
WHERE ph.Bid IN (502, 504)


SELECT * 
FROM FinalPurchase fp
RIGHT JOIN Service s ON s.Sid = fp.Sid

--- Show each brand and phone model, and for each the operating system it works on 
--- 
--- FULL OUTER JOIN duplicates values while also showing the NULL ones. To see that, 
--- replace the line below with

--SELECT *
SELECT ph.PHid AS 'Id', br.Name AS 'Brand', ph.ModelName AS 'Model', o.OSname as 'OS'
FROM Phones ph
FULL JOIN Brands br ON br.Bid = ph.Bid
FULL JOIN OS o ON o.OSid = ph.OS

--- e ---

--- Show all the purchases in which there's a phone who's operating system is on a
--- build number grater than 9 
SELECT * 
FROM FinalPurchase fp
WHERE fp.PHid IN 
	(
	SELECT ph.PHid 
	FROM Phones ph
	WHERE ph.OS IN
		(
		SELECT o.OSid
		FROM OS o
		WHERE o.BuildNumber > 9)
	)

--- Show all the Final Purchases made where the internet connection was of the 5G type
SELECT *
FROM FinalPurchase fp
WHERE fp.Sid IN 
	(
	SELECT s.Sid
	FROM Service s
	WHERE S.Internet IN 
		(
		SELECT i.IOid
		FROM InternetOptions i
		WHERE i.BroadBand like '5G%'
		)
	)


--- f ---
-- Show the phones that appear in a purchase that has the total price between 1000 and 1500 $
SELECT * 
FROM Phones p
WHERE EXISTS (
	SELECT * 
	FROM FinalPurchase f
	WHERE p.PHid = f.PHid AND f.TotalPrice BETWEEN 1000 AND 1500)

--Show the Services in which the Carrier starts with the letter V 
SELECT *
FROM Service
WHERE EXISTS 
	(SELECT* 
	FROM Carriers
	WHERE Carriers.Name LIKE 'V%'
	)
			
--- g --
-- Select the 2nd and 3rd appStores in the DB 
SELECT * FROM 
(SELECT * FROM AppStore a
WHERE a.OS = 402 OR a.OS = 403) AS tabl

--
-- Select all the apps that start with the letters I or F
SELECT * FROM
(SELECT * FROM APK 
WHERE APK.Name LIKE 'I%' OR APK.Name LIKE 'F%') AS a 

--- h ---
--- for each phone that has a warranty 

--- Show the list of brands that have been active since before 2000
SELECT b.Name, b.Years
FROM Brands b
GROUP BY b.Years
HAVING b.Years > 19

--- show the users that have reviewed more than one app
SELECT COUNT(Review) as 'Nr of reviews', Rid as 'User Id'
FROM AppReview
GROUP BY Rid
HAVING COUNT(Rid) > 1

--- !!
SELECT apk.APKid -- as 'Nr of reviews', Rid as 'User Id'
FROM APK apk
GROUP BY APKid 
HAVING (SELECT Stars FROM AppReview) > 3

--- i ---  
SELECT * FROM AppReview A1
WHERE A1.Stars > ANY(SELECT A2.Stars FROM AppReview A2 WHERE A2.Stars > 2)

SELECT * FROM AppReview A1
WHERE A1.Stars > ALL(SELECT A2.Stars FROM AppReview A2 WHERE A2.Stars < 3)

SELECT * FROM AppReview A1
WHERE A1.Stars <> ALL(SELECT A2.Stars FROM AppReview A2 WHERE A2.Stars < 4)

SELECT * FROM APK
WHERE APK.APKid NOT IN (SELECT AppReview.APKid FROM AppReview)

SELECT * FROM AppReview
WHERE FLOOR(AVG(AppReview.Stars)) > 3
 
