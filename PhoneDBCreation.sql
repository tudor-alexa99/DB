USE PhoneStore
GO

CREATE TABLE Brands(
	Bid INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE OS(
	OSid INT PRIMARY KEY,
	OSname VARCHAR(50) NOT NULL,
	BuildNumber INT DEFAULT 1.0
)

CREATE TABLE AppStore(
	ASid INT PRIMARY KEY,
	OS INT FOREIGN KEY REFERENCES OS(OSid),
	Name VARCHAR(50),
)

CREATE TABLE Phones(
	PHid INT PRIMARY KEY,
	Bid INT FOREIGN KEY REFERENCES Brands(Bid),
	OS INT FOREIGN KEY REFERENCES OS(OSid),
	ModelName VARCHAR(50),
	 --CONSTRAINT Pid PRIMARY KEY(Bid, OS)
)
--DROP TABLE Phones
CREATE TABLE APK(
	APKid INT PRIMARY KEY,
	Name VARCHAR(50)
)

CREATE TABLE Compatibility(
	ASid INT FOREIGN KEY REFERENCES AppStore(ASid),
	APKid INT FOREIGN KEY REFERENCES APK(APKid)
	CONSTRAINT pk_compatibility PRIMARY KEY(ASid, APKid)
)

CREATE TABLE Carriers(
	Caid INT PRIMARY KEY,
	Name VARCHAR(50),
)

CREATE TABLE InternetOptions(
	IOid INT PRIMARY KEY,
	BroadBand VARCHAR(50) DEFAULT '4G'
)

CREATE TABLE CreditOptions(
	COid INT PRIMARY KEY,
	Amount INT
)

CREATE TABLE Service(
	Sid INT PRIMARY KEY, 
	Internet INT FOREIGN KEY REFERENCES InternetOptions(IOid), 
	Credit INT FOREIGN KEY REFERENCES CreditOptions(COid),
	CAid INT FOREIGN KEY REFERENCES Carriers(Caid)
)

CREATE TABLE Purchase(
	Pid INT PRIMARY KEY,
	 --Sid INT FOREIGN KEY REFERENCES Service(Sid),
	PHid INT FOREIGN KEY REFERENCES Phones(PHid),
	ClientName VARCHAR(50),
	TotalPrice INT
)

CREATE TABLE FinalPurchase(
	Pid INT PRIMARY KEY,
	Sid INT FOREIGN KEY REFERENCES Service(Sid),
	PHid INT FOREIGN KEY REFERENCES Phones(PHid)
)
