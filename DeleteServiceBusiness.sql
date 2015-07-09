--DELETING FROM SERVICE BUSINESS TABLE---
CREATE PROCEDURE Adm.procDeleteServiceBusiness
							 @serviceId  AS INT
	AS
		BEGIN
			DELETE FROM Adm.ServiceOrBusiness WHERE serviceId=@serviceId;
		END

	