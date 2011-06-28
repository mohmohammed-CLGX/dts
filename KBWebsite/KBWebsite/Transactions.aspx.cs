using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using KBDAL;

public partial class Transactions : System.Web.UI.Page
{
    //string strstatecounty;
    //string strfiletype;
    //string strcommenttype;
    string strconn ;
    protected void Page_Load(object sender, EventArgs e)
    {
        strconn = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();
        btnupdate.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnupdate.UniqueID, "");
        if (!IsPostBack)
        {
            bindrecentgv();
        }
        
        //GridView6.DataBind();
       // GridViewResult.DataBind();
        ddlstate_countynew.Attributes.Add("onchange", "return newstateselchange();");
        ddlfpisnew.Attributes.Add("onchange", "return newFipsselchange();");

       // ddlRecentFips.Attributes.Add("onchange", "return fipsselchangeRecent();");

        ddlFipssch.Attributes.Add("onchange", "return fipsselchange();");
        ddlcountysch1.Attributes.Add("onchange", "return countyselchange();");
     //   ddlRecentCounty.Attributes.Add("onchange", "return countyselchangeRecent();");
        chkstatesch.Attributes.Add("onclick", "return chkstate();");
        chkcountysch1.Attributes.Add("onclick", "return chkcounty();");
        chkFipssch.Attributes.Add("onclick", "return chkfips();");
        Button3.Attributes.Add("onclick", "OpenUrlLinks();return false;");
     //  Button3.Attributes.Add("OnClick", "OpenSearchResults('" + txtRelatedLinksnew.ClientID + "');");
        ddlstatesch.Attributes.Add("onchange", "stateselchange();");
        chkIssueTypesch.Attributes.Add("onclick", "Togglecheck('" + chkIssueTypesch.ClientID + "','" + ddlIssuetypesch.ClientID + "','yes');");
        chkFilesch.Attributes.Add("onclick", "Togglecheck('" + chkFilesch.ClientID + "','" + ddlFileTypesch.ClientID + "','yes');");
        chkProcessingsch.Attributes.Add("onclick", "Togglecheck('" + chkProcessingsch.ClientID + "','" + ddlProcessingsch.ClientID + "','yes');");
        chkEditionsch.Attributes.Add("onclick", "Togglecheck('" + chkEditionsch.ClientID + "','" + txtEditionsch.ClientID + "','no');");
        chkRelatedICPsch.Attributes.Add("onclick", "Togglecheck('" + chkRelatedICPsch.ClientID + "','" + txtRelatedICPsch.ClientID + "','no');");
        chkSubmittersch.Attributes.Add("onclick", "Togglecheck('" + chkSubmittersch.ClientID + "','" + txtSubmittersch.ClientID + "','no');");
        chkIssuedetailsch.Attributes.Add("onclick", "Togglecheck('" + chkIssuedetailsch.ClientID + "','" + txtchkIssuedetailsch.ClientID + "','no');");
        chkResolutionsch.Attributes.Add("onclick", "Togglecheck('" + chkResolutionsch.ClientID + "','" + txtResolutionsch.ClientID + "','no');");
     
    }
    DBConnectionsKB objdbkb = new DBConnectionsKB();

    #region recenttab
    protected void gvrecent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;

        // Get the selected index and the command name

        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        string _commandName = e.CommandName;

        switch (_commandName)
        {
            case ("SingleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                //this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                break;
            case ("DoubleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                string strid = _gridView.SelectedRow.Cells[2].Text;
                string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                            "Issuetbl.ICP,Issuetbl.IssueCreatedDate,Issuetbl.IssueCreatedUser FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                            "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                            "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                            "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType where Issuetbl.IDIssue=" + strid;

                SqlDataAdapter da;
                DataSet ds = new DataSet();

                try
                {

                    SqlConnection conn = new SqlConnection(strconn);
                    da = new SqlDataAdapter(strselect, conn);
                    da.Fill(ds);
                    da.Dispose();
                    PanelRecentissue.Visible = false;

                    //btnDummy_ModalPopupExtender.Show();


                }
                catch (Exception ex)
                {
                }

                //TabContainer1.ActiveTabIndex = 1;
                break;
        }
    }

    protected void gvrecent_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink HyperLink1 = (HyperLink)e.Row.Cells[0].Controls[0];

            HyperLink1.ImageUrl = "~/img/select.png";
            HyperLink1.ToolTip = "Detail view";
            HyperLink1.Attributes.Add("onclick", "ShowMyModalPopup('" + gvrecent.DataKeys[e.Row.RowIndex].Value + "')");
            // _singleClickButton.Attributes.Add("onclick", "ShowMyModalPopup('" + gvrecent.DataKeys[e.Row.RowIndex].Value + "')");
        }
    }

    protected void gvrecent_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        //    e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        //}
    }



    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string sql = "Update Issuetbl Set IDProcessingType=" + ddlpupptype.SelectedValue.ToString() +
                     ", IDFileType=" + ddlpupftype.SelectedValue.ToString() + " ,IDIssueType=" + ddlpupitype.SelectedValue.ToString() +
                     " ,Edition=" + txtpupEdition.Text + " ,Version=" + txtpupVersion.Text + " ,Title='" + txtpuptitle.Text +
                     "' ,IssueDetails='" + txtpupissue.Text + "' ,Resolution='" + txtpupresolution.Text +
                     "' ,Submitter='" + txtpupSubmitter.Text + "' ,Relatedlink='" + txtpuprlinks.Text +
                     "' ,ICP=" + txtpupicp.Text + " Where IDIssue=" + hidCusCode.Value;
        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            bindrecentgv();
        }
        catch (Exception ex)
        {

        }
    }

    protected void bindrecentgv()
    {
        string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, Issuetbl.Title," +
                "Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, " +
                "Issuetbl.IssueCreatedDate, Issuetbl.IssueCreatedUser FROM County " +
                " INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                " INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                " INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                " INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType";

        DataSet ds = new DataSet();
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(strsql, strconn);
            da.Fill(ds);
            da.Dispose();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvrecent.DataSource = ds.Tables[0];
                gvrecent.DataBind();
            }
            else
            {
                gvrecent.DataSource = ds.Tables[0].DefaultView;
                gvrecent.DataBind();
            }
        }
        catch (Exception ex)
        {
        }


    }


    protected void btnrecentgo_Click(object sender, EventArgs e)
    {
        if (ddlRecentState.SelectedValue != "" || txtRecentFromdt.Text != "")
        {
            string strstate = ddlRecentState.SelectedValue;
            string strfips = ddlRecentCounty.SelectedValue;
            string strfdate = txtRecentFromdt.Text;
            string strtdate = txtRecentTodt.Text;
            string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                           "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                           "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                        "Issuetbl.ICP,Issuetbl.IssueCreatedDate ,[IssueCreatedUser] FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                        "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                        "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                        "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType ";
            if (strstate != "" || strfips != "" || strfdate != "" || strtdate != "")
            {
                strsql = strsql + " where ";
            }

            if (strstate != "")
            {
                strsql = strsql + " county.state='" + strstate + "' and";
            }
            if (strfips != "")
            {
                strsql = strsql + " county.FIPS='" + strfips + "' and";
            }
            if (strfdate != "")
            {
                strsql = strsql + " Issuetbl.IssueCreatedDate>='" + strfdate + "' and Issuetbl.IssueCreatedDate<='" + strtdate + "'";
            }

            int stlen = strsql.Trim().Length;
            if (strsql.IndexOf("and") > 0)
            {
                if (strsql.Substring(stlen - 3, 3) == "and")
                    strsql = strsql.Substring(0, stlen - 3);
            }
            SqlDataAdapter da;
            DataSet ds = new DataSet();

            try
            {

                SqlConnection conn = new SqlConnection(strconn);
                da = new SqlDataAdapter(strsql, conn);
                da.Fill(ds);
                da.Dispose();
                gvrecent.DataSource = ds.Tables[0];
                gvrecent.DataBind();
               ddlRecentState.SelectedIndex=0;
               
              txtRecentFromdt.Text="";
              txtRecentTodt.Text="";


            }
            catch (Exception ex)
            {
            }

        }
        else
        {
        }
    }
    #endregion
    public DataTable getproc()
    {
        return objdbkb.getProcessingTypeTable();
    }
    protected void btnsave_Submit(object sender, EventArgs e)
    {
        Response.Write("testing submit");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        Response.Write("testing save");
    }
    protected void GridView5_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
            e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        }

    }
    protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;
        // Get the selected index and the command name
         int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        string _commandName = e.CommandName;

        switch (_commandName)
        {
            case ("SingleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                 //this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                break;
            case ("DoubleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                string str = _gridView.SelectedRow.Cells[2].Text;
                  
                ddlstate_countynew.SelectedIndex = ddlstate_countynew.Items.IndexOf(ddlstate_countynew.Items.FindByText(_gridView.SelectedRow.Cells[4].Text));
                ddlfpisnew.SelectedIndex = ddlfpisnew.Items.IndexOf(ddlfpisnew.Items.FindByText(_gridView.SelectedRow.Cells[5].Text));
                ddlProcessingtypenew.SelectedIndex = ddlProcessingtypenew.Items.IndexOf(ddlProcessingtypenew.Items.FindByText(_gridView.SelectedRow.Cells[6].Text.Replace("amp;","")));
                ddlFileTypenew.SelectedIndex = ddlFileTypenew.Items.IndexOf(ddlFileTypenew.Items.FindByText(_gridView.SelectedRow.Cells[7].Text));
                ddlIssueTypenew.SelectedIndex = ddlIssueTypenew.Items.IndexOf(ddlIssueTypenew.Items.FindByText(_gridView.SelectedRow.Cells[8].Text));
                txtTitlenew.Text = _gridView.SelectedRow.Cells[9].Text;
                txtIssueDetailsnew.Text = _gridView.SelectedRow.Cells[10].Text;
                txtResolutionnew.Text = _gridView.SelectedRow.Cells[11].Text;
                txtEditionnew.Text = _gridView.SelectedRow.Cells[12].Text;
                txtVersionnew.Text = _gridView.SelectedRow.Cells[13].Text;
                txtSubmitternew.Text = _gridView.SelectedRow.Cells[14].Text;
                txtRelatedLinksnew.Text = _gridView.SelectedRow.Cells[15].Text;
                txtICPnew.Text = _gridView.SelectedRow.Cells[16].Text;
                Panel2.GroupingText = "Details";
                Button1.Text = "Clear";
                TabContainer1.ActiveTabIndex = 2;
                break;
        }

    }
    protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the LinkButton control in the first cell
            LinkButton _singleClickButton = (LinkButton)e.Row.Cells[0].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsSingle = ClientScript.GetPostBackClientHyperlink(_singleClickButton, "");
            // To prevent the first click from posting back immediately 
            // (therefore giving the user a chance to double click) pause the 
            // postback for 300 milliseconds by using setTimeout
            _jsSingle = _jsSingle.Insert(11, "setTimeout(\"");
            _jsSingle += "\", 300)";
            // Add this javascript to the onclick Attribute of the row
            e.Row.Attributes["onclick"] = _jsSingle;
            // Get the LinkButton control in the second cell
            LinkButton _doubleClickButton = (LinkButton)e.Row.Cells[1].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsDouble = ClientScript.GetPostBackClientHyperlink(_doubleClickButton, "");
            // Add this javascript to the ondblclick Attribute of the row
            e.Row.Attributes["ondblclick"] = _jsDouble;
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Button1.Text == "Clear")
        {
            Button1.Text = "Submit";
            ddlstate_countynew.SelectedIndex = -1;
            ddlfpisnew.SelectedIndex = -1;
            ddlProcessingtypenew.SelectedIndex = -1;
            ddlFileTypenew.SelectedIndex = -1;
            ddlIssueTypenew.SelectedIndex = -1;
            txtTitlenew.Text = "";
            txtIssueDetailsnew.Text = "";
            txtResolutionnew.Text = "";
            txtEditionnew.Text = "";
            txtVersionnew.Text = "";
            txtSubmitternew.Text = "";
            txtRelatedLinksnew.Text = "";
            txtICPnew.Text = "";
            Panel2.GroupingText = "Add New";
           // GridView5.SelectedIndex = -1;
           // GridView5.DataBind();


        }
       
        string FIPSCounty = "00000";
        if (ddlstate_countynew.SelectedValue.ToString() == "NW")
        {
             FIPSCounty = "00000";

        }
        else if (ddlstate_countynew.SelectedValue.ToString() == "0")
        {
            if (ddlfpisnew.SelectedValue.ToString() != "0")
                FIPSCounty = ddlfpisnew.SelectedValue.ToString();
        }
        else
        {
            FIPSCounty = ddlstate_countynew.SelectedValue.ToString();
        }

        string IDProcessingType=ddlProcessingtypenew.SelectedValue.ToString();
        string IDFileType=ddlFileTypenew.SelectedValue.ToString();
        string IDIssueType=ddlIssueTypenew.SelectedValue.ToString();
        int test;
        string Edition="null";
        if(Int32.TryParse(txtEditionnew.Text,out test))
        Edition=txtEditionnew.Text;

        string strVersion = "null";
        if (Int32.TryParse(txtVersionnew.Text, out test))
            strVersion=txtVersionnew.Text;

        string Title=txtTitlenew.Text;
        string IssueDetails=txtIssueDetailsnew.Text;
        string Resolution=txtResolutionnew.Text;
        string Submitter=txtSubmitternew.Text;
        string Relatedlink=txtRelatedLinksnew.Text;

        string ICP = "null";
        if (Int32.TryParse(txtICPnew.Text, out test))
            ICP=txtICPnew.Text;
        string IssueCreatedDate=DateTime.Now.ToString("yyyy/MM/dd");
        string command = "insert into [Issuetbl](FIPSCounty,IDProcessingType,IDFileType,IDIssueType,Edition,Version,Title,IssueDetails,Resolution," +
                           "Submitter,Relatedlink,ICP,IssueCreatedDate,Isuplodedfile) " +
                             " Values('" + FIPSCounty + "'," + IDProcessingType + "," + IDFileType + "," + IDIssueType + "," + Edition+","+
                         strVersion + ",'" + Title + "','"+IssueDetails+ "','"+Resolution + "','"+Submitter+ "','"+Relatedlink+"',"+ICP+",'"+
                        IssueCreatedDate+"',0)";
    
        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(command, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            ddlstate_countynew.SelectedIndex = 0;

            ddlfpisnew.SelectedIndex = 0;
            ddlProcessingtypenew.SelectedIndex = 0;
            ddlFileTypenew.SelectedIndex = 0;
            ddlIssueTypenew.SelectedIndex = 0;
            txtEditionnew.Text = "N/A";
            txtVersionnew.Text = "N/A";
            txtTitlenew.Text = "";
            txtIssueDetailsnew.Text = "";
            txtResolutionnew.Text = "";
            txtICPnew.Text = "N/A";
            txtSubmitternew.Text = "";
            txtRelatedLinksnew.Text = "";
         
          //  GridView5.DataBind();
            //GridView6.DataBind();
            GridViewResult.DataBind();
            RecentIssuesgrid.DataBind();


        }
        catch (Exception ex)
        {
        }
    }





    protected void gridprocessingtype_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "InsertNew")
        {

            TextBox newtxtproctype = gridprocessingtype.FooterRow.FindControl("newtxtproctype") as TextBox;
            TextBox newtxtDescription = gridprocessingtype.FooterRow.FindControl("newtxtDescription") as TextBox;



            if (newtxtproctype.Text != string.Empty)
            {
                // lblerr.Text = "Enter All Fields";


                try
                {
                   // ProcessingTypeObjectDataSource.InsertParameters
                    ProcessingTypeObjectDataSource.InsertParameters["ProcessingType"].DefaultValue = newtxtproctype.Text;
                   ProcessingTypeObjectDataSource.InsertParameters["ProcessingTypeDescription"].DefaultValue = newtxtDescription.Text;

                    ProcessingTypeObjectDataSource.Insert();

                    gridprocessingtype.DataBind();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }
       protected void gridFileType_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "InsertNew")
        {

            TextBox newtxtfiletype = gridFileType.FooterRow.FindControl("newtxtfiletype") as TextBox;
            TextBox newtxtfileDescription = gridFileType.FooterRow.FindControl("newtxtfileDescription") as TextBox;



            if (newtxtfiletype.Text != string.Empty)
            {
                // lblerr.Text = "Enter All Fields";


                try
                {

                    SqlDataSourceFileType.InsertParameters["FileType"].DefaultValue = newtxtfiletype.Text;
                    SqlDataSourceFileType.InsertParameters["FileTypeDescription"].DefaultValue = newtxtfileDescription.Text;

                    SqlDataSourceFileType.Insert();

                    gridFileType.DataBind();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }
    protected void gridissuetype_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "InsertNew")
        {

            TextBox newtxtIssueType = gridissuetype.FooterRow.FindControl("newtxtIssueType") as TextBox;
            TextBox newtxtiDescription = gridissuetype.FooterRow.FindControl("newtxtiDescription") as TextBox;



            if (newtxtIssueType.Text != string.Empty)
            {
                // lblerr.Text = "Enter All Fields";


                try
                {

                    SqlDataSourceIssuetype.InsertParameters["IssueType"].DefaultValue = newtxtIssueType.Text;
                    SqlDataSourceIssuetype.InsertParameters["IssueTypeDescription"].DefaultValue = newtxtiDescription.Text;

                    SqlDataSourceIssuetype.Insert();

                    gridissuetype.DataBind();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }
    protected void gridfaq_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "InsertNew")
        {

            TextBox newtxtFaqs = gridfaq.FooterRow.FindControl("newtxtFaqs") as TextBox;
            TextBox newtxtFaqsans = gridfaq.FooterRow.FindControl("newtxtFaqsans") as TextBox;



            if (newtxtFaqs.Text != string.Empty)
            {
                // lblerr.Text = "Enter All Fields";


                try
                {
                    ////FaqObjectDataSource
                    //FaqObjectDataSource.InsertParameters["Faqs"].DefaultValue = newtxtFaqs.Text;
                    //FaqObjectDataSource.InsertParameters["Faqsans"].DefaultValue = newtxtFaqsans.Text;

                    //FaqObjectDataSource.Insert();
                    SqlDataSourcefaq.InsertParameters["Faqs"].DefaultValue = newtxtFaqs.Text;
                    SqlDataSourcefaq.InsertParameters["Faqsans"].DefaultValue = newtxtFaqsans.Text;

                    SqlDataSourcefaq.Insert();
                    

                    gridfaq.DataBind();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string strwhere=" where ";
        string strstate="";
        string strfips = "";
        if (chkstatesch.Checked)
        {
            strstate = ddlstatesch.SelectedValue;
            strwhere += "County.State='" + strstate + "' and ";

        }
        if (chkcountysch1.Checked)
        {
            strfips = ddlFipssch.SelectedItem.Text;
            strwhere += "Issuetbl.FIPSCounty='" + strfips + "' and ";
        }
        if (chkFipssch.Checked)
        {
            strfips = ddlFipssch.SelectedItem.Text;
            strwhere += "Issuetbl.FIPSCounty='" + strfips + "' and ";
        }

        if (chkIssueTypesch.Checked) { strwhere += "Issuetbl.IDIssueType=" + ddlIssuetypesch.SelectedValue + " and "; }


        if (chkFilesch.Checked) { strwhere += "Issuetbl.IDFileType=" + ddlFileTypesch.SelectedValue + " and "; }

        if (chkProcessingsch.Checked) { strwhere += "Issuetbl.IDProcessingType=" + ddlProcessingsch.SelectedValue + " and "; }
        if (chkEditionsch.Checked)
        {
            if (txtEditionsch.Text.Length > 0)
            {
                strwhere += "Issuetbl.Edition=" + txtEditionsch.Text.Split('/')[0] + " and ";
                strwhere += "Issuetbl.Version=" + txtEditionsch.Text.Split('/')[1] + " and ";
            }
        }
        if (chkRelatedICPsch.Checked)
        {
            if(txtRelatedICPsch.Text.Length>0)
                strwhere += "Issuetbl.ICP=" + txtRelatedICPsch.Text + " and ";

        }
        if (chkSubmittersch.Checked)
        {
            if(txtSubmittersch.Text.Length>0)
                strwhere += "Issuetbl.Submitter='" + txtSubmittersch.Text.Trim() + "' and ";

        }
        if (chkDatesch.Checked)
        {
            //txtfdatesch
            
            if ( txtfdatesch.Text.Length > 0)
                strwhere += "Issuetbl.IssueCreatedDate>='" + txtfdatesch.Text.Trim() + "' and ";
            if(txttdatesch.Text.Length>0)
                strwhere += "Issuetbl.IssueCreatedDate<='" + txttdatesch.Text.Trim() + "' and ";

        }
        if (chkIssuedetailsch.Checked)
        {
            if (ddlwildcsh.SelectedValue != "0")
            {
                if (ddlwildcsh.SelectedValue == "Like")
                {
                    if(txtchkIssuedetailsch.Text.Length>0)
                        strwhere += "Issuetbl.IssueDetails Like '" + txtchkIssuedetailsch.Text + "' and ";
                }
                else if (ddlwildcsh.SelectedValue == "Not Like")
                {
                    if (txtchkIssuedetailsch.Text.Length > 0)
                        strwhere += "Issuetbl.IssueDetails Not Like '" + txtchkIssuedetailsch.Text + "' and ";
                }
                else if (ddlwildcsh.SelectedValue == "Contains")
                {
                    if (txtchkIssuedetailsch.Text.Length > 0)
                    {
                        strwhere += "CONTAINS(Issuetbl.IssueDetails , '\"" + txtchkIssuedetailsch.Text + "\"') and ";
                    }
                     
                }

            }
            else
            {
                if(txtchkIssuedetailsch.Text.Length>0)
                    strwhere += "Issuetbl.IssueDetails='" + txtchkIssuedetailsch.Text.Trim() + "' and ";
            }

        }



        
        int stlen=strwhere.Trim().Length;

        if(strwhere.Length==5)
            strwhere="";
        else if(strwhere.IndexOf("and")>0)
        {
            if (strwhere.Substring(stlen - 2, 3) == "and")
                strwhere = strwhere.Substring(0, stlen - 3);
        }

        string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType,"+
                           "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, "+
                           "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink,"+
                        "Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                        "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType "+
                        "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType "+
                        "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType " + strwhere;

        SqlDataAdapter da;
        DataSet ds=new DataSet();
        
        try
        {
            
            SqlConnection conn = new SqlConnection(strconn);
            da = new SqlDataAdapter(strselect, conn);
            da.Fill(ds);
            da.Dispose();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridViewResult.Visible = true;
                GridViewResult.DataSource = ds.Tables[0];
                GridViewResult.DataBind();
            }
           

        }
        catch (Exception ex)
        {
        }


        
    }

    protected void Gridrecent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;

        // Get the selected index and the command name

        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        string _commandName = e.CommandName;

        switch (_commandName)
        {
            case ("SingleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                //this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                break;
            case ("DoubleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                string strid = _gridView.SelectedRow.Cells[2].Text;
                string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                            "Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                            "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                            "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                            "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType where Issuetbl.IDIssue=" + strid; 

                SqlDataAdapter da;
                DataSet ds = new DataSet();

                try
                {

                    SqlConnection conn = new SqlConnection(strconn);
                    da = new SqlDataAdapter(strselect, conn);
                    da.Fill(ds);
                    da.Dispose();
                    //Panelshowinfo.Visible = true;
                  //  Panel6.Visible = false;
                   // DetailsViewsch.Visible = true;
                   // DetailsViewsch.AutoGenerateRows = true;
                  //  DetailsViewsch.

                    //DetailsViewsch.DataSource = ds.Tables[0];

                    //DetailsViewsch.DataBind();
                    //DetailsViewsch.Focus();


                }
                catch (Exception ex)
                {
                }

            //    TabContainer1.ActiveTabIndex = 1;
                break;
        }
    }
    protected void GridViewResult_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;

        // Get the selected index and the command name

        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        string _commandName = e.CommandName;

        switch (_commandName)
        {
            case ("SingleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                //this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                break;
            case ("DoubleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                string strid = _gridView.SelectedRow.Cells[2].Text;
                string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                            "Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                            "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                            "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                            "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType where Issuetbl.IDIssue=" + strid; 

                SqlDataAdapter da;
                DataSet ds = new DataSet();

                try
                {

                    SqlConnection conn = new SqlConnection(strconn);
                    da = new SqlDataAdapter(strselect, conn);
                    da.Fill(ds);
                    da.Dispose();
                    //Panelshowinfo.Visible = true;
                  //  Panel6.Visible = false;
                   // DetailsViewsch.Visible = true;
                   // DetailsViewsch.AutoGenerateRows = true;
                  //  DetailsViewsch.

                    //DetailsViewsch.DataSource = ds.Tables[0];

                    //DetailsViewsch.DataBind();
                    //DetailsViewsch.Focus();


                }
                catch (Exception ex)
                {
                }

            //    TabContainer1.ActiveTabIndex = 1;
                break;
        }
    }
    protected void GridViewResult_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
            e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        }
    }
    protected void GridViewResult_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the LinkButton control in the first cell
            LinkButton _singleClickButton = (LinkButton)e.Row.Cells[0].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsSingle = ClientScript.GetPostBackClientHyperlink(_singleClickButton, "");
            // To prevent the first click from posting back immediately 
            // (therefore giving the user a chance to double click) pause the 
            // postback for 300 milliseconds by using setTimeout
            _jsSingle = _jsSingle.Insert(11, "setTimeout(\"");
            _jsSingle += "\", 300)";
            // Add this javascript to the onclick Attribute of the row
            e.Row.Attributes["onclick"] = _jsSingle;

            // Get the LinkButton control in the second cell
            LinkButton _doubleClickButton = (LinkButton)e.Row.Cells[1].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            string _jsDouble = ClientScript.GetPostBackClientHyperlink(_doubleClickButton, "");
            // Add this javascript to the ondblclick Attribute of the row
            e.Row.Attributes["ondblclick"] = _jsDouble;
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
//    protected void Button3_Click(object sender, EventArgs e)
//    {
        

//        string newWin =    "window.open('" + txtRelatedLinksnew.Text.Trim() + "');";
////
// //       ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);

//        ClientScript.RegisterStartupScript(this.GetType(), "pop", String.Format("<script>window.open('{0}');</script>", "http://" + txtRelatedLinksnew.Text.Trim()));

        
//    }
    protected void PagerCommand(object sender, DataPagerCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Next":
                //  guard against going off the end of the list
                e.NewStartRowIndex = Math.Min(e.Item.Pager.StartRowIndex + e.Item.Pager.MaximumRows, e.Item.Pager.TotalRowCount - e.Item.Pager.MaximumRows);
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Previous":
                //  guard against going off the begining of the list
                e.NewStartRowIndex = Math.Max(0, e.Item.Pager.StartRowIndex - e.Item.Pager.MaximumRows);
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Last":
                //  the
                e.NewStartRowIndex = e.Item.Pager.TotalRowCount - e.Item.Pager.MaximumRows;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "First":
            default:
                e.NewStartRowIndex = 0;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
        }

    }

    protected void LvSorting(object sender, ListViewSortEventArgs args)
    {
        // this.SqlDataSource1.OrderGroupsBy = string.Format("Key {0}", args.SortDirection);
    }

    protected void LvSorted(object sender, EventArgs args)
    {
       // ImageButton btn = this.lv.FindControl("btnSort") as ImageButton;
       // btn.ImageUrl = string.Format("~/_assets/img/{0}", this.lv.SortDirection == SortDirection.Ascending ? "asc.png" : "desc.png");
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "pop", String.Format("<script>window.open('{0}');</script>", "http://" + txtRelatedLinksnew.Text.Trim()));

    }
    protected void GridViewResult_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnclose_Click(object sender, EventArgs e)
    {
       // Panelshowinfo.Visible = false;
    }
    protected void BindRecentIssue(GridView grv)
    {
        string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                            "Issuetbl.ICP,Issuetbl.IssueCreatedDate,Issuetbl.[IssueCreatedUser] FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                            "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                            "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                            "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType  order by Issuetbl.IDIssue desc";


        SqlDataAdapter da;
        DataSet ds = new DataSet();

        try
        {

            SqlConnection conn = new SqlConnection(strconn);
            da = new SqlDataAdapter(strsql, conn);
            da.Fill(ds);
            da.Dispose();
            grv.DataSource = ds.Tables[0];
            grv.DataBind();


        }
        catch (Exception ex)
        {
        }
    }

   

}
