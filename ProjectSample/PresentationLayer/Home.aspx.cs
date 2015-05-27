using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
namespace ProjectSample
{
    public partial class Home : System.Web.UI.Page
    {
        blLogIn blLog = new blLogIn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)//If Session not NULL and Fasle we have to load the login page 
                {
                    string x = Session["User"].ToString();
                    if (x == "True")
                    {
                        Label lblMasterLabel = (Label)Master.FindControl("lblUser");
                        lblMasterLabel.Text = Session["UserName"].ToString();
                    }

                }
            }
        }

     
    }
}