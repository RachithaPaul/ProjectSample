using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLayer
{
   public class blServices
    {
       DACommonClass daCommon = new DACommonClass();

       string serviceBusiness = string.Empty;

        #region Properties

       public string _serviceBusiness
       {
           get { return this.serviceBusiness; }
           set { this.serviceBusiness = value; }
       }
       public DataSet fillGrid()
       {
           SqlParameter[] sqlParam = new SqlParameter[1];
           sqlParam[0] = new SqlParameter("@serviceBusiness", _serviceBusiness);
           return daCommon.selectData("Adm.procDisplyServices", sqlParam);

       }
        #endregion
    }
}
