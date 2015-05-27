using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLayer;
namespace ProjectSample
{
    /// <summary>
    /// Summary description for UserNameCheck
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class UserNameCheck : System.Web.Services.WebService
    {

        //[WebMethod]
        //public static string CheckUserName(string txtUName)
        //{
        //    // string returnValue=string.Empty;

        //    blRegistration bl = new blRegistration();
        //    bl._userName = txtUName.Trim();
        //    return bl.checkUsernameExists();

        //}
    }
}
