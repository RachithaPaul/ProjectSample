using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
//using Microsoft.
namespace DataAccessLayer
{
   public  class DACommonClass:DABasic
    {
       DataSet ds = new DataSet();

             //Insert datas

       public int insertUpdateDelete(string spName, SqlParameter[] sqlParam)
       {
           int returnValue = 0;
          
           try
           {
              
               SqlCommand cmd = new SqlCommand(spName, getConnection());
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.AddRange(sqlParam);
               returnValue = Convert.ToInt32(cmd.ExecuteNonQuery());
               return returnValue;
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               if (getConnection().State == ConnectionState.Open)
               {
                   getConnection().Close();
               }

           }
       }
       public string userExists(string spName1, SqlParameter[] sqlParam1)
       {
           string returnvalue = string.Empty;
           try
           {
              
               SqlCommand cmd = new SqlCommand(spName1, getConnection());
               cmd.CommandType = CommandType.StoredProcedure;

               cmd.Parameters.AddRange(sqlParam1);
               returnvalue = cmd.ExecuteScalar().ToString();

               return returnvalue;
           }
           catch (Exception ex)
           {
               throw ex;
           }
           finally
           {
               if (getConnection().State == ConnectionState.Open)
               {
                   getConnection().Close();
               }
           }
       }
       public DataTable getDataForDDL(string spName)
       {
           DataTable dtTable = new DataTable();
           SqlCommand cmd = new SqlCommand(spName,getConnection());
           cmd.CommandType = CommandType.StoredProcedure;
           SqlDataAdapter da = new SqlDataAdapter(cmd);
           da.Fill(dtTable);
           return dtTable;
       }
       public DataSet selectData(string spName,SqlParameter[] sqlParam)
       {
           DataSet ds = new DataSet();
          
           SqlCommand cmd = new SqlCommand(spName,getConnection());
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddRange(sqlParam);
           SqlDataAdapter da = new SqlDataAdapter(cmd);
           da.Fill(ds);
           return ds;
       }
       public DataSet excelDataset(string strSQLexcel)
       {
           OleDbCommand oledbCmd = new OleDbCommand(strSQLexcel,getExcelConnection());
           OleDbDataAdapter oledbDA = new OleDbDataAdapter(oledbCmd);
           oledbDA.Fill(ds);
           return ds;
       }
      
    }
}
