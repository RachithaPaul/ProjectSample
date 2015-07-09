using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSample
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                btnLogOut.Visible = true;
                btnLogin.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnLogOut_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            btnLogin.Visible = true;
            Response.Redirect("LogOut.aspx");

        }

        protected void btnGuest_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("GuestLogin.aspx");
        }
    }
   
}
