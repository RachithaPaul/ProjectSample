using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
//using System.Web;
//using Excel = Microsoft.Office.Interop.Excel; 
namespace DataAccessLayer
{
    public class DABasic
    {
        string strConn = string.Empty;

        public enum Action
        {
            insert=1,
            update=2,
            Delete=3
        };
   
        public SqlConnection getConnection()
        {
            strConn = "Data Source=RACHITHA-PC\\SQLEXPRESS;Initial Catalog=CodeSample;Integrated Security=True";
            SqlConnection con=new SqlConnection(strConn);
            con.Open();
            return con;
        }
        public OleDbConnection getExcelConnection()
        {
          //  string excel = HttpContext.Current.Server.MapPath("App_Data\\Address.xlsx");
            // strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source="+ excel +";Extended Properties=Excel 12.0 Xml";
           strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\DataFolderRachitha\\ASP.NET\\ProjectSample\\ProjectSample\\App_Data\\Address.xlsx;Extended Properties='Excel 12.0 Xml;HDR=YES;'";

            OleDbConnection Ocon = new OleDbConnection(strConn);
            Ocon.Open();
            return Ocon;

        }
    }
}
 
