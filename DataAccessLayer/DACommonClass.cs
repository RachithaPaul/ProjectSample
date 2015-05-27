using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
//using Microsoft.
namespace DataAccessLayer
{
   public  class DACommonClass:DABasic
    {
       DABasic basicClass=new DABasic();
       SqlConnection con=new SqlConnection();
             //Insert datas

       public int insertUpdateDelete(string spName, SqlParameter[] sqlParam)
       {
           int returnValue = 0;
           con = basicClass.getConnection();
           con.Open();
           SqlCommand cmd = new SqlCommand(spName,con);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddRange(sqlParam);
           returnValue = Convert.ToInt32(cmd.ExecuteNonQuery());
           return returnValue;
       }
       public string userExists(string spName1, SqlParameter[] sqlParam1)
       {
           string returnvalue = string.Empty;
           con = basicClass.getConnection();
           con.Open();
           SqlCommand cmd = new SqlCommand(spName1, con);
           cmd.CommandType = CommandType.StoredProcedure;
       
           cmd.Parameters.AddRange(sqlParam1);
           returnvalue = cmd.ExecuteScalar().ToString();
           return returnvalue;

       }
       public DataTable getDataForDDL(string spName)
       {
           DataTable dtTable = new DataTable();
           con = basicClass.getConnection();
           con.Open();
           SqlCommand cmd = new SqlCommand(spName,con);
           cmd.CommandType = CommandType.StoredProcedure;
           SqlDataAdapter da = new SqlDataAdapter(cmd);
           da.Fill(dtTable);
           return dtTable;
       }
       public DataSet selectData(string spName,SqlParameter[] sqlParam)
       {
           DataSet ds = new DataSet();
           con = basicClass.getConnection();
           con.Open();
           SqlCommand cmd = new SqlCommand(spName, con);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddRange(sqlParam);
           SqlDataAdapter da = new SqlDataAdapter(cmd);
          // da.SelectCommand = cmd;
           da.Fill(ds);
           // int i=ds.Tables.Count;
           return ds;
       }
    }
}
