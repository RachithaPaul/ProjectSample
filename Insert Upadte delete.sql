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
									@userId AS INT,
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
														email=@email--,
														--Password=@password
									WHERE userId=@userId
								END
			END

EXEC Adm.procInsertUpdateRegistrationandService 
									 @userName='Thomas4',
									@firstName='Rachitha',
									@MI='PUTHUMANA',
									@lastName='Paul',
									@address='3131 wingle',
									@city='tampa',
									@state='FL',
									@zipCode=657665,
									@phoneNo=8133734544,
									--@alternatePhoneNo AS INT=NULL,
									@email='Joseph@gmail.com',
									@password='rachitha1',
									@Action=2;

SELECT * FROM  Adm.Registration WHERE userName='Thomas4';