ALTER PROC Adm.procGusetLogin @guestEmail AS NVARCHAR(50),
							  @Action AS INT = NULL
	AS
		BEGIN
			IF(@Action=1) 
				BEGIN
					INSERT INTO Adm.Guest(guestEmail) values(@guestEmail)
				END
			ELSE IF (@Action=2)
				BEGIN
					UPDATE Adm.Guest SET guestEmail=@guestEmail WHERE guestEmail=@guestEmail
				END
		END

ALTER PROC Adm.procGuestEmailCheck  @guestEmail NVARCHAR(50)
AS
	BEGIN
		IF EXISTS 
			(SELECT guestEmail FROM Adm.Guest WHERE guestEmail=@guestEmail)
			SELECT 'True';
			ELSE
			SELECT 'False';
	END