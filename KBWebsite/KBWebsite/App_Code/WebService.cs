using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }


    [WebMethod]
    public string FetchOneCustomer(string IssueID)
    {
        string sql = "SELECT County.FIPS, County.StateCounty, County.State, County.County, [IDIssue]," +
                     "[FIPSCounty] ,[IDProcessingType],[IDFileType] ,[IDIssueType] ,isnull([Edition],'') as Edition ,isnull([Version],'') as Version,[Title]," +
                     "[IssueDetails] ,[Resolution] ,[Submitter],case([Relatedlink]) when '' then null else [Relatedlink] end  as Relatedlink   ,isnull([ICP],'') as ICP,[IssueCreatedDate],[IssueCreatedUser]," +
                     "[IssueUpdatedDate],[IssueUpdatedUser],[Isuplodedfile] ,[IDuploadedfile] FROM " +
                     " County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty where IDissue=" + IssueID;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds.GetXml();
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    [WebMethod]
    public string getstatefromfips(string fips)
    {
        try
        {
        string sql = "select state,county from county where fips='" + fips + "'";
        SqlDataAdapter da = new SqlDataAdapter(sql, System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString());
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0].Rows[0]["state"].ToString() + ";" + ds.Tables[0].Rows[0]["county"].ToString();
        }
        catch (Exception ex)
        {
            return "";
        }
    }
}

