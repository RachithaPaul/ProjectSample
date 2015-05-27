using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSample.PresentationLayer
{
    public partial class Amenities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)//If Session not NULL and Fasle we have to load the login page 
            {
                string x = Session["User"].ToString();
                if (x == "False")
                {
                    Response.Redirect("LogIn.aspx");
                }
                else
                {
                    Label lblMasterLabel = (Label)Master.FindControl("lblUser");
                    lblMasterLabel.Text = Session["UserName"].ToString();
                }
               
            }
            else//If Session is null load Login Page
            {
                Response.Redirect("LogIn.aspx");
                
            }
           
        }
    }
}