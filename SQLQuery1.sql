--Create Tables--

CREATE TABLE Adm.Registration(userId int identity(1,1) NOT NULL,
									userName NVARCHAR(50) NOT NULL,
									firstName NVARCHAR(50) NOT NULL,
									MI NVARCHAR(50),
									lastName NVARCHAR(50) NOT NULL,
									address NVARCHAR(100) NOT NULL,
									city NVARCHAR(50),
									state NVARCHAR(50),
									zipCode int NOT NULL,
									phoneNo int NOT NULL,
									alternatePhoneNo INT,
									email NVARCHAR(100) NOT NULL,
									Password NVARCHAR(50) NOT NULL,
									CONSTRAINT PK_Registration Primary Key (userId))

alter table Adm.Registration ADD CONSTRAINT UC_Registration UNIQUE (userName);
Alter table  Adm.Registration alter column phoneNo Nvarchar(15);
Alter table  Adm.Registration alter column alternatePhoneNo Nvarchar(15);
Alter table  Adm.Registration alter column zipCode Nvarchar(15)

CREATE TABLE Adm.ServiceOrBusiness(serviceId INT IDENTITY(1,1) NOT NULL,
								userId INT NOT NULL,
								serBusiness NVARCHAR(50) NOT NULL,
								description NVARCHAR(400) NOT NULL,
								CONSTRAINT FK_Services_Registration foreign key(userId) 
								references Adm.Registration(userId))
ALTER TABLE Adm.ServiceOrBusiness ADD CONSTRAINT PK_ServiceOrBusiness PRIMARY KEY(serviceId)


CREATE TABLE Adm.ServiceMain (
					serviceMainId INT IDENTITY(1,1) NOT NULL,
					services NVARCHAR(50) NOT NULL
					CONSTRAINT PK_serviceMainId PRIMARY KEY (serviceMainId))



--CREATING TYPE TABLE FOR INSERTING A DATATABLE FROM C# TO DATABASE 

CREATE TYPE dtServiceOrBusiness AS TABLE
(
	serBusiness NVARCHAR(50) NOT NULL,
	description NVARCHAR(400) NOT NULL
)

