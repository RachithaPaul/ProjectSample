using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using BusinessLayer;
namespace ProjectSample.PresentationLayer
{
    public partial class GuestLogin : System.Web.UI.Page
    {
        blLogIn  blLog = new blLogIn();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string returnValue = string.Empty;
            blLog._email = txtEmail.Text.Trim();
            returnValue = blLog.guestLoginCheck();
            if (returnValue == "True")
            {
                blLog.guestLogin(2);
            }
            else if (returnValue == "False")
            {
                blLog.guestLogin(1);
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Saved", "alert('Welcome Guest');", true);

        }
    }
}