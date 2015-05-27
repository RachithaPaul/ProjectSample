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
       public string checkLoginDetails()
       {
           SqlParameter[] sqlParams=new SqlParameter[2];
           sqlParams[0] = new SqlParameter("@userName", _userName);
           sqlParams[1] = new SqlParameter("@password", _password);
           return daCommon.userExists("Adm.LoginCheck", sqlParams);


       }
    }
}
