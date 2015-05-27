using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
namespace ProjectSample.PresentationLayer
{
    public partial class Profile : System.Web.UI.Page
    {
        blRegistration blReg=new blRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    Panel1.Visible = true;
                    string x = Session["UserName"].ToString();
                    
                    Label lblMasterLabel = (Label)Master.FindControl("lblUser");
                    lblMasterLabel.Text = Session["UserName"].ToString();
                    blReg._userName = x;

                    DataSet ds = new DataSet();
                    ds = blReg.profileEdit();
                    txtUserName.Text = ds.Tables[0].Rows[0][0].ToString();
                    txtFirstName.Text = ds.Tables[0].Rows[0][1].ToString();
                    txtMInitial.Text = ds.Tables[0].Rows[0][2].ToString();
                    txtLastName.Text = ds.Tables[0].Rows[0][3].ToString();
                    txtAddress.Text = ds.Tables[0].Rows[0][4].ToString();
                    txtCity.Text = ds.Tables[0].Rows[0][5].ToString();
                    txtState.Text = ds.Tables[0].Rows[0][6].ToString();
                    txtZipcode.Text = ds.Tables[0].Rows[0][7].ToString();
                    txtPhoneNO.Text = ds.Tables[0].Rows[0][8].ToString();
                    txtAlternatePhone.Text = ds.Tables[0].Rows[0][9].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0][10].ToString();
                    hdfUserID.Value = ds.Tables[0].Rows[0][11].ToString();
                    hdfUserName.Value = txtUserName.Text;
                    //DataTable dt = new DataTable();
                    int rowCount = ds.Tables[1].Rows.Count;
                    string table2 = ds.Tables[1].Rows[0][0].ToString();
                    if (table2 == "False")
                    {
                        upServices.Visible = false;
                    }
                    else
                    {
                        DataTable dt = new DataTable();
                        DataRow dr;
                        dt.Columns.Add("Services", typeof(string));
                        dt.Columns.Add("Description", typeof(string));

                        if (rowCount > 0)
                        {
                            for (int i = 0; i < rowCount; i++)
                            {
                                dr = dt.NewRow();
                                dr["Services"] = ds.Tables[1].Rows[i][0].ToString();
                                dr["Description"] = ds.Tables[1].Rows[i][1].ToString();
                                dt.Rows.Add(dr);
                            }
                            grdView.DataSource = dt;
                            grdView.DataBind();
                        }
                    }
                }
                else
                {
                    Panel1.Visible = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ProfileAlert", "alert('Login to see the profile')", true);
                }
            }
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            txtUserName.Enabled = true;
            txtFirstName.Enabled = true;
            txtLastName.Enabled = true;
            txtMInitial.Enabled = true;
            txtAddress.Enabled = true;
            txtCity.Enabled = true;
            txtState.Enabled = true;
            txtZipcode.Enabled = true;
            txtPhoneNO.Enabled = true;
            txtAlternatePhone.Enabled = true;
           
            txtUserName.BackColor = System.Drawing.Color.White;
            txtFirstName.BackColor = System.Drawing.Color.White;
            txtMInitial.BackColor = System.Drawing.Color.White;
            txtLastName.BackColor = System.Drawing.Color.White;
            txtAddress.BackColor = System.Drawing.Color.White;
            txtCity.BackColor = System.Drawing.Color.White;
            txtState.BackColor = System.Drawing.Color.White;
            txtZipcode.BackColor = System.Drawing.Color.White;
            txtPhoneNO.BackColor = System.Drawing.Color.White;
            txtAlternatePhone.BackColor = System.Drawing.Color.White;
        }

        protected void btnEmail_Click(object sender, ImageClickEventArgs e)
        {  
             txtEmail.Enabled = true;
             txtConfirmEmail.Enabled=true;
             lblEmail.Visible = true;
             txtConfirmEmail.Visible = true;
             txtEmail.BackColor = System.Drawing.Color.White;
             txtConfirmEmail.BackColor = System.Drawing.Color.White;
        }

        protected void btnSavePersonalDetails_Click(object sender, ImageClickEventArgs e)
        {
            if (txtEmail.Enabled == false)
            {
                rfvConfirmEmail.Enabled = false;
            }
            if (Page.IsValid)
            {
                if (hdnUserNameExists.Value == "Not Available")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('User name not available!Try another user name!');", true);
                    return;
                }
                else if (hdnUserNameExists.Value == "Error occured try later!")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Error occured try later!');", true);
                }
                else
                {
                    blReg._userName = txtUserName.Text.Trim();
                    blReg._firstName = txtFirstName.Text;
                    blReg._MI = txtMInitial.Text;
                    blReg._lastName = txtLastName.Text;
                    blReg._address = txtAddress.Text;
                    blReg._city = txtCity.Text;
                    blReg._state = txtState.Text;
                    blReg._zipcode = txtZipcode.Text;
                    blReg._phoneNO = txtPhoneNO.Text;
                    blReg._alternatePhoneNO = txtAlternatePhone.Text;
                    blReg._email = txtEmail.Text;
                    serviceBusiness();
                    blReg.insertregistrationandServices(2);

                   // ClearAll();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Updated", "alert('Profile updated!');", true);
                }
            }
        }

        #region Methods
        public void serviceBusiness()
        {
            DataTable dtService = new DataTable();
            DataRow drService;

            dtService.Columns.Add("Service");
            dtService.Columns.Add("Description");

            int grdrowCount = grdView.Rows.Count;
            if (grdrowCount > 0)
            {
                for (int i = 0; i < grdrowCount; i++)
                {
                    drService = dtService.NewRow();
                    TextBox txtSerBussiness = (TextBox)grdView.Rows[i].Cells[0].FindControl("txtService");
                    TextBox txtDes = (TextBox)grdView.Rows[i].Cells[1].FindControl("txtGrdDescription");
                    drService["Service"] = txtSerBussiness.Text;
                    drService["Description"] = txtDes.Text;
                    dtService.Rows.Add(drService);
                    //Passing value to BusinessLayer
                    blReg._dtServiceOrBusiness = dtService;
                    
                }
            }
        }
        #endregion
        #region WebMethod

        [WebMethod(EnableSession = true)]
        public static string CheckUserName(string txtUName)
        {
            string returnValue = string.Empty;
            try
            {
                blRegistration bl = new blRegistration();
                bl._userName = txtUName.Trim().ToString();
                returnValue = bl.checkUsernameExists();

            }
            catch
            {
                returnValue = "ErrorOccured";
            }
           
            return returnValue;
        }
#endregion
    }
}