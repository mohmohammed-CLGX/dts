using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
//using System.Configuration.Assemblies;


namespace KBDAL
{
    class DBConnections
    {

        private string connString = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();
        //private string connString = DecryptString(System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString());
        private SqlConnection _sqlConnection;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _da;

        #region Constructor

        internal DBConnections()
        {
            _commandType = CommandType.StoredProcedure;
            _CommandBehavior = CommandBehavior.CloseConnection;
            _sqlConnection = new SqlConnection();
            _sqlCommand = new SqlCommand();
        }

        #endregion
        #region Public Properties

        private CommandType _commandType;
        internal CommandType CommandTypeToExecute
        {
            get { return _commandType; }
            set { _commandType = value; }
        }

        CommandBehavior _CommandBehavior;
        internal CommandBehavior CommandBehavior
        {
            get
            {
                return _CommandBehavior;
            }
            set
            {
                _CommandBehavior = value;
            }
        }

        private string _DBError = null;
        public string DBError
        {
            get { return _DBError; }
        }

        private string _commandText;
        public string CommandText
        {
            set { _commandText = value; _sqlCommand.CommandText = _commandText; }
        }

        private DataSet _dataSet;
        public DataSet DataSetContainer
        {
            get { return _dataSet; }
        }
        #endregion
        #region Connection Methods

        internal bool OpenConnection()
        {
            if (_sqlConnection.State == System.Data.ConnectionState.Open)
                return true;
            _sqlConnection.ConnectionString = connString;
            try
            {
                _sqlConnection.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public void CloseConnection()
        {
            if (_sqlConnection.State == System.Data.ConnectionState.Open || _sqlConnection.State == ConnectionState.Connecting || _sqlConnection.State == ConnectionState.Executing || _sqlConnection.State == ConnectionState.Fetching)
            {
                _sqlConnection.Close();
            }
        }

        #endregion

        #region Parameters

        public void ClearParameters()
        {
            _sqlCommand.Parameters.Clear();
        }
        internal void AddParameter(SqlParameter __Parameter)
        {
            _sqlCommand.Parameters.Add(__Parameter);
        }
        public void AddParameter(string __ParameterName, object __Value)
        {
            AddParameter(new SqlParameter(__ParameterName, __Value));
        }

        #endregion

        #region Sql Helper Functions

        internal void InitCommand()
        {
            if (!OpenConnection())
            {
                _DBError = "Unable to establish database connection. Please check your connection string";
            }
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandType = CommandTypeToExecute;
        }

        public object ExecuteScalar()
        {
            InitCommand();

            object resultVal = _sqlCommand.ExecuteScalar();
            CloseConnection();
            _sqlCommand.Parameters.Clear();
            return resultVal;
        }
        public int ExecuteNonQuery()
        {
            InitCommand();
            int resultVal = _sqlCommand.ExecuteNonQuery();
            CloseConnection();
            _sqlCommand.Parameters.Clear();
            return resultVal;
        }
        public DataSet GetDataSet(string _tableName)
        {
            InitCommand();
            _sqlCommand.CommandText = _commandText;
            _da = new SqlDataAdapter(_sqlCommand);
            _dataSet = new DataSet();
            _da.Fill(_dataSet, _tableName);
            CloseConnection();
            _sqlCommand.Parameters.Clear();
            return _dataSet;
        }
        public DataTable GetDataTable(string _tableName)
        {
            GetDataSet(_tableName);
            return DataSetContainer.Tables[_tableName];
        }
        #endregion
        #region DeCription

        public static string DecryptString(string encryptString)
        {
            return Decrypt(encryptString, "fLZhDiRa0AJpTgG/cFICNpJAj82N5Z5Arb6tbT8pwUs=");
        }

        private static string Decrypt(string InputText, string Password)
        {
            RijndaelManaged RijndaelCipher = new RijndaelManaged();
            byte[] EncryptedData = Convert.FromBase64String(InputText);
            byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
            PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
            ICryptoTransform Decryptor = RijndaelCipher.CreateDecryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
            MemoryStream memoryStream = new MemoryStream(EncryptedData);
            CryptoStream cryptoStream = new CryptoStream(memoryStream, Decryptor, CryptoStreamMode.Read);
            byte[] PlainText = new byte[EncryptedData.Length];
            int DecryptedCount = cryptoStream.Read(PlainText, 0, PlainText.Length);
            memoryStream.Close();
            cryptoStream.Close();
            string DecryptedData = Encoding.Unicode.GetString(PlainText, 0, DecryptedCount);
            return DecryptedData;
        }

        #endregion
    }

    public class DBConnectionsKB
    {
        private string connectionString;

        #region constructs
        public DBConnectionsKB()
            {
            // Get default connection string.
                connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();
            }
            public DBConnectionsKB(string connectionString)
            {
            // Set the specified connection string.
            this.connectionString = connectionString;
            }
        #endregion

            #region insertIssue
            /// <summary>
            /// Insertissue Function inserts a issue record into the Issue's table 
        /// </summary>
        /// <param name="objissue">object type issue</param>
        /// <returns></returns>
        public int InsertIssue(CIssue objissue)
        {

            int retval=0;

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertIssuetbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //command parameters for the Stored Procedure SPInsertIssuetbl
            cmd.Parameters.Add(new SqlParameter("@FIPSCounty", SqlDbType.VarChar, 5));
            cmd.Parameters["@FIPSCounty"].Value = objissue.FIPSCounty;

            cmd.Parameters.Add(new SqlParameter("@IDProcessingType", SqlDbType.Int, 4));
            cmd.Parameters["@IDProcessingType"].Value = objissue.IDProcessingType;
            
            cmd.Parameters.Add(new SqlParameter("@IDFileType", SqlDbType.Int, 4));
            cmd.Parameters["@IDFileType "].Value = objissue.IDFileType ;

            cmd.Parameters.Add(new SqlParameter("@IDIssueType", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssueType"].Value = objissue.IDIssueType ;

            cmd.Parameters.Add(new SqlParameter("@Edition", SqlDbType.Int, 4));
            cmd.Parameters["@Edition"].Value = objissue.Edition ;

            cmd.Parameters.Add(new SqlParameter("@Version", SqlDbType.Int, 4));
            cmd.Parameters["@Version"].Value = objissue.Version ;

            cmd.Parameters.Add(new SqlParameter("@Title", SqlDbType.VarChar, 100));
            cmd.Parameters["@Title"].Value = objissue.Title;

            cmd.Parameters.Add(new SqlParameter("@IssueDetails", SqlDbType.VarChar, -1));
            cmd.Parameters["@IssueDetails"].Value = objissue.IssueDetails;

            cmd.Parameters.Add(new SqlParameter("@Resolution", SqlDbType.VarChar, -1));
            cmd.Parameters["@Resolution"].Value = objissue.Resolution;

             cmd.Parameters.Add(new SqlParameter("@Submitter", SqlDbType.VarChar, 50));
            cmd.Parameters["@Submitter"].Value = objissue.Submitter;

             cmd.Parameters.Add(new SqlParameter("@Relatedlink", SqlDbType.VarChar, -1));
            cmd.Parameters["@Relatedlink"].Value = objissue.Relatedlink;

            cmd.Parameters.Add(new SqlParameter("@ICP", SqlDbType.Int, 4));
            cmd.Parameters["@ICP"].Value = objissue.ICP;
	        
            cmd.Parameters.Add(new SqlParameter("@IssueCreatedDate", SqlDbType.DateTime));
            cmd.Parameters["@IssueCreatedDate"].Value = objissue.IssueCreatedDate;
	 
	        cmd.Parameters.Add(new SqlParameter("@IssueCreatedUser", SqlDbType.Int, 4));
            cmd.Parameters["@IssueCreatedUser"].Value = objissue.IssueCreatedUser;
	        
            cmd.Parameters.Add(new SqlParameter("@IssueUpdatedDate", SqlDbType.DateTime));
            cmd.Parameters["@IssueUpdatedDate"].Value = objissue.IssueUpdatedDate;
            
            cmd.Parameters.Add(new SqlParameter("@IssueUpdatedUser ", SqlDbType.Int, 4));
            cmd.Parameters["@IssueUpdatedUser"].Value = objissue.IssueUpdatedUser ;

             cmd.Parameters.Add(new SqlParameter("@Isuplodedfile", SqlDbType.Bit));
            cmd.Parameters["@Isuplodedfile"].Value = objissue.Isuplodedfile ;

	
	        cmd.Parameters.Add(new SqlParameter("@IDuploadedfile", SqlDbType.Int, 4));
            cmd.Parameters["@IDuploadedfile"].Value = objissue.IDuploadedfile;


            cmd.Parameters.Add(new SqlParameter("@IDIssue", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssue"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                retval = (int)cmd.Parameters["@IDIssue"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {
                
                con.Close();
                
            }
            return retval;

        }
#endregion 


        #region insert Faqs

        /// <summary>
        /// function to insert record into faq table 
        /// </summary>
        /// <param name="strFaqs"> Faq </param>
        /// <param name="strFaqsans"> Faq Answer  </param>
        /// <param name="dtCreateddate">created date can be NOW</param>
        /// <param name="iCreateduser">current user</param>
        /// <returns> Faq ID</returns>
        public int insertFaqs(string strFaqs,string strFaqsans,DateTime dtCreateddate,int iCreateduser)
        {
            int retval=0;
              SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertfaqtbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@IDFaq", SqlDbType.Int, 4));
                cmd.Parameters["@IDFaq"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(new SqlParameter("@Faqs", SqlDbType.VarChar, -1));
                cmd.Parameters["@Faqs"].Value = strFaqs;
                cmd.Parameters.Add(new SqlParameter("@Faqsans", SqlDbType.VarChar, -1));
                cmd.Parameters["@Faqsans"].Value = strFaqsans;
                cmd.Parameters.Add(new SqlParameter("@Createddate", SqlDbType.DateTime));
                cmd.Parameters["@Createddate"].Value = dtCreateddate;
                cmd.Parameters.Add(new SqlParameter("@Createduser", SqlDbType.Int, 4));
                cmd.Parameters["@Createduser"].Value = iCreateduser;
            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
                cmd.Parameters["@Updateddate"].Value = System.Data.SqlTypes.SqlDateTime.Null;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
                cmd.Parameters["@Updateduser"].Value = System.Data.SqlTypes.SqlInt32.Null;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    retval = (int)cmd.Parameters["@IDFaq"].Value;
                }
                catch (SqlException err)
                {
                    retval = -1;
                }
                finally
                {

                    con.Close();

                }
                return retval;





        }
        #endregion
        public int updateFaqs(int IDFaq, string Faqs, string Faqsans)
        {
           
            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPUpdatefaqtbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDFaq", SqlDbType.Int, 4));
            cmd.Parameters["@IDFaq"].Value = IDFaq;

            cmd.Parameters.Add(new SqlParameter("@Faqs", SqlDbType.VarChar, -1));
            cmd.Parameters["@Faqs"].Value = Faqs;
            cmd.Parameters.Add(new SqlParameter("@Faqsans", SqlDbType.VarChar, -1));
            cmd.Parameters["@Faqsans"].Value = Faqsans;

            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
            cmd.Parameters["@Updateddate"].Value = DateTime.Now;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
            cmd.Parameters["@Updateduser"].Value = 120;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                //  retval = (int)cmd.Parameters["@IDProcessingType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
        public void deleteFaqs(int IDFaq)
        {


            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPDeletefaqtbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDFaq", SqlDbType.Int, 4));
            cmd.Parameters["@IDFaq"].Value = IDFaq;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }

        }

        #region insert FileType
        /// <summary>
        /// function to insert record into FileType table 
        /// </summary>
        /// <param name="strFileType">File Type </param>
        /// <param name="strFileTypeDescription">Description</param>
        /// <param name="dtCreateddate">created date can be NOW</param>
        /// <param name="iCreateduser">current user</param>
        /// <returns></returns>
        public int insertFileType(string strFileType, string strFileTypeDescription, DateTime dtCreateddate, int iCreateduser)
        {
               	
            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertFileType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDFileType", SqlDbType.Int, 4));
            cmd.Parameters["@IDFileType"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add(new SqlParameter("@FileType", SqlDbType.VarChar, 100));
            cmd.Parameters["@FileType"].Value = strFileType;
            cmd.Parameters.Add(new SqlParameter("@FileTypeDescription", SqlDbType.VarChar, 150));
            cmd.Parameters["@FileTypeDescription"].Value = strFileTypeDescription;
            cmd.Parameters.Add(new SqlParameter("@Createddate", SqlDbType.DateTime));
            cmd.Parameters["@Createddate"].Value = dtCreateddate;
            cmd.Parameters.Add(new SqlParameter("@Createduser", SqlDbType.Int, 4));
            cmd.Parameters["@Createduser"].Value = iCreateduser;
            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
            cmd.Parameters["@Updateddate"].Value = System.Data.SqlTypes.SqlDateTime.Null;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
            cmd.Parameters["@Updateduser"].Value = System.Data.SqlTypes.SqlInt32.Null;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                retval = (int)cmd.Parameters["@IDFileType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
        #endregion

        #region insert IssueType
        /// <summary>
        /// function to insert record into Issue Type table
        /// </summary>
        /// <param name="strIssueType">Issue Type</param>
        /// <param name="strIssueTypeDescription">Description</param>
        /// <param name="dtCreateddate">created date can be NOW</param>
        /// <param name="iCreateduser">current user</param>
        /// <returns></returns>
        public int insertIssueType(string strIssueType, string strIssueTypeDescription, DateTime dtCreateddate, int iCreateduser)
        {

            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertIssueTypetbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDIssueType", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssueType"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add(new SqlParameter("@IssueType", SqlDbType.VarChar, 150));
            cmd.Parameters["@IssueType"].Value = strIssueType;
            cmd.Parameters.Add(new SqlParameter("@IssueTypeDescription", SqlDbType.VarChar, 250));
            cmd.Parameters["@IssueTypeDescription"].Value = strIssueTypeDescription;
            cmd.Parameters.Add(new SqlParameter("@Createddate", SqlDbType.DateTime));
            cmd.Parameters["@Createddate"].Value = dtCreateddate;
            cmd.Parameters.Add(new SqlParameter("@Createduser", SqlDbType.Int, 4));
            cmd.Parameters["@Createduser"].Value = iCreateduser;
            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
            cmd.Parameters["@Updateddate"].Value = System.Data.SqlTypes.SqlDateTime.Null;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
            cmd.Parameters["@Updateduser"].Value = System.Data.SqlTypes.SqlInt32.Null;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                retval = (int)cmd.Parameters["@IDIssueType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
        #endregion

        #region insert ProcessingType
        /// <summary>
        /// function to insert record into Processing Type table
        /// </summary>
        /// <param name="strProcessingType">Processing Type</param>
        /// <param name="strProcessingTypeDescription">Description</param>
        /// <param name="dtCreateddate">created date can be NOW</param>
        /// <param name="iCreateduser">current user</param>
        /// <returns></returns>
        public int insertProcessingType(string strProcessingType, string strProcessingTypeDescription, DateTime dtCreateddate, int iCreateduser)
        {


            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertProcessingType", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDProcessingType", SqlDbType.Int, 4));
            cmd.Parameters["@IDProcessingType"].Direction = ParameterDirection.Output;

            cmd.Parameters.Add(new SqlParameter("@ProcessingType", SqlDbType.VarChar, 150));
            cmd.Parameters["@ProcessingType"].Value = strProcessingType;
            cmd.Parameters.Add(new SqlParameter("@ProcessingTypeDescription", SqlDbType.VarChar, 250));
            cmd.Parameters["@ProcessingTypeDescription"].Value = strProcessingTypeDescription;
            cmd.Parameters.Add(new SqlParameter("@Createddate", SqlDbType.DateTime));
            cmd.Parameters["@Createddate"].Value = dtCreateddate;
            cmd.Parameters.Add(new SqlParameter("@Createduser", SqlDbType.Int, 4));
            cmd.Parameters["@Createduser"].Value = iCreateduser;
            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
            cmd.Parameters["@Updateddate"].Value = System.Data.SqlTypes.SqlDateTime.Null;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
            cmd.Parameters["@Updateduser"].Value = System.Data.SqlTypes.SqlInt32.Null;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                retval = (int)cmd.Parameters["@IDProcessingType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
        #endregion
        public int updateProcessingType(int IDProcessingType,string ProcessingType, string ProcessingTypeDescription)
        {
            
            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPUpdateProcessingTypetbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.Add(new SqlParameter("@IDProcessingType", SqlDbType.Int, 4));
             cmd.Parameters["@IDProcessingType"].Value = IDProcessingType;

            cmd.Parameters.Add(new SqlParameter("@ProcessingType", SqlDbType.VarChar, 150));
            cmd.Parameters["@ProcessingType"].Value = ProcessingType;
            cmd.Parameters.Add(new SqlParameter("@ProcessingTypeDescription", SqlDbType.VarChar, 250));
            cmd.Parameters["@ProcessingTypeDescription"].Value = ProcessingTypeDescription;
            
            cmd.Parameters.Add(new SqlParameter("@Updateddate", SqlDbType.DateTime));
            cmd.Parameters["@Updateddate"].Value = DateTime.Now;
            cmd.Parameters.Add(new SqlParameter("@Updateduser", SqlDbType.Int, 4));
            cmd.Parameters["@Updateduser"].Value = 120;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
              //  retval = (int)cmd.Parameters["@IDProcessingType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
        public void deleteProcessingType(int IDProcessingType)
        {

           
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPDeleteProcessingTypetbl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDProcessingType", SqlDbType.Int, 4));
            cmd.Parameters["@IDProcessingType"].Value = IDProcessingType;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }

        }
        #region Get Issue with ID
        /// <summary>
        /// Function to retrieve issue record with issue ID
        /// </summary>
        /// <param name="idissue">ID Issue</param>
        /// <returns></returns>

        public CIssue getIssuerecord(int idissue)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPIssueDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDIssue", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssue"].Value = idissue;
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);
                // Check if the query returned a record.
                if (!reader.HasRows) return null;
                // Get the first row.
                reader.Read();
                CIssue objissue = new CIssue();
                

                objissue.IDIssue=(int)reader["IDIssue"];
                objissue.FIPSCounty=(string)reader["FIPSCounty"];
                objissue.County=(string)reader["County"];
                objissue.State=(string)reader["State"];
                objissue.FileType=(string)reader["FileType"];
                objissue.IssueType=(string)reader["IssueType"];
                objissue.ProcessingType=(string)reader["ProcessingType"];
                objissue.Edition=(int)reader["Edition"];
                objissue.Version=(int)reader["Version"];
                objissue.Title=(string)reader["Title"];
                objissue.IssueDetails=(string)reader["IssueDetails"];
                objissue.Resolution=(string)reader["Resolution"];
                objissue.Submitter=(string)reader["Submitter"];
                objissue.Relatedlink=(string)reader["Relatedlink"];
                objissue.ICP=(int)reader["ICP"];
                objissue.IssueCreatedDate=(DateTime)reader["IssueCreatedDate"];
                reader.Close();
                return objissue;
            }
            catch (SqlException err)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
        
        public DataTable getIssueTable()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPIssueDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDIssue", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssue"].Value = 0;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            // Fill the DataSet.
            try
            {
                da.Fill(ds, "Issue");
                da.Dispose();

                return ds.Tables["Issue"];
            }
            catch
            {
                return null;
            }
        }

        public List<CIssue> getIssueslist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPIssueDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDIssue", SqlDbType.Int, 4));
            cmd.Parameters["@IDIssue"].Value = 0;
            myConnection.Open();
            try
            {
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<CIssue> results = new List<CIssue>();
            while (reader.Read())
            {
                CIssue objCIssue = new CIssue();
               
            //    Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,
            //   IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, 
            //   Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,
            //Issuetbl.ICP,Issuetbl.IssueCreatedDate 
                objCIssue.IDIssue = Convert.ToInt32(reader["IDIssue"]);
                objCIssue.FIPSCounty = reader["FIPSCounty"].ToString();
                objCIssue.County = reader["County"].ToString();
                objCIssue.State = reader["State"].ToString();
                objCIssue.FileType = reader["FileType"].ToString();
                objCIssue.IssueType = reader["IssueType"].ToString();
                objCIssue.ProcessingType = reader["ProcessingType"].ToString();
                objCIssue.Edition = Convert.ToInt32(reader["Edition"]);
                objCIssue.Version = Convert.ToInt32(reader["Version"]);
                objCIssue.Title = reader["Title"].ToString();
                objCIssue.IssueDetails = reader["IssueDetails"].ToString();
                objCIssue.Resolution = reader["Resolution"].ToString();
                objCIssue.Submitter = reader["Submitter"].ToString();
                objCIssue.Relatedlink = reader["Relatedlink"].ToString();
                objCIssue.ICP = Convert.ToInt32(reader["ICP"]);
                objCIssue.IssueCreatedDate =Convert.ToDateTime( reader["IssueCreatedDate"].ToString());
                //if (reader["objCIssue"].Equals(DBNull.Value))
                //    objCIssue.UnitPrice = 0;

                results.Add(objCIssue);
            }
            reader.Close();
            myConnection.Close();
            return results;
            }
            catch( Exception ex)
            {
                return null;
            }
        }
        public List<CCounty> getStatelist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPStatedistinctDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CCounty> results = new List<CCounty>();
                while (reader.Read())
                {

                    CCounty objCCounty = new CCounty();
                    //objCCounty.FIPS = Convert.ToInt32(reader["IDFileType"]);
                 //   objCCounty.FIPS = reader["FIPS"].ToString();
                    objCCounty.State = reader["State"].ToString();
                  //  objCCounty.County = reader["County"].ToString();
                  //  objCCounty.StateCounty = reader["StateCounty"].ToString();



                    results.Add(objCCounty);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<CCounty> getCountylist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPCountyDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CCounty> results = new List<CCounty>();
                while (reader.Read())
                {

                    CCounty objCCounty = new CCounty();
                    //objCCounty.FIPS = Convert.ToInt32(reader["IDFileType"]);
                    objCCounty.FIPS = reader["FIPS"].ToString();
                    objCCounty.State = reader["State"].ToString();
                    objCCounty.County = reader["County"].ToString();
                    objCCounty.StateCounty = reader["StateCounty"].ToString();

                    

                    results.Add(objCCounty);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        public List<CFaq> getfaqslist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPfaqDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CFaq> results = new List<CFaq>();
                while (reader.Read())
                {

                    CFaq objCFaq = new CFaq();
                    objCFaq.IDFaq = Convert.ToInt32(reader["IDFaq"]);
                    objCFaq.Faqs = reader["Faqs"].ToString();
                    objCFaq.Faqsans = reader["Faqsans"].ToString();

                    //objCFaq.Createddate = Convert.ToDateTime(reader["Createddate"].ToString());
                    //objCFaq.Createduser = Convert.ToInt32(reader["Createduser"]);
                    //objCFaq.Updateddate = Convert.ToDateTime(reader["Updateddate"].ToString());
                    //objCFaq.Updateduser = Convert.ToInt32(reader["Updateduser"]);

                    results.Add(objCFaq);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch
            {
                return null;
            }
        }


        public List<CFileType> getFileTypelist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPFileTypeDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CFileType> results = new List<CFileType>();
                while (reader.Read())
                {

                    CFileType objCFileType = new CFileType();
                    objCFileType.IDFileType = Convert.ToInt32(reader["IDFileType"]);
                    objCFileType.FileType = reader["FileType"].ToString();
                    objCFileType.FileTypeDescription = reader["FileTypeDescription"].ToString();

                    //objCFileType.Createddate = Convert.ToDateTime(reader["Createddate"].ToString());
                    //objCFileType.Createduser = Convert.ToInt32(reader["Createduser"]);
                    //objCFileType.Updateddate = Convert.ToDateTime(reader["Updateddate"].ToString());
                    //objCFileType.Updateduser = Convert.ToInt32(reader["Updateduser"]);

                    results.Add(objCFileType);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        public List<CSubmitter> getSubmitterlist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPSubmitterDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CSubmitter> results = new List<CSubmitter>();
                while (reader.Read())
                {

                    CSubmitter objCSubmitter = new CSubmitter();
                    objCSubmitter.SubmitterID = Convert.ToInt32(reader["SubmitterID"]);
                    objCSubmitter.Name = reader["Name"].ToString();
                    objCSubmitter.UserLevel = reader["UserLevel"].ToString();



                    results.Add(objCSubmitter);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch
            {
                return null;
            }
        }
        public int insertSubmitter(string strFirstName, string strLastName, DateTime dtCreateddate, int UserLevel)
        {

            int retval = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPInsertSubmitter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@SubmitterID", SqlDbType.Int, 4));
            cmd.Parameters["@SubmitterID"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add(new SqlParameter("@Firstname", SqlDbType.VarChar, 50));
            cmd.Parameters["@Firstname"].Value = strFirstName;
            cmd.Parameters.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 50));
            cmd.Parameters["@LastName"].Value = strLastName;
            cmd.Parameters.Add(new SqlParameter("@Createddate", SqlDbType.DateTime));
            cmd.Parameters["@Createddate"].Value = dtCreateddate;
            cmd.Parameters.Add(new SqlParameter("@UserLevel", SqlDbType.Int, 4));
            cmd.Parameters["@UserLevel"].Value = UserLevel;
            
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                retval = (int)cmd.Parameters["@IDFileType"].Value;
            }
            catch (SqlException err)
            {
                retval = -1;
            }
            finally
            {

                con.Close();

            }
            return retval;





        }
     
        public List<CIssueType> getIssueTypelist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPIssueTypeDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CIssueType> results = new List<CIssueType>();
                while (reader.Read())
                {

                    CIssueType objCIssueType = new CIssueType();
                    objCIssueType.IDIssueType = Convert.ToInt32(reader["IDIssueType"]);
                    objCIssueType.IssueType = reader["IssueType"].ToString();
                    objCIssueType.IssueTypeDescription = reader["IssueTypeDescription"].ToString();

                    //objCIssueType.Createddate = Convert.ToDateTime(reader["Createddate"].ToString());
                    //objCIssueType.Createduser = Convert.ToInt32(reader["Createduser"]);
                    //objCIssueType.Updateddate = Convert.ToDateTime(reader["Updateddate"].ToString());
                    //objCIssueType.Updateduser = Convert.ToInt32(reader["Updateduser"]);

                    results.Add(objCIssueType);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch
            {
                return null;
            }
        }
        public List<CProcessingType> getCProcessingTypelist()
        {
            SqlConnection myConnection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPProcessingTypeDetails", myConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            myConnection.Open();
            try
            {
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                List<CProcessingType> results = new List<CProcessingType>();
                while (reader.Read())
                {

                    CProcessingType objCProcessingType = new CProcessingType();
                    objCProcessingType.IDProcessingType = Convert.ToInt32(reader["IDProcessingType"]);
                    objCProcessingType.ProcessingType = reader["ProcessingType"].ToString();
                    objCProcessingType.ProcessingTypeDescription = reader["ProcessingTypeDescription"].ToString();

                    //objCProcessingType.Createddate = Convert.ToDateTime(reader["Createddate"].ToString());
                    //objCProcessingType.Createduser = Convert.ToInt32(reader["Createduser"]);
                    //objCProcessingType.Updateddate = Convert.ToDateTime(reader["Updateddate"].ToString());
                    //objCProcessingType.Updateduser = Convert.ToInt32(reader["Updateduser"]);

                    results.Add(objCProcessingType);
                }
                reader.Close();
                myConnection.Close();
                return results;
            }
            catch
            {
                return null;
            }
        }
        public DataTable getFaqTable()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPfaqDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            // Fill the DataSet.
            try
            {
                da.Fill(ds, "Faq");
                da.Dispose();

                return ds.Tables["Faq"];
            }
            catch
            {
                return null;
            }
        }

        public DataTable getFileTypeTable()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPFileTypeDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            // Fill the DataSet.
            try
            {
                da.Fill(ds, "FileType");
                da.Dispose();

                return ds.Tables["FileType"];
            }
            catch
            {
                return null;
            }
        }
        public DataTable getIssueTypeTable()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPIssueTypeDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            // Fill the DataSet.
            try
            {
                da.Fill(ds, "IssueType");
                da.Dispose();

                return ds.Tables["IssueType"];
            }
            catch
            {
                return null;
            }
        }
        public DataTable getProcessingTypeTable()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SPProcessingTypeDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            // Fill the DataSet.
            try
            {
                da.Fill(ds, "ProcessingType");
                da.Dispose();

                return ds.Tables["ProcessingType"];
            }
            catch
            {
                return null;
            }
        }








    }
}
