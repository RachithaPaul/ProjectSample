using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
namespace ProjectSample.PresentationLayer
{
    public partial class LogIn : System.Web.UI.Page
    {  blLogIn blLog = new blLogIn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUserName.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string returnValue = string.Empty;
            blLog._userName = txtUserName.Text.Trim();
            blLog._password = txtPassword.Text;
            returnValue = blLog.checkLoginDetails();
            if (returnValue == "True")
            {
                Session["User"] =returnValue;
                Session["UserName"] = txtUserName.Text.Trim();
                Label lblMasterLabel = (Label)Master.FindControl("lblUser");
                lblMasterLabel.Text = Session["UserName"].ToString();
                lblMessage.Text = string.Empty;
                Response.Redirect("Home.aspx");
                ClearAll();
                
            }
            else
            {
                Session["User"] = returnValue;
                lblMessage.Text = "Username or Password is wrong";
                ClearAll();
            }
            //Response.Redirect("Home.aspx");
        }
        public void ClearAll()
        {
           
            txtPassword.Text = string.Empty;
            txtUserName.Text = string.Empty;

        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

       
    }
}