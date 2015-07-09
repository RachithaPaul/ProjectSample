SELECT r.userId,R.firstName + COALESCE(N','+ R.MI, N'') + N', '+ R.lastName AS Name,
 S.description,S.serBusiness,r.phoneNo,r.alternatePhoneNo,r.email
FROM Adm.Registration AS R INNER JOIN
 Adm.ServiceOrBusiness AS S ON R.userId=S.userId
 WHERE s.serBusiness='Artist'
