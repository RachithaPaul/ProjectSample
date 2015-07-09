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
        DataTable dt=new DataTable();
        DataRow dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    Panel1.Visible = true;
                    fillDDL();
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
                    if (Convert.ToInt32(ds.Tables[0].Rows[0][11]) == 1)
                    {
                        chkPh.Checked = true;
                    }
                    else
                    {
                        chkPh.Checked = false;
                    }
                    if (Convert.ToInt32(ds.Tables[0].Rows[0][12]) == 1)
                    {
                        chkEm.Checked = true;
                    }
                    else
                    {
                        chkEm.Checked = false;
                    }
                    hdfUserID.Value = ds.Tables[0].Rows[0][13].ToString();
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
                       // DataTable dt = new DataTable();
                       // DataRow dr;
                        dt.Columns.Add("Services", typeof(string));
                        dt.Columns.Add("Description", typeof(string));
                        dt.Columns.Add("ServiceId",typeof(Int32));
                        if (rowCount > 0)
                        {
                            for (int i = 0; i < rowCount; i++)
                            {
                                dr = dt.NewRow();
                                dr["Services"] = ds.Tables[1].Rows[i][0].ToString();
                                dr["Description"] = ds.Tables[1].Rows[i][1].ToString();
                                dr["ServiceId"] = ds.Tables[1].Rows[i][2].ToString();
                                dt.Rows.Add(dr);
                            }
                            grdView.DataSource = dt;
                            grdView.DataBind();
                            Session["dtTable"] = dt;
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
            chkPh.Enabled = true;
           
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
             chkEm.Enabled = true;
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
                    blReg._userId =Convert.ToInt32(hdfUserID.Value);
                    serviceBusiness();
                    blReg.insertregistrationandServices(2);// insertregistrationandServices(2);

                   // ClearAll();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Updated", "alert('Profile updated!');", true);
                }
            }
        }
        protected void chkServices_CheckedChanged(object sender, EventArgs e)
        {
            if (chkServices.Checked == true)
            {
                upServices.Visible = true;
                if (Session["dtTable"] != null)
                {
                    dt = (DataTable)Session["dtTable"];
                    grdView.DataSource = dt;
                    grdView.DataBind();
                }

            }
            else
            {
                ddlService.Items.Clear();
                fillDDL();
                txtDescription.Text = string.Empty;
                if (Session["dtTable"] != null)
                {
                    dt = (DataTable)Session["dtTable"];
                    //dt.Clear();
                    grdView.DataSource = dt;
                    grdView.DataBind();
                }

                upServices.Visible = false;
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
       

        protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ibtnDel = (ImageButton)sender;
            GridViewRow row = (GridViewRow)ibtnDel.NamingContainer;
            int rowIndex = row.RowIndex;
            if (grdView.DataKeys[rowIndex].Values[0] is DBNull)
            {
                if (Session["dtTable"] != null)
                {
                    dt = (DataTable)Session["dtTable"];
                    dt.Rows.Remove(dt.Rows[rowIndex]);
                    grdView.DataSource = dt;
                    grdView.DataBind();
                }
            }
            else
            {
                Int32 serviceId = Convert.ToInt32(grdView.DataKeys[rowIndex].Values[0]);
                blReg._serviceID = serviceId;
                blReg.DeleteServiceBusiness();
                dt = (DataTable)Session["dtTable"];
                dt.Rows.Remove(dt.Rows[rowIndex]);
                grdView.DataSource = dt;
                grdView.DataBind();
            }
        }

        protected void grdView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdView.EditIndex = e.NewEditIndex;
            dt = (DataTable)Session["dtTable"];
            grdView.DataSource = dt;
            grdView.DataBind();
        }
        protected void grdView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdView.EditIndex = -1;
            dt = (DataTable)Session["dtTable"];
            grdView.DataSource = dt;
            grdView.DataBind();
        }
        #region Methods
        public void serviceBusiness()
        {
            DataTable dtService = new DataTable();
            DataRow drService;

            dtService.Columns.Add("Service",typeof(string));
            dtService.Columns.Add("Description",typeof(string));
            dtService.Columns.Add("ServiceId",typeof(int));
            int grdrowCount = grdView.Rows.Count;
            if (grdrowCount > 0)
            {
                for (int i = 0; i < grdrowCount; i++)
                {
                    drService = dtService.NewRow();

                    TextBox txtSerBussiness = (TextBox)grdView.Rows[i].Cells[0].FindControl("txtService");
                    TextBox txtDes = (TextBox)grdView.Rows[i].Cells[1].FindControl("txtGrdDescription");

                    // HiddenField hdfSeviceId = (HiddenField)grdView.Rows[i].Cells[2].FindControl("hdfServiceID");
                    drService["Service"] = txtSerBussiness.Text;
                    drService["Description"] = txtDes.Text;
                   // TextBox1.Text = hdfSeviceId.Value;
                    if (grdView.DataKeys[i].Values[0] is DBNull)
                    {
                        drService["ServiceId"] =DBNull.Value;
                    }
                    else
                    {
                        drService["ServiceId"] = Convert.ToInt32(grdView.DataKeys[i].Values[0]);
                    }
                    dtService.Rows.Add(drService);
                    //Passing value to BusinessLayer
                    blReg._dtServiceOrBusinessUpdate = dtService;
                    
                }
            }
        }
        public void fillDDL()
        {
            ddlService.DataSource = blReg.ServiceDDLFill();
            ddlService.DataBind();
        }

        public void Addbind()
        {
            if (Session["dtTable"] != null)
            {
                dt = (DataTable)Session["dtTable"];
              
            }
            else
            {
                dt.Columns.Add("Services", typeof(string));
                dt.Columns.Add("Description", typeof(string));
               dt.Columns.Add("ServiceId", typeof(Int32));
            }
            dr = dt.NewRow();
            dr["Services"] = ddlService.SelectedItem;
            dr["Description"] = txtDescription.Text;
            dr["ServiceId"] = System.DBNull.Value; ;
            dt.Rows.Add(dr);
            //or use the below code
            //  dt.Rows.Add(ddlService.SelectedItem;, txtDescription.Text);
            Session["dtTable"] = dt;

            grdView.DataSource = dt;
            grdView.DataBind();
            fillDDL();
            txtDescription.Text = string.Empty;
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

        protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ibtnEdit = (ImageButton)sender;
            GridViewRow row = (GridViewRow)ibtnEdit.NamingContainer;
        }
    }
 }

