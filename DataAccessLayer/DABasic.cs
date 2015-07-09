using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

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
            return con;
        }
    }
}
