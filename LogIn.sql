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
				@password='rachitha1'