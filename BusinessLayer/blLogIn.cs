using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLayer
{
  public  class blLogIn
    {
      DACommonClass daCommon = new DACommonClass();

      string userName = string.Empty;
      string password = string.Empty;
      string email=string.Empty;
       public string _userName
      {
          get{return this.userName;}
          set { this.userName = value; }
      }
       public string _password
       {
           get { return this.password; }
           set { this.password = value; }
       }
       public string _email
       {
           get { return this.email; }
           set { this.email = value; }
       }
       public string checkLoginDetails()
       {
           SqlParameter[] sqlParams=new SqlParameter[2];
           sqlParams[0] = new SqlParameter("@userName", _userName);
           sqlParams[1] = new SqlParameter("@password", _password);
           return daCommon.userExists("Adm.LoginCheck", sqlParams);


       }
       public int guestLogin(byte Action)
       {
           SqlParameter[] sqlParams = new SqlParameter[2];
           sqlParams[0] = new SqlParameter("@guestEmail",_email);
           if (Action == 1)
           {
               sqlParams[1] = new SqlParameter("@Action",DABasic.Action.insert);
           }
           else if (Action == 2)
           {
               sqlParams[1] = new SqlParameter("@Action",DABasic.Action.update);
           }
           return daCommon.insertUpdateDelete("Adm.procGusetLogin", sqlParams);
       }
       public string guestLoginCheck()
       {
           SqlParameter[] sqlParams = new SqlParameter[1];
           sqlParams[0] = new SqlParameter("@guestEmail", _email);
           return daCommon.userExists("Adm.procGuestEmailCheck", sqlParams);
       }
    }
}
