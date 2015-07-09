using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;
using System.Web.Services;
 

namespace ProjectSample.PresentationLayer
{
    public partial class Registration : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataRow dr;
        blRegistration blReg = new blRegistration();

#region PageEvents

        protected void Page_Load(object sender, EventArgs e)
        {
            //txtPassword.Attributes["type"] = "password";
            if (!IsPostBack)
            {
                txtPassword.Attributes["type"] = "password";
                txtConfirmPassword.Attributes["type"] = "password";
                if (Session["UserName"] != null)
                {
                    Label lblMasterLabel = (Label)Master.FindControl("lblUser");
                    lblMasterLabel.Text = Session["UserName"].ToString();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "registerAlert", "alert('Already registered!Check profile for editing.')", true);
                    //Panel1.Visible = false;
                }
               
                ClearAll();
                fillServiceDDL();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ddlService.SelectedItem.ToString() == "-Select-")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ddlAlert", "alert('Please select an option from Services/Business ')", true);
            }
            else
            {
                Addbind();
            }
        }
        protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
        {
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
                    blReg._firstName = txtFirstName.Text.Trim();
                    if (txtMInitial.Text.Trim() == string.Empty)
                    {
                        blReg._MI = null;
                    }
                    else
                    {
                        blReg._MI = txtMInitial.Text.Trim();
                    }
                    blReg._lastName = txtLastName.Text.Trim();
                    blReg._address = txtAddress.Text.Trim();
                    blReg._city = txtCity.Text.Trim();
                    blReg._state = txtState.Text.Trim();
                    blReg._zipcode = txtZipcode.Text.Trim();
                    blReg._phoneNO = txtPhoneNO.Text.Trim();
                    if (txtAlternatePhone.Text.Trim() == string.Empty)
                    {
                        blReg._alternatePhoneNO = null;
                    }
                    else
                    {
                        blReg._alternatePhoneNO = txtAlternatePhone.Text.Trim();
                    }
                    blReg._email = txtEmail.Text.Trim();
                    blReg._password = txtPassword.Text;
                    if (chkPh1.Checked == true)
                    {
                        blReg._hidePhone = 1;
                    }
                    else
                    {
                        blReg._hidePhone = 0;
                    }
                    if (chkEmail.Checked == true)
                    {
                        blReg._hideEmail = 1;
                    }
                    else
                    {
                        blReg._hideEmail = 0;
                    }
                    serviceBusiness();
                    blReg.insertregistrationandServices(1);

                    Session["User"] = "True";
                    Session["UserName"] = txtUserName.Text.Trim();
                    ClearAll();
                    upServices.Visible = false;
                    chkServices.Checked = false;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Saved", "RegistrationAlert();", true);


                }
            }
        }
        protected void chkServices_CheckedChanged(object sender, EventArgs e)
        {
          
            if (chkServices.Checked == true)
            {
                upServices.Visible = true;
                //   fillServiceDDL();
            }
            else
            {
                ddlService.Items.Clear();
                fillServiceDDL();
                txtDescription.Text = string.Empty;
                if (Session["dtTable"] != null)
                {
                    dt = (DataTable)Session["dtTable"];
                    int rows = dt.Rows.Count;
                    dt.Clear();

                    grdView.DataSource = dt;
                    grdView.DataBind();
                }
                //int rowcount = grdView.Rows.Count;
                //if (rowcount > 0)
                //{
                //    for (int i = 0; i < rowcount; i++)
                //    {
                //        ((TextBox)grdView.Rows[i].Cells[0].FindControl("txtService")).Text = string.Empty;
                //        ((TextBox)grdView.Rows[i].Cells[1].FindControl("txtGrdDescription")).Text = string.Empty;
                //    }
                //}
                upServices.Visible = false;
            }
           
        }
        protected void grdView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["dtTable"] != null)
            {
                dt = (DataTable)Session["dtTable"];
                int rowIndex = Convert.ToInt32(e.RowIndex);
                dt.Rows.Remove(dt.Rows[rowIndex]);
                grdView.DataSource = dt;
                grdView.DataBind();
            }
        }
 #endregion

 #region Methods

 //Clear all the fields

        public void ClearAll()
        {
            
            txtUserName.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtMInitial.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtState.Text = string.Empty;
            txtZipcode.Text = string.Empty;
            txtPhoneNO.Text = string.Empty;
            txtAlternatePhone.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtConfirmEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;


        }
        public void fillServiceDDL()
        {
            ddlService.DataSource = blReg.ServiceDDLFill();
            ddlService.DataBind();
        }
//Dynamically add row to gridView

        public void Addbind()
        {
            if (Session["dtTable"] != null)
            {
                dt = (DataTable)Session["dtTable"];
                //if (dt.Rows.Count > 0)
                //{
                //    for (int i = 0; i < dt.Rows.Count; i++)
                //    {
                //        TextBox txtSer = (TextBox)grdView.Rows[i].Cells[0].FindControl("txtService");
                //        TextBox txtDes = (TextBox)grdView.Rows[i].Cells[1].FindControl("txtGrdDescription");
                //    }
                //}
            }
            else
            {
                dt.Columns.Add("Services", typeof(string));
                dt.Columns.Add("Description", typeof(string));
            }
            dr = dt.NewRow();
            dr["Services"] = ddlService.SelectedItem;
            dr["Description"] = txtDescription.Text;
            dt.Rows.Add(dr);
            //or use the below code
            //  dt.Rows.Add(ddlService.SelectedItem;, txtDescription.Text);
            Session["dtTable"] = dt;

            grdView.DataSource = dt;
            grdView.DataBind();
            fillServiceDDL();
            txtDescription.Text = string.Empty;
        }

//Method for creating datatable dynamically and passing the value of the datatable to BusinessLayer

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
                    // Session["dtServiceBus"] = drService;
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
            // HttpContext.Current.Session["UserNameExists"] = returnValue;
            return returnValue;
        }
    #endregion

      

       
    }
}