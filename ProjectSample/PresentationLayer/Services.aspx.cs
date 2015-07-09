using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BusinessLayer;


namespace ProjectSample.PresentationLayer
{
    public partial class Services : System.Web.UI.Page
    {
        blRegistration blReg = new blRegistration();
        blServices blService = new blServices();
     #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillDDl();
            }
        }
        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            blService._serviceBusiness =Convert.ToString(ddlSearch.SelectedItem);
            gridBind();
        }
    #endregion

        #region Methods

        public void fillDDl()
        {
            ddlSearch.DataSource = blReg.ServiceDDLFill();
            ddlSearch.DataBind();
        }

        public void gridBind()
        {
            grdDisplay.DataSource = blService.fillGrid();
            grdDisplay.DataBind();
        }
        #endregion

        
    }
}