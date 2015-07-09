Alter PROC Adm.SelectProfile 
			@userName AS NVARCHAR(50)
	AS
	BEGIN
		SELECT userName,firstName,MI,lastName,address,city,state,
				zipCode,phoneNo,alternatePhoneNo,email,HidePhone,HideEmail,userId
			FROM Adm.Registration
				WHERE userName=@userName;
--FOR SERVICE RELOAD
	DECLARE @UserId AS INT;
	SET @UserId=(SELECT userId FROM Adm.Registration WHERE userName=@userName);

	IF EXISTS(SELECT * FROM Adm.ServiceOrBusiness WHERE userId=@UserId)
		SELECT serBusiness,description,serviceId FROM Adm.ServiceOrBusiness WHERE userId=@UserId;
		ELSE
		SELECT 'False';
	END

