using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.Services;

using System.Data;

using System.Data.SqlClient;

using AjaxControlToolkit;

using System.Collections.Specialized;


/// <summary>
/// Summary description for statecounty
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

public class statecounty : System.Web.Services.WebService
{
    string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();

    public statecounty()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    [WebMethod]
    public CascadingDropDownNameValue[] CountryRegion(string knownCategoryValues, string category)
    {
        DataSet dsRegion = new DataSet();
        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = strconn;
        sqlCon.Open();
        string strStatement = "SELECT distinct  [State] FROM [kb].[dbo].[County] order by state";
        SqlDataAdapter SQLDataAdapter = new SqlDataAdapter(strStatement, sqlCon);
        SQLDataAdapter.Fill(dsRegion);

        //create list and add items in it
        //by looping through dataset table
        List<CascadingDropDownNameValue> regionNames = new List<CascadingDropDownNameValue>();
        try
        {
            foreach (DataRow dRow in dsRegion.Tables[0].Rows)
            {
                string strRegID = dRow["State"].ToString();
                string strRegName = dRow["State"].ToString();
                regionNames.Add(new CascadingDropDownNameValue(strRegName, strRegID));
            }
        }
        catch (Exception ex)
        { }
        sqlCon.Close();

        return regionNames.ToArray();
    }
 
    [WebMethod]
    public CascadingDropDownNameValue[] StateProvince(string knownCategoryValues, string category)
    {
        string StateID;
        //this string dictionary contains has table with key value pair of State and StateID
        StringDictionary StateValues = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString
                                        (knownCategoryValues);
        StateID = StateValues["State"];
        DataSet dsState = new DataSet();
       
        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = strconn;
        sqlCon.Open();
        string strStatement = "select * from [kb].[dbo].[County] where State='" + StateID + "'";
        SqlDataAdapter SQLDataAdapter = new SqlDataAdapter(strStatement, sqlCon);
        SQLDataAdapter.Fill(dsState);
        List<CascadingDropDownNameValue> StateNames = new List<CascadingDropDownNameValue>();
        try
        {
            foreach (DataRow dRow in dsState.Tables[0].Rows)
            {
                string strStateID = dRow["FIPS"].ToString();
                string strStateName = dRow["County"].ToString();
                StateNames.Add(new CascadingDropDownNameValue(strStateName, strStateID));
            }
        }
        catch (Exception ex)
        { }
        sqlCon.Close();
        return StateNames.ToArray();
    }

}

