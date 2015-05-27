using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
  public class blRegistration
    {
      DACommonClass daCommon = new DACommonClass();

      string userName =string.Empty;
      string firstName=string.Empty;
      string MI=string.Empty;
      string lastName=string.Empty;
      string address=string.Empty;
      string city=string.Empty;
      string state=string.Empty;
      string zipcode=string.Empty;
      string phoneNo=string.Empty;
      string alternatePhoneNo=string.Empty;
      string email=string.Empty;
      string password=string.Empty;
      Int32 userId;

      //data table for inserting into service table

      private DataTable dtServiceOrBusiness;

      #region properties

      public string _userName
      {
          get { return this.userName; }
          set { this.userName = value; }
      }
      public string _firstName
      {
          get { return this.firstName; }
          set { this.firstName = value; }
      }
      public string _MI
      {
          get { return this.MI; }
          set { this.MI = value; }
      }
      public string _lastName
      {
          get { return this.lastName; }
          set { this.lastName = value; }
      }
      public string _address
      {
          get { return this.address; }
          set { this.address = value; }
      }
      public string _city
      {
          get { return this.city; }
          set { this.city = value; }
      }
      public string _state
      {
          get { return this.state; }
          set { this.state = value; }
      }
      public string _zipcode
      {
          get { return this.zipcode; }
          set { this.zipcode = value; }
      }
      public string _phoneNO
      {
          get { return this.phoneNo; }
          set { this.phoneNo = value; }
      }
      public string _alternatePhoneNO
      {
          get { return this.alternatePhoneNo; }
          set { this.alternatePhoneNo = value; }
      }
      public string _email
      {
          get { return this.email; }
          set { this.email = value; }
      }
      public string _password
      {
          get { return this.password; }
          set { this.password = value; }
      }
      public DataTable _dtServiceOrBusiness
      {
          get { return this.dtServiceOrBusiness; }
          set { this.dtServiceOrBusiness = value; }
      }
      public Int32 _userId
      {
          get { return this.userId; }
          set { this.userId = value; }
      }
    #endregion
      #region Methods
      
      public int insertregistrationandServices(byte Action)
      {
          SqlParameter[] sqlParam = new SqlParameter[15];
          sqlParam[0] = new SqlParameter("@userName",_userName);
          sqlParam[1]=new SqlParameter("@firstName",_firstName);
          sqlParam[2]=new SqlParameter("@MI",_MI);
          sqlParam[3]=new SqlParameter("@lastName",_lastName);
          sqlParam[4]=new SqlParameter("@address",_address);
          sqlParam[5]=new SqlParameter("@city",_city);
          sqlParam[6]=new SqlParameter("@state",_state);
          sqlParam[7]=new SqlParameter("@zipCode",_zipcode);
          sqlParam[8]=new SqlParameter("@phoneNo",_phoneNO);
          sqlParam[9]=new SqlParameter("@alternatePhoneNo",_alternatePhoneNO);
          sqlParam[10]=new SqlParameter("@email",_email);
          sqlParam[11]=new SqlParameter("@password",_password);
          sqlParam[12] = new SqlParameter("@dtServiceOrBusiness",_dtServiceOrBusiness);
          if (Action == 1)
          {
              sqlParam[13] = new SqlParameter("@Action", DABasic.Action.insert);
          }
          else if (Action == 2)
          {
              sqlParam[13] = new SqlParameter("@Action", DABasic.Action.update);
          }
          return daCommon.insertUpdateDelete("Adm.procInsertUpdateRegistrationandService", sqlParam);
      }
      public string checkUsernameExists()
      {
          SqlParameter[] sqlparam = new SqlParameter[1];
          sqlparam[0] = new SqlParameter("@userName",_userName);
          return daCommon.userExists("Adm.CheckUserNameExists", sqlparam);
      }
      public DataTable ServiceDDLFill()
      {
          return AddInitialValuetoDDL(daCommon.getDataForDDL("Adm.procServiceMain"),"-Select-");

      }
      public DataTable AddInitialValuetoDDL(DataTable serviceDt,string initialValue)
      {
          DataTable dt = new DataTable();
          dt.Columns.Add(serviceDt.Columns[0].Caption, serviceDt.Columns[0].DataType);
          dt.Columns.Add(serviceDt.Columns[1].Caption, serviceDt.Columns[1].DataType);
          dt.Rows.Add(0,initialValue);
          for (int i = 0; i < serviceDt.Rows.Count; i++)
          {
              dt.Rows.Add(serviceDt.Rows[i][0], serviceDt.Rows[i][1]);
          }
          return dt;
      }
      public DataSet profileEdit()
      {
          SqlParameter[] sqlparam = new SqlParameter[1];
          sqlparam[0] = new SqlParameter("@userName",_userName);
          return daCommon.selectData("Adm.SelectProfile",sqlparam);
      }
      #endregion
    }
}
