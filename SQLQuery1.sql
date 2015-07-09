--Create Tables--
SELECT * FROM Adm.Registration --where userName='thomas'
SELECT * FROM Adm.ServiceOrBusiness
CREATE TABLE Adm.Registration(userId int identity(1,1) NOT NULL,
									userName NVARCHAR(50) NOT NULL,
									firstName NVARCHAR(50) NOT NULL,
									MI NVARCHAR(50),
									lastName NVARCHAR(50) NOT NULL,
									address NVARCHAR(100) NOT NULL,
									city NVARCHAR(50),
									state NVARCHAR(50),
									zipCode NVARCHAR(15) NOT NULL,
									phoneNo NVARCHAR(15) NOT NULL,
									alternatePhoneNo NVARCHAR(15),
									email NVARCHAR(100) constraint UK_Email UNIQUE(email) NOT NULL,
									Password NVARCHAR(50) NOT NULL,
									CONSTRAINT PK_Registration Primary Key (userId),
									CONSTRAINT UK_Registration UNIQUE (userName))


DROP TABLE Adm.Registration
alter table Adm.Registration ADD CONSTRAINT UK_Registration UNIQUE (userName);
Alter table  Adm.Registration alter column phoneNo Nvarchar(15);
Alter table  Adm.Registration alter column alternatePhoneNo Nvarchar(15);
Alter table  Adm.Registration alter column zipCode Nvarchar(15)
Alter table  Adm.Registration Add HideEmail BIT 
Alter table  Adm.Registration Drop COLUMN HideAlterPhone

CREATE TABLE Adm.ServiceOrBusiness(serviceId INT IDENTITY(1,1) NOT NULL,
								userId INT NOT NULL,
								serBusiness NVARCHAR(50) NOT NULL,
								description NVARCHAR(400) NOT NULL,
								CONSTRAINT FK_Services_Registration foreign key(userId) 
								REFERENCES Adm.Registration(userId))

ALTER TABLE Adm.ServiceOrBusiness ADD CONSTRAINT PK_ServiceOrBusiness PRIMARY KEY(serviceId)


CREATE TABLE Adm.ServiceMain (
					serviceMainId INT IDENTITY(1,1) NOT NULL,
					services NVARCHAR(50) NOT NULL
					CONSTRAINT PK_serviceMainId PRIMARY KEY (serviceMainId))


INSERT INTO Adm.ServiceMain (services) VALUES('Plumber'),
													('Electrician'),
													('Mechanic'),
													('Florist'),
													('Hair Stylist'),
													('Photographer'),
													('Catering'),
													('Handyman'),
													('Painter'),
													('Artist'),
													('Teacher')

--CREATING TYPE TABLE FOR INSERTING A DATATABLE FROM C# TO DATABASE 

CREATE TYPE dtServiceOrBusiness AS TABLE
(
	serBusiness NVARCHAR(50) NOT NULL,
	description NVARCHAR(400) NOT NULL
)

--STORED PROCEDURE FOR INSERT,UPDATE,DELETE--

ALTER PROCEDURE Adm.procInsertUpdateRegistrationandService
									@userName AS NVARCHAR(50),
									@firstName AS NVARCHAR(50),
									@MI NVARCHAR(50)=NULL,
									@lastName AS NVARCHAR(50),
									@address AS  NVARCHAR(100),
									@city AS NVARCHAR(50)=NULL,
									@state AS NVARCHAR(50)=NULL,
									@zipCode AS NVARCHAR(15),
									@phoneNo AS NVARCHAR(15) ,
									@alternatePhoneNo AS NVARCHAR(15)=NULL,
									@email AS NVARCHAR(100),
									@password AS NVARCHAR(50),
					--INSERT TO TABLE Adm.ServiceOrBusiness--
									@dtServiceOrBusiness AS dtServiceOrBusiness READONLY,
					--ACTION--
									@Action AS INT=NULL,
					--ERROR FLAG--
									@errorFlag int =null OUTPUT
	AS
		SET NOCOUNT ON;
			BEGIN
				IF(@Action=1)
					BEGIN 
						BEGIN TRANSACTION
																																																			BEGIN TRY
						INSERT INTO Adm.Registration
										(userName,
										firstName,
										MI,
										lastName,
										address,
										city,
										state,
										zipCode,
										phoneNo,
										alternatePhoneNo,
										email,
										Password )
								VALUES
										(@userName,
										@firstName,
										@MI,
										@lastName,
										@address,
										@city,
										@state,
										@zipCode,
										@phoneNo ,
										@alternatePhoneNo,
										@email,
										@password)
--INSERTING TO 	TABLE Adm.ServiceOrBusiness USING THE CURRENT userId FROM TABLE	Adm.Registration	
							DECLARE @currentUserId AS INT;
								SET @currentUserId=(SELECT SCOPE_IDENTITY());
							DECLARE @ROWCOUNT AS INT;
								SELECT @ROWCOUNT= COUNT(*) FROM @dtServiceOrBusiness;
						IF(@ROWCOUNT>0)
							BEGIN
								INSERT INTO Adm.ServiceOrBusiness 
													(serBusiness,
													description,
													userId)
													SELECT serBusiness,description,(SELECT @currentUserId) 
														FROM @dtServiceOrBusiness
							END
						END TRY
						BEGIN CATCH
							SET @errorFlag=@@ERROR;
						END CATCH
										IF (@errorFlag<>0)
							BEGIN
								ROLLBACK TRANSACTION;
							END
						ELSE
							BEGIN
								COMMIT TRANSACTION;
							END
					END
			ELSE IF(@Action=2)
					BEGIN
						UPDATE Adm.Registration SET userName=@userName,
											firstName=@firstName,
											MI=@MI,
											lastName=@lastName,
											address=@address,
											city=@city,
											state=@state,
											zipCode=@zipCode,
											phoneNo=@phoneNo,
											alternatePhoneNo=@alternatePhoneNo,
											email=@email,
											Password=@password
						WHERE userName=@userName;
				END
			END
--Procedure for ServiceMain

ALTER PROC Adm.procServiceMain 
			AS
				SET NOCOUNT ON;
					BEGIN
						SELECT S.serviceMainId,S.services
							FROM Adm.ServiceMain AS S ORDER BY  S.services;
			END 
--Procedure for  UserNameExists--

ALTER PROCEDURE Adm.CheckUserNameExists @userName AS NVARCHAR(50)
		AS
		SET NOCOUNT ON;
			BEGIN
				IF NOT EXISTS
					(SELECT * FROM Adm.Registration AS R WHERE R.userName=@userName)
					SELECT 'True';
					ELSE
					SELECT 'False';
			END

--Procedure for Login
ALTER PROCEDURE Adm.LoginCheck
				@userName AS NVARCHAR(50),
				@password AS NVARCHAR(50)
	AS
		BEGIN
		IF EXISTS
			(SELECT *--R.userName,R.Password 
				FROM Adm.Registration AS R
					 WHERE R.userName=@userName AND R.Password=@password COLLATE SQL_Latin1_General_CP1_CS_AS)
			SELECT 'True';
			ELSE
			SELECT 'False';
		END


EXEC Adm.LoginCheck @userName='rachitha',
				@password='fg'

EXEC Adm.procInsertUpdateRegistrationandService 
									 @userName='Rachitha',
									@firstName='Rachitha',
									--@MI=NULL,
									@lastName='Paul',
									@address='3131 wingle',
									@city='tampa',
									@state='FL',
									@zipCode=657665,
									@phoneNo=8133734544,
									--@alternatePhoneNo AS INT=NULL,
									@email='Joseph@gmail.com',
									@password='rachitha',
									@Action=1;

create proc adm.test @userName AS NVARCHAR(50),
									@firstName AS NVARCHAR(50),
									@MI NVARCHAR(50)=NULL,
									@lastName AS NVARCHAR(50),
									@address AS  NVARCHAR(100),
									@city AS NVARCHAR(50)=NULL,
									@state AS NVARCHAR(50)=NULL,
									@zipCode AS NVARCHAR(15),
									@phoneNo AS NVARCHAR(15) ,
									@alternatePhoneNo AS NVARCHAR(15)=NULL,
									@email AS NVARCHAR(100),
									@password AS NVARCHAR(50)
									as
									begin

INSERT INTO Adm.Registration
									(userName,
									firstName,
									MI,
									lastName,
									address,
									city,
									state,
									zipCode,
									phoneNo,
									alternatePhoneNo,
									email,
									Password )
							VALUES
									(@userName,
									@firstName,
									@MI,
									@lastName,
									@address,
									@city,
									@state,
									@zipCode,
									@phoneNo ,
									@alternatePhoneNo,
									@email,
									@password)
						end		

select * from Adm.ServiceMain

SELECT * FROM Adm.Registration --where userName='thomas'
SELECT * FROM Adm.ServiceOrBusiness

drop table Adm.ServiceOrBusiness
drop table adm.Registration

CREATE TABLE Adm.Guest (guestID INT IDENTITY(1,1) NOT NULL,
						 guestEmail NVARCHAR(50) NOT NULL
						 CONSTRAINT PK_guestID PRIMARY KEY(guestID))


DROP TABLE Adm.Guest 