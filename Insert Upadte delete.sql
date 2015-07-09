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
									@userId AS INT=null,
									@HidePhone AS BIT,
									@HideEmail AS BIT,
					--INSERT TO TABLE Adm.ServiceOrBusiness--
									@dtServiceOrBusiness AS dtServiceOrBusiness READONLY,
									@dtServiceOrBusinessUpdate AS dtServiceOrBusinessUpdate READONLY,
					--ACTION--
									@Action AS INT=NULL,
					--ERROR FLAG--
									@errorFlag int =null OUTPUT
	AS
		SET NOCOUNT ON;
			BEGIN
				IF(@Action=1)
				BEGIN
					BEGIN TRY
						BEGIN TRANSACTION
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
										Password,
										HidePhone,
										HideEmail )
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
										@password,
										@HidePhone,
										@HideEmail
										)
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
				ELSE IF (@Action=2)
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
														HidePhone=@HidePhone,
														HideEmail=@HideEmail
														--Password=@password
									WHERE userId=@userId

						--Updating Service or Business Table(dELETING AND iNSERTING)---
						DECLARE @count AS INT;
						SET @COUNT=(SELECT COUNT(*)FROM @dtServiceOrBusinessUpdate);
							IF (@COUNT>0)
								BEGIN
								--UPDATING TABLE WHERE VALUE FOR SERVICEID IS PRESENT
								UPDATE SB1 SET 
												SB1.serBusiness=SB2.serBusiness,
												SB1.description=SB2.description
									FROM Adm.ServiceOrBusiness AS SB1 INNER JOIN @dtServiceOrBusinessUpdate AS SB2
										ON SB1.serviceId=SB2.serviceID WHERE SB1.userId=@userId
								--INSERTING TABLE  WHERE VALUE FOR SERVICEID IS NULL
									INSERT INTO Adm.ServiceOrBusiness 
													(serBusiness,
													description,
													userId)
													SELECT serBusiness,description,(SELECT @userId) 
														FROM @dtServiceOrBusinessUpdate	where serviceid is null 
								
								END
				END
				
				
			END

