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
    protected void Page_PreRender()
    {
         bindrecentgv();
       
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        strconn = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();
        btnupdate.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnupdate.UniqueID, "");
        btnupdatesch.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnupdatesch.UniqueID, "");
        btnrecentdown.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnrecentdown.UniqueID, "");
        btnschdown.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnschdown.UniqueID, "");
        btnupdatenew.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnupdatenew.UniqueID, "");
        btnnewdown.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnnewdown.UniqueID, "");
        btnconfirmdelnew.OnClientClick = String.Format("fnClickUpdate('{0}','{1}')", btnconfirmdelnew.UniqueID, "");
       
        if (!IsPostBack)
        {
           bindrecentgv();
            bindnewrecentgrid();
            ddlstate_countynew.Attributes.Add("onchange", "return newstateselchange();");
            ddlfpisnew.Attributes.Add("onchange", "return newFipsselchange();");
            ddlfipssch.Attributes.Add("onchange", "return fipsschonchange();");
            // lblrecentdown.Style.Add("display", "none");
            txtcountysch.Style.Add("display", "none");
            btnrecentdown.Style.Add("display", "none");
            txtdownfile.Style.Add("display", "none");
            txtdownfilesch.Style.Add("display", "none");

            btnschdown.Style.Add("display", "none");
            txtdownfilenew.Style.Add("display", "none");
            btnnewdown.Style.Add("display", "none");
            // ddlRecentFips.Attributes.Add("onchange", "return fipsselchangeRecent();");

            //  ddlFipssch.Attributes.Add("onchange", "return fipsselchange();");
            // ddlcountysch1.Attributes.Add("onchange", "return countyselchange();");
            Button3.Attributes.Add("onclick", "OpenUrlLinks();return false;");
            radioandor.SelectedIndex = 0;

        }
       // Panel14.GroupingText = TabContainer1.ActiveTab.HeaderText;
        //GridView6.DataBind();
       // GridViewResult.DataBind();
       
     //  Button3.Attributes.Add("OnClick", "OpenSearchResults('" + txtRelatedLinksnew.ClientID + "');");
      //  ddlstatesch.Attributes.Add("onchange", "stateselchange();");
      
    }

    private void bindnewrecentgrid()
    {
        string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, SUBSTRING(Title,0,100) as Title," +
               "SUBSTRING(IssueDetails,0,200) as IssueDetails, SUBSTRING(Resolution,0,150) as Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, " +
               "Issuetbl.IssueCreatedDate, Issuetbl.IssueCreatedUser FROM County " +
               " INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
               " INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
               " INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
               " INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType order by Issuetbl.IDIssue desc";


        DataSet ds = new DataSet();
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(strsql, strconn);
            da.Fill(ds);
            da.Dispose();
            if (ds.Tables[0].Rows.Count > 0)
            {
                RecentIssuesgrid.DataSource = ds.Tables[0];
                RecentIssuesgrid.DataBind();
            }
            else
            {
                RecentIssuesgrid.DataSource = ds.Tables[0].DefaultView;
                RecentIssuesgrid.DataBind();
            }
        }
        catch (Exception ex)
        {
        }

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

    protected void gvrecent_RowDataBound(object sender, CommandEventArgs e)
    {
       // Label1.Text = e.CommandArgument.ToString();
       // ModalPopupExtender1.Show();
        ClientScript.RegisterStartupScript(typeof(Page), "display", "<script language=JavaScript>ShowMyModalPopup('" + e.CommandArgument.ToString() + "');</script>");

       // //if (e.Row.RowType == DataControlRowType.DataRow)
       // //{
       // //    //HyperLink HyperLink1 = (HyperLink)e.Row.Cells[0].Controls[0];

       // //    //HyperLink1.ImageUrl = "~/img/select.png";
       // //    //HyperLink1.ToolTip = "Detail view";
       // //    //HyperLink1.Attributes.Add("onclick", "ShowMyModalPopup('" + gvrecent.DataKeys[e.Row.RowIndex].Value + "')");
       // //    //// _singleClickButton.Attributes.Add("onclick", "ShowMyModalPopup('" + gvrecent.DataKeys[e.Row.RowIndex].Value + "')");
       // //}
    }

    protected void gvrecent_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        //    e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        //}
    }
    protected void btnschdown_Click(object sender, EventArgs e)
    {
        string id = hidschid.Value;
        downloadkbfile(id);
    }

     protected void btnrecentdown_Click(object sender, EventArgs e)
    {
        string id = hiduploadfileid.Value;
         downloadkbfile(id);
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        lblmsgrecent.Text = lblerrrecent.Text = "";
        string stredition = txtpupEdition.Text.ToUpper() != "N/A" ? txtpupEdition.Text : "null";
        string strversion = txtpupVersion.Text.ToUpper() != "N/A" ? txtpupVersion.Text : "null";
        string strICP = txtpupicp.Text.ToUpper() != "N/A" ? txtpupicp.Text : "null";
        
        
        string sql = "Update Issuetbl Set IDProcessingType=" + ddlpupptype.SelectedValue.ToString() +
                     ", IDFileType=" + ddlpupftype.SelectedValue.ToString() + " ,IDIssueType=" + ddlpupitype.SelectedValue.ToString() +
                     " ,Edition=" + stredition + " ,Version=" + strversion + " ,Title='" + txtpuptitle.Text +
                     "' ,IssueDetails='" + txtpupissue.Text + "' ,Resolution='" + txtpupresolution.Text +
                     "' ,Submitter='" + txtpupSubmitter.Text + //"' ,Relatedlink='" + txtpuprlinks.Text +
                     "' ,ICP=" + strICP + " Where IDIssue=" + hidCusCode.Value;
        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            bindrecentgv();
            btnrecentdown.Style.Add("display", "none");
            txtdownfile.Style.Add("display", "none");
            lblmsgrecent.Text = "Issue(" + hidCusCode.Value + ") updated successfully ";
            TabContainer1.ActiveTab = TabContainer1.Tabs[0];
        }
        catch (Exception ex)
        {
            btnrecentdown.Style.Add("display", "none");
            txtdownfile.Style.Add("display", "none");
            lblerrrecent.Text = "Error updating issue(" + hidCusCode.Value + ")";
            TabContainer1.ActiveTab = TabContainer1.Tabs[0];
        }
    }

    protected void bindrecentgv()
    {
        lblerrrecent.Text = lblmsgrecent.Text = "";
        string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, SUBSTRING(Title,0,100) as Title," +
                " IssueDetails, Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, " +
                "CONVERT(datetime, Issuetbl.IssueCreatedDate, 110) as IssueCreatedDate , Issuetbl.IssueCreatedUser FROM County " +
                " INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                " INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                " INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                " INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType order by Issuetbl.IDIssue desc";
      
     
        
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
                if(TabContainer1.ActiveTab == TabContainer1.Tabs[0])
                TabContainer1.ActiveTab = TabContainer1.Tabs[0];
                lblmsgrecent.Text = "Rows Count: " + ds.Tables[0].Rows.Count;
            }
            else
            {
                gvrecent.DataSource = ds.Tables[0].DefaultView;
                gvrecent.DataBind();
                TabContainer1.ActiveTab = TabContainer1.Tabs[0];
                lblmsgrecent.Text = "Rows Count: " + ds.Tables[0].Rows.Count;
            }
        }
        catch (Exception ex)
        {
            lblerrrecent.Text = "Error geting Rows";
        }


    }


    protected void btnrecentgo_Click(object sender, EventArgs e)
    {
        lblerrrecent.Text = lblmsgrecent.Text = "";

        if (ddlRecentState.SelectedValue != "" || txtRecentFromdt.Text != "" || txtRecentTodt.Text!="")
        {
            string strstate = ddlRecentState.SelectedValue;
            string strfips = ddlRecentCounty.SelectedValue;
            string strfdate = txtRecentFromdt.Text;
            string strtdate = txtRecentTodt.Text;

            if (strfdate.Length > 0)
            {
                DateTime dtf = Convert.ToDateTime(txtRecentFromdt.Text);



                if (dtf > DateTime.Now)
                {
                    lblerrrecent.Text = "From Date should be less than current date";
                    txtRecentFromdt.Focus();
                    bindrecentgvtonull();
                    return;
                }

            }

            if (strtdate.Length > 0)
            {
                DateTime dtt = Convert.ToDateTime(txtRecentTodt.Text);
                if (dtt > DateTime.Now)
                {
                    lblerrrecent.Text = "To Date should be less than current date";
                    txtRecentTodt.Focus();
                    bindrecentgvtonull();
                    return;
                }
            }

            string strsql = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                           "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                           "SUBSTRING(Title,0,100) as Title, SUBSTRING(IssueDetails,0,200) as IssueDetails, SUBSTRING(Resolution,0,150) as Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
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
            if (strfdate.Length > 0 && strtdate.Length > 0 ){


                strsql = strsql + " Issuetbl.IssueCreatedDate>='" + strfdate + "' and Issuetbl.IssueCreatedDate<='" + strtdate + "'";
                
            }
            else if (strfdate.Length > 0 && strtdate.Length <= 0)
            {
                strsql = strsql + " Issuetbl.IssueCreatedDate>='" + strfdate + "'";
            }
            else if (strfdate.Length <= 0 && strtdate.Length >0)
            {
                strsql = strsql + " Issuetbl.IssueCreatedDate<='" + strtdate + "'";
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
                da = new SqlDataAdapter(strsql + " order by Issuetbl.IDIssue desc", conn);
                da.Fill(ds);
                da.Dispose();
                gvrecent.DataSource = ds.Tables[0];
                gvrecent.DataBind();
                lblmsgrecent.Text = "Result with Row Count: " + ds.Tables[0].Rows.Count;
                btnrecentclear.Enabled = true;
                TabContainer1.ActiveTab = TabContainer1.Tabs[0];
                //  ddlRecentState.SelectedIndex=0;
               
             // txtRecentFromdt.Text="";
            //  txtRecentTodt.Text="";


            }
            catch (Exception ex)
            {
                lblerrrecent.Text = "Error geting Rows";
                bindrecentgvtonull();
                TabContainer1.ActiveTab = TabContainer1.Tabs[0];
            }

        }
        else
        {
        }
    }

    private void bindrecentgvtonull()
    {
        gvrecent.DataSource = null;
        gvrecent.DataBind();
        TabContainer1.ActiveTab = TabContainer1.Tabs[0];
    }
    protected void btnrecentclear_Click(object sender, EventArgs e)
    {
        lblerrrecent.Text = lblmsgrecent.Text = "";

        ccddRegion.SelectedValue = "";
        txtRecentFromdt.Text = "";
        txtRecentTodt.Text = "";
        bindrecentgv();
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
                //txtSubmitternew.Text = _gridView.SelectedRow.Cells[14].Text;
                txtRelatedLinksnew.Text = _gridView.SelectedRow.Cells[15].Text;
                txtICPnew.Text = _gridView.SelectedRow.Cells[16].Text;
                PanalAddNew.GroupingText = "Details";
                btnNew.Text = "Clear";
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
    protected void btnnewclear_Click(object sender, EventArgs e)
    {
        lblerrnew.Text = lblmsgnew.Text = "";
        btnNew.Text = "Save";
        PanalAddNew.GroupingText = "Add New";
        ddlstate_countynew.SelectedIndex = -1;
        ddlfpisnew.SelectedIndex = -1;
        ddlProcessingtypenew.SelectedIndex = -1;
        ddlFileTypenew.SelectedIndex = -1;
        ddlIssueTypenew.SelectedIndex = -1;
        txtTitlenew.Text = "";
        txtIssueDetailsnew.Text = "";
        txtResolutionnew.Text = "";
        txtEditionnew.Text = "N/A";
        txtVersionnew.Text = "N/A";
        ddlnewSubmitter.SelectedIndex = -1;
       // txtSubmitternew.Text = "";
        txtRelatedLinksnew.Text = "";
        txtICPnew.Text = "N/A";
        ddlstate_countynew.Enabled = true;
        ddlfpisnew.Enabled = true;
        FileUploadkb.Enabled = true;
        btnnewDel.Visible = false;
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {

        lblmsgnew.Text = lblerrnew.Text = "";
        if (btnNew.Text == "Clear")
        {
            btnNew.Text = "Submit";

            PanalAddNew.GroupingText = "Add New";
           // GridView5.SelectedIndex = -1;
           // GridView5.DataBind();


        }
        if(btnNew.Text == "Update" )
        {
            Updatenewissue();
            
        }
        else if (btnNew.Text == "Save")
        {

            if (ddlstate_countynew.SelectedIndex > 0 || ddlfpisnew.SelectedIndex > 0)
            {

                string FIPSCounty = "00000";
                if (ddlstate_countynew.SelectedValue.ToString() == "00")
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

                string IDProcessingType = "1";
                if (ddlProcessingtypenew.SelectedIndex > 0)
                {
                    IDProcessingType = ddlProcessingtypenew.SelectedValue.ToString();
                }
                string IDFileType = "1";
                if (ddlFileTypenew.SelectedIndex > 0)
                    IDFileType = ddlFileTypenew.SelectedValue.ToString();
                string IDIssueType = "1";
                if (ddlIssueTypenew.SelectedIndex > 0)
                    IDIssueType = ddlIssueTypenew.SelectedValue.ToString();
                int test;
                string Edition = "null";
                if (Int32.TryParse(txtEditionnew.Text, out test))
                    Edition = txtEditionnew.Text;

                string strVersion = "null";
                if (Int32.TryParse(txtVersionnew.Text, out test))
                    strVersion = txtVersionnew.Text;

                string Title = txtTitlenew.Text.Replace("'", "''");
                string IssueDetails = txtIssueDetailsnew.Text.Replace("'", "''");
                string Resolution = txtResolutionnew.Text.Replace("'", "''");

                string Submitter = "";// txtSubmitternew.Text.Replace("'", "''");
                if (ddlnewSubmitter.SelectedIndex > 0)
                    Submitter = ddlnewSubmitter.SelectedItem.Text.ToString();
                string Relatedlink = txtRelatedLinksnew.Text.Replace("'", "''");

                string ICP = "null";
                if (Int32.TryParse(txtICPnew.Text, out test))
                    ICP = txtICPnew.Text;
                string IssueCreatedDate = DateTime.Now.ToString("yyyy/MM/dd");


                try
                {
                    int upid = 0;
                    bool isfile = false;
                    if (FileUploadkb.FileName != "")
                    {
                        if (FileUploadkb.PostedFile != null || !string.IsNullOrEmpty(FileUploadkb.PostedFile.FileName) ||
                         FileUploadkb.PostedFile.InputStream != null)
                        {
                            if (FileUploadkb.FileBytes.Length > 0)
                            {
                                upid = uploadkbfile();
                                if (upid > 0)
                                {
                                    isfile = true;
                                }
                                else
                                {
                                    lblerrnew.Text = "Error - unable to upload file. Please try again.";
                                    return;
                                }
                            }
                            else
                            {
                                lblerrnew.Text = "Error - uploading 0 Byte file. Please try again.";
                                return;
                            }


                        }

                    }
                    string struid = "null";
                    if (upid > 0)
                        struid = upid.ToString();
                    string command = "insert into [Issuetbl](FIPSCounty,IDProcessingType,IDFileType,IDIssueType,Edition,Version,Title,IssueDetails,Resolution," +
                                  "Submitter,Relatedlink,ICP,IssueCreatedDate,Isuplodedfile,IDuploadedfile) " +
                                    " Values('" + FIPSCounty + "'," + IDProcessingType + "," + IDFileType + "," + IDIssueType + "," + Edition + "," +
                                strVersion + ",'" + Title + "','" + IssueDetails + "','" + Resolution + "','" + Submitter + "','" + Relatedlink + "'," + ICP + ",'" +
                               IssueCreatedDate + "','" + isfile + "'," + struid + ")";

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
                    ddlnewSubmitter.SelectedIndex = -1;
                    // txtSubmitternew.Text = "";
                    txtRelatedLinksnew.Text = "";
                    lblmsgnew.Text = "New Issue Submitted  Successfully";


                    bindnewrecentgrid();
                    bindrecentgv();


                }
                catch (Exception ex)
                {
                    lblerrnew.Text = "Unable To Submit New Issue";
                }
            }
            else
            {
                lblerrnew.Text = "Select state/count or fips ";
                return;
            }
        }
    }

    private int uploadkbfile()
    {
         


        
            try
            {
                SqlConnection conn = new SqlConnection(strconn);


                string command = "INSERT INTO [Uploadedfiletbl] ([FileName], [FileSize], [ContentType], [FileData]) " +
                                    "VALUES (@FileName, @FileSize, @ContentType, @FileData);" + " SELECT CAST(scope_identity() AS int)";

                SqlCommand cmd = new SqlCommand(command, conn);
                cmd.Parameters.AddWithValue("@FileName", FileUploadkb.FileName.Trim());
                cmd.Parameters.AddWithValue("@ContentType", FileUploadkb.PostedFile.ContentType);

                byte[] imageBytes = new byte[FileUploadkb.PostedFile.InputStream.Length + 1];
                FileUploadkb.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
                cmd.Parameters.AddWithValue("@FileData", imageBytes);
                cmd.Parameters.AddWithValue("@FileSize", FileUploadkb.PostedFile.InputStream.Length);
               
                conn.Open();
                int id=(int)cmd.ExecuteScalar();
                
                //cmd.ExecuteNonQuery();
                // .Text = "File successfully uploaded - thank you.";
                conn.Close();
                return id;
            }
            catch (Exception ex)
            {
                return -1;
            }
        
    }

    private void downloadkbfile(string upid)
    {
        byte[] file = null;
        string strfilename = "";
        string strext = "";
        string length;
        try
        {
            string strsql = "SELECT [FileName]  ,[FileSize] ,[ContentType] ,[FileData]  FROM [kb].[dbo].[Uploadedfiletbl] where [IDuploadedfile]=" + upid;

            SqlConnection conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(strsql, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                file = (byte[])reader["FileData"];
                strfilename = (string)reader["FileName"];
                strext = (string)reader["ContentType"];
            }
            length = file.Length.ToString();
            conn.Close();
            //strext = ReturnExtension(strext);
            Response.Clear();
            Response.ClearContent();
            Response.ContentType = strext;
            
      Response.AppendHeader("Content-Disposition", "attachment; filename=\"" + strfilename + "\"");
      Response.AppendHeader("Content-Length", length);

      Response.Flush();
      Response.BinaryWrite(file);
            //Response.ClearContent();
          //  Response.ContentType = ReturnExtension(strext);
            //Response.AddHeader("Content-Disposition", "attachment;filename=" + strfilename);

            ////  BinaryWriter bw = new HttpResponse.BinaryWriter();
            //Response.ContentType = ReturnExtension(strext);
            //Response.BinaryWrite(file);

          
           // Response.End();
        }
        catch (Exception ex)
        {
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       // downloadkbfile(5);
        
       // downloadkbfile(4);

    }
    private string ReturnExtension(string fileExtension)
    {
        switch (fileExtension)
        {
            case ".htm":
            case ".html":
            case ".log":
                return "text/HTML";
            case ".txt":
                return "text/plain";
            case ".doc":
                return "application/ms-word";
            case ".tiff":
            case ".tif":
                return "image/tiff";
            case ".asf":
                return "video/x-ms-asf";
            case ".avi":
                return "video/avi";
            case ".zip":
                return "application/zip";
            case ".xls":
            case ".csv":
                return "application/vnd.ms-excel";
            case ".gif":
                return "image/gif";
            case ".jpg":
            case "jpeg":
                return "image/jpeg";
            case ".bmp":
                return "image/bmp";
            case ".wav":
                return "audio/wav";
            case ".mp3":
                return "audio/mpeg3";
            case ".mpg":
            case "mpeg":
                return "video/mpeg";
            case ".rtf":
                return "application/rtf";
            case ".asp":
                return "text/asp";
            case ".pdf":
                return "application/pdf";
            case ".fdf":
                return "application/vnd.fdf";
            case ".ppt":
                return "application/mspowerpoint";
            case ".dwg":
                return "image/vnd.dwg";
            case ".msg":
                return "application/msoutlook";
            case ".xml":
            case ".sdxl":
                return "application/xml";
            case ".xdp":
                return "application/vnd.adobe.xdp+xml";
            default:
                return "application/octet-stream";
        }
    }



    protected void bindprocessingddlcontrols()
    {
        ddlProcessingtypenew.Items.Clear();
        ddlProcessingtypenew.Items.Add("--Select--");
        ddlProcessingtypenew.DataBind();

        ddlProcessingsch.Items.Clear();
        ddlProcessingsch.Items.Add("--Select--");
        ddlProcessingsch.DataBind();
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
                    //SqlDataSourceProcessingType
                    SqlDataSourceProcessingType.InsertParameters["ProcessingType"].DefaultValue = newtxtproctype.Text;
                    SqlDataSourceProcessingType.InsertParameters["ProcessingTypeDescription"].DefaultValue = newtxtDescription.Text;

                    SqlDataSourceProcessingType.Insert();

                    gridprocessingtype.DataBind();

                    bindprocessingddlcontrols();


                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }


    

    protected void gridprocessingtype_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        bindprocessingddlcontrols();
    }
    protected void gridprocessingtype_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        bindprocessingddlcontrols();
    }
    protected void gridprocessingtype_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridprocessingtype.Rows[e.RowIndex];

        strid = ((Label)(row.FindControl("Labelprocid"))).Text;

        int count = getrecordcount("IDProcessingType", strid);

        if (count > 0)
        {
            Alert.Show("You cannot delete this Master Record. As (" + count + ") “Issues Records” Related to it.  ");
            e.Cancel = true;
        }
        
    }

    protected void gridprocessingtype_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridprocessingtype.Rows[e.NewEditIndex];

        strid = ((Label)(row.FindControl("Labelprocid"))).Text;

        int count = getrecordcount("IDProcessingType", strid);

        if (count > 0)
        {
            Alert.Show("Do you want to edit the Master Record?  As there are (" + count + ") “Issues Records” Related to it.  ");
        }
        else if (count < 0)
        {
            lblmastererror.Text = "Error Editing";
            e.Cancel = true;
        }


    }

    protected void bindFileTypeddlcontrols()
    {



        ddlFileTypenew.Items.Clear();
        ddlFileTypenew.Items.Add("--Select--");
        ddlFileTypenew.DataBind();


        ddlFileTypesch.Items.Clear();
        ddlFileTypesch.Items.Add("--Select--");
        ddlFileTypesch.DataBind();
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
                    //FileTypeObjectDataSource.DataBind();
                 
                    gridFileType.DataBind();
                    bindFileTypeddlcontrols();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
        
    }
       protected void gridFileType_RowUpdated(object sender, GridViewUpdatedEventArgs e)
       {
           bindFileTypeddlcontrols();
       }
       protected void gridFileType_RowDeleted(object sender, GridViewDeletedEventArgs e)
       {
           bindFileTypeddlcontrols();
       }

       protected void bindissuetypeddlcontrols()
       {

          


           ddlIssueTypenew.Items.Clear();
           ddlIssueTypenew.Items.Add("--Select--");
           ddlIssueTypenew.DataBind();


           ddlIssuetypesch.Items.Clear();
           ddlIssuetypesch.Items.Add("--Select--");
           ddlIssuetypesch.DataBind();
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
                    bindissuetypeddlcontrols();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }

    protected void gridissuetype_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        bindissuetypeddlcontrols();
    }
    protected void gridissuetype_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        bindissuetypeddlcontrols();
    }

    protected void gridfaq_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        ListViewfaq.DataBind();
    }
    protected void gridfaq_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        ListViewfaq.DataBind();
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

                    ListViewfaq.DataBind();
                    gridfaq.DataBind();
                }
                catch (Exception ex)
                {
                    //  lblerr.Text = ex.Message;
                }
            }
        }
    }

    protected void gridSubmitter_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
       // ListViewfaq.DataBind();
    }
    protected void gridSubmitter_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
       // ListViewfaq.DataBind();
    }
    protected void gridSubmitter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "InsertNew")
        {

            TextBox newtxtFirstName = gridSubmitter.FooterRow.FindControl("newtxtFirstName") as TextBox;
            TextBox newtxtLastName = gridSubmitter.FooterRow.FindControl("newtxtLastName") as TextBox;
            TextBox newtxtUserLevel = gridSubmitter.FooterRow.FindControl("newtxtUserLevel") as TextBox;



            if (newtxtFirstName.Text != string.Empty)
            {
                // lblerr.Text = "Enter All Fields";


                try
                {
                    
                     
                    SqlDataSourceSubmitter.InsertParameters["FirstName"].DefaultValue = newtxtFirstName.Text;
                    SqlDataSourceSubmitter.InsertParameters["LastName"].DefaultValue = newtxtLastName.Text;
                    SqlDataSourceSubmitter.InsertParameters["UserLevel"].DefaultValue = newtxtUserLevel.Text;

                    SqlDataSourceSubmitter.Insert();
                    ddlnewSubmitter.Items.Clear();
                    ddlnewSubmitter.Items.Add(new ListItem("--Select--", "0"));
                    ddlnewSubmitter.DataBind();
                   // ListViewfaq.DataBind();
                    gridSubmitter.DataBind();
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

      // btnsearch.
        Errorsch.Text = MSGsch.Text = "";

        if (checkschcontrol())
        {
            string strwhere = " where ";
            string strstate = "";
            string strfips = "";
            string straddor="";
             if (radioandor.SelectedIndex>-1)
                 straddor = " " + radioandor.SelectedItem.Text+" ";
            if (straddor == string.Empty)
                straddor = " and";
            
            if (ddlstatesch.SelectedValue != "")
            {
                strstate = ddlstatesch.SelectedValue;
                strwhere += "County.State='" + strstate + "' " + straddor;

            }
            if (ddlcountysch.SelectedValue != "")
            {
             
                strwhere += "Issuetbl.FIPSCounty='" + ddlcountysch.SelectedValue + "' " + straddor;

            }
            else if (ddlfipssch.SelectedIndex > 0)
            {
                strfips = ddlfipssch.SelectedValue;
                
                strwhere += "Issuetbl.FIPSCounty='" + strfips + "' " + straddor;
            }
            

            if (ddlIssuetypesch.SelectedIndex > 0) { strwhere += "Issuetbl.IDIssueType=" + ddlIssuetypesch.SelectedValue + straddor; }


            if (ddlFileTypesch.SelectedIndex > 0) { strwhere += "Issuetbl.IDFileType=" + ddlFileTypesch.SelectedValue + straddor; }

            if (ddlProcessingsch.SelectedIndex > 0) { strwhere += "Issuetbl.IDProcessingType=" + ddlProcessingsch.SelectedValue + straddor; }
            if (txtEditionsch.Text != string.Empty)
            {

                int i;
                if(int.TryParse(txtEditionsch.Text,out i))
                {
                    strwhere += "Issuetbl.Edition=" + txtEditionsch.Text + straddor;
                }
                else if (txtEditionsch.Text.ToUpper() == "N/A" || txtEditionsch.Text.ToUpper() == "NA")
                {
                    strwhere += "Issuetbl.Edition=null";
                }

            }
            if (txtVersionsch.Text.Length > 0)
                {
                    int i;
                    if (int.TryParse(txtVersionsch.Text, out i))
                    {
                        
                        strwhere += "Issuetbl.Version=" + txtVersionsch.Text + straddor;
                    }
                    else if (txtVersionsch.Text.ToUpper() == "N/A" || txtVersionsch.Text.ToUpper() == "NA")
                    {
                        strwhere += "Issuetbl.Version=null";
                    }
                   
                }


            if (txtRelatedICPsch.Text.Length > 0)
            {
                int i;
                if (int.TryParse(txtVersionsch.Text, out i))
                {
                    strwhere += "Issuetbl.Version=" + txtVersionsch.Text + straddor;
                }
                else if (txtVersionsch.Text.ToUpper() == "N/A" || txtVersionsch.Text.ToUpper() == "NA")
                {
                    strwhere += "Issuetbl.Version=null";
                }
                strwhere += "Issuetbl.ICP=" + txtRelatedICPsch.Text + straddor;
            }



            if (txtSubmittersch.Text.Length > 0)
                strwhere += "Issuetbl.Submitter='" + txtSubmittersch.Text.Trim() + "'" + straddor;



            if (txtfdatesch.Text.Length > 0)
            {
                DateTime dtf = Convert.ToDateTime(txtfdatesch.Text);



                if (dtf > DateTime.Now)
                {
                    Errorsch.Text = "From Date should be less than current date";
                    GridViewResult.DataSource = null;
                    GridViewResult.DataBind();
                    txtfdatesch.Focus();
                    return;
                }

            }

            if (txttdatesch.Text.Length > 0)
            {
                DateTime dtt = Convert.ToDateTime(txttdatesch.Text);
                if (dtt > DateTime.Now)
                {
                    Errorsch.Text = "To Date should be less than current date";
                    GridViewResult.DataSource = null;
                    GridViewResult.DataBind();
                    txttdatesch.Focus();
                    return;
                }
            }


            if (txtfdatesch.Text.Length > 0 && txttdatesch.Text.Length > 0)
            {


                strwhere += "Issuetbl.IssueCreatedDate>='" + txtfdatesch.Text.Trim() + "'" + straddor;
                strwhere += "Issuetbl.IssueCreatedDate<='" + txttdatesch.Text.Trim() + "'" + straddor;

            }
            else if (txtfdatesch.Text.Length > 0 && txttdatesch.Text.Length <= 0)
            {
                strwhere += "Issuetbl.IssueCreatedDate>='" + txtfdatesch.Text.Trim() + "'" + straddor;
            }
            else if (txtfdatesch.Text.Length <= 0 && txttdatesch.Text.Length > 0)
            {
                strwhere += "Issuetbl.IssueCreatedDate<='" + txttdatesch.Text.Trim() + "'" + straddor;
            }


            //if (txtfdatesch.Text.Length > 0)
            //{
            //    if (txttdatesch.Text.Length > 0)
            //    {
            //        if (checkdates(txtfdatesch.Text, txttdatesch.Text))
            //        {
            //            if (txtfdatesch.Text.Length > 0)
            //                strwhere += "Issuetbl.IssueCreatedDate>='" + txtfdatesch.Text.Trim() + "'" + straddor;
            //            if (txttdatesch.Text.Length > 0)
            //                strwhere += "Issuetbl.IssueCreatedDate<='" + txttdatesch.Text.Trim() + "'" + straddor;
            //        }
            //        else
            //        {
            //            Errorsch.Text = "From date should be less than To date";
            //            return;
            //        }
            //    }
            //    else
            //    {
            //        Errorsch.Text = "Please Enter both From date and To date";
            //        return;
            //    }
            //}

            if (ddlwildcardstitlesch.SelectedValue != "0")
            {
                if (ddlwildcardstitlesch.SelectedValue == "Like")
                {
                    if (txttitlesch.Text.Length > 0)
                        strwhere += "Issuetbl.Title Like '%" + txttitlesch.Text + "%'" + straddor;
                }
                else if (ddlwildcardstitlesch.SelectedValue == "Not Like")
                {
                    if (txttitlesch.Text.Length > 0)
                        strwhere += "Issuetbl.Title Not Like '%" + txttitlesch.Text + "%'" + straddor;
                }
                else if (ddlwildcardstitlesch.SelectedValue == "Contains")
                {
                    if (txttitlesch.Text.Length > 0)
                    {
                        strwhere += "CONTAINS(Issuetbl.Title , '\"" + txttitlesch.Text + "\"')" + straddor;
                    }

                }

            }
            else
            {
                if (txttitlesch.Text.Length > 0)
                    strwhere += "Issuetbl.Title='" + txtIssuedetailsch.Text.Trim() + "'" + straddor;
            }


            if (ddlwildcsh.SelectedValue != "0")
            {
                if (ddlwildcsh.SelectedValue == "Like")
                {
                    if (txtIssuedetailsch.Text.Length > 0)
                        strwhere += "Issuetbl.IssueDetails Like '%" + txtIssuedetailsch.Text + "%'" + straddor;
                }
                else if (ddlwildcsh.SelectedValue == "Not Like")
                {
                    if (txtIssuedetailsch.Text.Length > 0)
                        strwhere += "Issuetbl.IssueDetails Not Like '%" + txtIssuedetailsch.Text + "%'" + straddor;
                }
                else if (ddlwildcsh.SelectedValue == "Contains")
                {
                    if (txtIssuedetailsch.Text.Length > 0)
                    {
                        strwhere += "CONTAINS(Issuetbl.IssueDetails , '\"" + txtIssuedetailsch.Text + "\"')" + straddor;
                    }

                }

            }
            else
            {
                if (txtIssuedetailsch.Text.Length > 0)
                    strwhere += "Issuetbl.IssueDetails='" + txtIssuedetailsch.Text.Trim() + "'" + straddor;
            }



            if (ddlwildcardsresolutionsch.SelectedValue != "0")
            {
                if (ddlwildcardsresolutionsch.SelectedValue == "Like")
                {
                    if (txtResolutionsch.Text.Length > 0)
                        strwhere += "Issuetbl.Resolution Like '%" + txtResolutionsch.Text + "%'" + straddor;
                }
                else if (ddlwildcardsresolutionsch.SelectedValue == "Not Like")
                {
                    if (txtResolutionsch.Text.Length > 0)
                        strwhere += "Issuetbl.Resolution Not Like '%" + txtResolutionsch.Text + "%'" + straddor;
                }
                else if (ddlwildcardsresolutionsch.SelectedValue == "Contains")
                {
                    if (txtResolutionsch.Text.Length > 0)
                    {
                        strwhere += "CONTAINS(Issuetbl.Resolution , '\"" + txtResolutionsch.Text + "\"')" + straddor;
                    }

                }

            }
            else
            {
                if (txtResolutionsch.Text.Length > 0)
                    strwhere += "Issuetbl.Resolution='" + txtResolutionsch.Text.Trim() + "'" + straddor;
            }




            int stlen = strwhere.Trim().Length;

            if (strwhere.Length == 5)
                strwhere = "";
            else if (strwhere.IndexOf(straddor) > 0)
            {
                if (straddor.ToUpper().Trim() == "AND")
                {
                    if (strwhere.Substring(stlen - 2, 3).ToUpper().Trim() == "AND")
                        strwhere = strwhere.Substring(0, stlen - 3);
                }
                else
                {
                    if (strwhere.Substring(stlen - 2, 3).ToUpper().Trim()== "OR")
                        strwhere = strwhere.Substring(0, stlen - 2);
                }
            }

            string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "SUBSTRING(Title,0,100) as Title, SUBSTRING(IssueDetails,0,200) as IssueDetails,  SUBSTRING(Resolution,0,150) as Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                            "Issuetbl.ICP,Issuetbl.IssueCreatedDate ,[IssueCreatedUser] FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                            "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                            "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                            "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType " + strwhere + " order by Issuetbl.IDIssue desc";


            SqlDataAdapter da;
            DataSet ds = new DataSet();

            if (strfips.Length > 0)
            {

                CascadingDropDown1.SelectedValue = getstatefromfips(strfips).Split(';')[0];
               // CascadingDropDown1.Enabled = false;

                CascadingDropDown2.SelectedValue = strfips;
                ddlfipssch.SelectedIndex = 0;
               // CascadingDropDown2.Enabled = false;
            }
            try
            {

                SqlConnection conn = new SqlConnection(strconn);
                da = new SqlDataAdapter(strselect, conn);
                da.Fill(ds);
                da.Dispose();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridViewResult.Visible = true;
                    MSGsch.Text = "Search Result with Row Count: " + ds.Tables[0].Rows.Count;
                    GridViewResult.DataSource = ds.Tables[0];
                    GridViewResult.DataBind();

                    
                }
                else
                {
                    GridViewResult.DataSource = null;
                    GridViewResult.DataBind();

                    MSGsch.Text = "No Records Found";
                }


            }
            catch (Exception ex)
            {
                GridViewResult.DataSource = null;
                GridViewResult.DataBind();
            }

        }
        else
        {
            Errorsch.Text = "Please Select one search criteria ";
        }
        
    }
    protected string getstatefromfips(string fips)
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

    private bool checkdates(string p, string p_2)
    {
        bool retval = false;
        DateTime dt1, dt2;
        if (DateTime.TryParse(p, out dt1))
        {
            if (DateTime.TryParse(p_2, out dt2))
            {
                if (dt1 < dt2)
                {
                    retval = true;
                }
            }
            
        }
        
        
        return retval;
        
    }

    protected bool  checkschcontrol()
    {
        bool retval=false;
        if (ddlstatesch.SelectedValue !="" ||
         ddlcountysch.SelectedValue != "" ||
         ddlfipssch.SelectedIndex > 0 ||
         txtcountysch.Text != "" ||
         ddlFileTypesch.SelectedIndex > 0 ||
         ddlIssuetypesch.SelectedIndex > 0 ||
         ddlProcessingsch.SelectedIndex > 0 ||
         txtEditionsch.Text != "" ||
         txtVersionsch.Text != "" ||
         txtRelatedICPsch.Text != "" ||
         txtSubmittersch.Text != "" ||
         txtfdatesch.Text != "" ||
         txttdatesch.Text != "" ||
         txttitlesch.Text!="" ||
         txtIssuedetailsch.Text != "" ||
         txtResolutionsch.Text != "")
        {
            retval=true;
        }
        return retval;
        }

    protected void clearschcontrols()
    {
       // ddlstatesch.SelectedValue = "";
        //ddlcountysch.SelectedValue = "";
        CascadingDropDown1.SelectedValue = "";
        CascadingDropDown2.SelectedValue = "";
        ddlfipssch.SelectedIndex = 0;
        txtcountysch.Text = "";
        ddlFileTypesch.SelectedIndex = 0;
        ddlIssuetypesch.SelectedIndex = 0;
        ddlProcessingsch.SelectedIndex = 0;
        txtEditionsch.Text = "";
        txtVersionsch.Text = "";
        txtRelatedICPsch.Text = "";
        txtSubmittersch.Text = "";
        txtfdatesch.Text = "";
        txttdatesch.Text = "";
        ddlwildcsh.SelectedIndex = 0;
        ddlwildcardsresolutionsch.SelectedIndex = 0;
        txtIssuedetailsch.Text = "";
        txtResolutionsch.Text = "";
        ddlwildcardstitlesch.SelectedIndex = 0;
        txttitlesch.Text = "";
        

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
        //GridView _gridView = (GridView)sender;

        //// Get the selected index and the command name

        //int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        //string _commandName = e.CommandName;

        //switch (_commandName)
        //{
        //    case ("SingleClick"):
        //        _gridView.SelectedIndex = _selectedIndex;
        //        //this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
        //        break;
        //    case ("DoubleClick"):
        //        _gridView.SelectedIndex = _selectedIndex;
        //        // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
        //        string strid = _gridView.SelectedRow.Cells[2].Text;
        //        string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
        //                       "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
        //                       "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
        //                    "Issuetbl.ICP,Issuetbl.IssueCreatedDate FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
        //                    "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
        //                    "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
        //                    "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType where Issuetbl.IDIssue=" + strid; 

        //        SqlDataAdapter da;
        //        DataSet ds = new DataSet();

        //        try
        //        {

        //            SqlConnection conn = new SqlConnection(strconn);
        //            da = new SqlDataAdapter(strselect, conn);
        //            da.Fill(ds);
        //            da.Dispose();
        //            //Panelshowinfo.Visible = true;
        //          //  Panel6.Visible = false;
        //           // DetailsViewsch.Visible = true;
        //           // DetailsViewsch.AutoGenerateRows = true;
        //          //  DetailsViewsch.

        //            //DetailsViewsch.DataSource = ds.Tables[0];

        //            //DetailsViewsch.DataBind();
        //            //DetailsViewsch.Focus();


        //        }
        //        catch (Exception ex)
        //        {
        //        }

        //    //    TabContainer1.ActiveTabIndex = 1;
        //        break;
        //}
    }
    protected void GridViewResult_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        //    e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        //}
    }
    protected void GridViewResult_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink HyperLink1 = (HyperLink)e.Row.Cells[0].Controls[0];

            HyperLink1.ImageUrl = "~/img/select.png";
            HyperLink1.ToolTip = "Detail view";
            DataRowView row = (DataRowView)e.Row.DataItem;
            //if (objTemp != null)
            //{
            //    string id = objTemp.ToString();
            HyperLink1.Attributes.Add("onclick", "ShowMyModalPopupsch('" + row["IDIssue"] + "')");
           
                //Do your operations
           // }
            // _singleClickButton.Attributes.Add("onclick", "ShowMyModalPopup('" + gvrecent.DataKeys[e.Row.RowIndex].Value + "')");
        }
    }

 
        protected void RecentIssuesgrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //HyperLink HyperLink1 = (HyperLink)e.Row.Cells[0].Controls[0];

            //HyperLink1.ImageUrl = "~/img/select.png";
            //HyperLink1.ToolTip = "Detail view";
            //DataRowView row = (DataRowView)e.Row.DataItem;

            //HyperLink1.Attributes.Add("onclick", "ShowMyModalPopupnew('" + row["IDIssue"] + "')");

        }
    }
        
    protected void btnupdatesch_Click(object sender, EventArgs e)
    {
        Errorsch.Text = MSGsch.Text = "";
        string stredition = txtpupEditionsch.Text.ToUpper() != "N/A" ? txtpupEditionsch.Text : "null";
        string strversion = txtpupVersionsch.Text.ToUpper() != "N/A" ? txtpupVersionsch.Text : "null";
        string strICP = txtpupicpsch.Text.ToUpper() != "N/A" ? txtpupicpsch.Text : "null";

        string sql = "Update Issuetbl Set IDProcessingType=" + ddlpupptypesch.SelectedValue.ToString() +
                     ", IDFileType=" + ddlpupftypesch.SelectedValue.ToString() + " ,IDIssueType=" + ddlpupitypesch.SelectedValue.ToString() +
                     " ,Edition=" + stredition + " ,Version=" + strversion + " ,Title='" + txtpuptitlesch.Text +
                     "' ,IssueDetails='" + txtpupissuesch.Text + "' ,Resolution='" + txtpupresolutionsch.Text +
                     "' ,Submitter='" + txtpupSubmittersch.Text + "' ,Relatedlink='" + txtpuprlinkssch.Text +
                     "' ,ICP=" + strICP + " Where IDIssue=" + hidsch.Value;

       
        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            TabContainer1.ActiveTab = TabContainer1.Tabs[1];
            txtdownfilesch.Style.Add("display", "none");
            btnschdown.Style.Add("display", "none");
            btnsearch_Click(null, null);
            MSGsch.Text = "Issue(" + hidsch.Value + ") updated successfully ";
         //   bindschgrid();
        }
        catch (Exception ex)
        {
            txtdownfilesch.Style.Add("display", "none");
            btnschdown.Style.Add("display", "none");
            Errorsch.Text = lblerrnew.Text = "Error updating issue(" + hidsch.Value + ")";
        }
    }

    private void bindschgrid()
    {
        string strwhere = " where ";
        string strstate = "";
        string strfips = "";
        if (ddlstatesch.SelectedIndex > 0)
        {
            strstate = ddlstatesch.SelectedValue;
            strwhere += "County.State='" + strstate + "' and ";

        }
        if (ddlfipssch.SelectedIndex > 0)
        {
            strfips = ddlfipssch.SelectedValue;
            strwhere += "Issuetbl.FIPSCounty='" + strfips + "' and ";
        }
        //if (ddlFipssch.SelectedIndex > 0)
        //{
        //    strfips = ddlFipssch.SelectedItem.Text;
        //    strwhere += "Issuetbl.FIPSCounty='" + strfips + "' and ";
        //}

        if (ddlIssuetypesch.SelectedIndex > 0) { strwhere += "Issuetbl.IDIssueType=" + ddlIssuetypesch.SelectedValue + " and "; }


        if (ddlFileTypesch.SelectedIndex > 0) { strwhere += "Issuetbl.IDFileType=" + ddlFileTypesch.SelectedValue + " and "; }

        if (ddlProcessingsch.SelectedIndex > 0) { strwhere += "Issuetbl.IDProcessingType=" + ddlProcessingsch.SelectedValue + " and "; }
        if (txtEditionsch.Text != string.Empty)
        {
            if (txtEditionsch.Text.Length > 0)
            {
                strwhere += "Issuetbl.Edition=" + txtEditionsch.Text.Split('/')[0] + " and ";
                strwhere += "Issuetbl.Version=" + txtEditionsch.Text.Split('/')[1] + " and ";
            }
        }

        if (txtRelatedICPsch.Text.Length > 0)
            strwhere += "Issuetbl.ICP=" + txtRelatedICPsch.Text + " and ";



        if (txtSubmittersch.Text.Length > 0)
            strwhere += "Issuetbl.Submitter='" + txtSubmittersch.Text.Trim() + "' and ";


        if (txtfdatesch.Text.Length > 0)
            strwhere += "Issuetbl.IssueCreatedDate>='" + txtfdatesch.Text.Trim() + "' and ";
        if (txttdatesch.Text.Length > 0)
            strwhere += "Issuetbl.IssueCreatedDate<='" + txttdatesch.Text.Trim() + "' and ";



        if (ddlwildcsh.SelectedValue != "0")
        {
            if (ddlwildcsh.SelectedValue == "Like")
            {
                if (txtIssuedetailsch.Text.Length > 0)
                    strwhere += "Issuetbl.IssueDetails Like '" + txtIssuedetailsch.Text + "' and ";
            }
            else if (ddlwildcsh.SelectedValue == "Not Like")
            {
                if (txtIssuedetailsch.Text.Length > 0)
                    strwhere += "Issuetbl.IssueDetails Not Like '" + txtIssuedetailsch.Text + "' and ";
            }
            else if (ddlwildcsh.SelectedValue == "Contains")
            {
                if (txtIssuedetailsch.Text.Length > 0)
                {
                    strwhere += "CONTAINS(Issuetbl.IssueDetails , '\"" + txtIssuedetailsch.Text + "\"') and ";
                }

            }

        }
        else
        {
            if (txtIssuedetailsch.Text.Length > 0)
                strwhere += "Issuetbl.IssueDetails='" + txtIssuedetailsch.Text.Trim() + "' and ";
        }






        int stlen = strwhere.Trim().Length;

        if (strwhere.Length == 5)
            strwhere = "";
        else if (strwhere.IndexOf("and") > 0)
        {
            if (strwhere.Substring(stlen - 2, 3) == "and")
                strwhere = strwhere.Substring(0, stlen - 3);
        }

        string strselect = "SELECT Issuetbl.IDIssue, Issuetbl.FIPSCounty, County.County, County.State, FileType.FileType," +
                           "IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                           "Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
                        "Issuetbl.ICP,Issuetbl.IssueCreatedDate ,[IssueCreatedUser] FROM  County INNER JOIN Issuetbl ON County.FIPS = Issuetbl.FIPSCounty " +
                        "INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType " +
                        "INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IDIssueType " +
                        "INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType " + strwhere + " order by Issuetbl.IDIssue desc";

        SqlDataAdapter da;
        DataSet ds = new DataSet();

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
        string strsql = "SELECT Issuetbl.IDIssue as IDIssue , Issuetbl.FIPSCounty as FIPSCounty, County.County, County.State, FileType.FileType," +
                               "IssueTypetbl.IssueType as IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.Edition, Issuetbl.Version, " +
                               "Issuetbl.Title as Title, Issuetbl.IssueDetails as IssueDetails , Issuetbl.Resolution as Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink," +
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



    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        if (TabContainer1.TabIndex ==0)
        {

        }
        else if (TabContainer1.TabIndex == 1)
        {
            ddlFileTypesch.Items.Clear();
            ddlFileTypesch.DataBind();
        }
        else if (TabContainer1.TabIndex == 2)
        {
            ddlFileTypesch.Items.Clear();
            ddlFileTypesch.DataBind();
        }
        else if (TabContainer1.TabIndex == 3)
        {
        }
        else if (TabContainer1.TabIndex == 4)
        {
        }
    }




   


    private int getrecordcount(string p,string id)
    {
        string strsql = "SELECT CAST(COUNT(*) AS int) from Issuetbl where "+p+"="+id;
        int retval;
        try
        {
            SqlConnection conn = new SqlConnection(strconn);

            SqlCommand cmd = new SqlCommand(strsql, conn);

            conn.Open();
            retval = (int)cmd.ExecuteScalar();
            conn.Close();
            return retval;
             

        }
        catch (Exception ex)
        {
            return -1;
        }

    }





    protected void gridFileType_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridFileType.Rows[e.NewEditIndex];

        strid = ((Label)(row.FindControl("Labelfileid"))).Text;

        int count = getrecordcount("IDFileType", strid);

        if (count > 0)
        {
            Alert.Show("Do you want to edit the Master Record?  As there are (" + count + ") “Issues Records” Related to it.");
        }
        else if (count < 0)
        {
            lblmastererror.Text = "Error Editing";
            e.Cancel = true;
        }

    }
    protected void gridFileType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridFileType.Rows[e.RowIndex];

        strid = ((Label)(row.FindControl("Labelfileid"))).Text;

        int count = getrecordcount("IDFileType", strid);

        if (count > 0)
        {
            Alert.Show("You cannot delete this Master Record. As there are (" + count + ") “Issues Records” Related to it.  ");
            e.Cancel = true;
        }
    }
    protected void gridissuetype_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridissuetype.Rows[e.RowIndex];

        strid = ((Label)(row.FindControl("Labelissueid"))).Text;

        int count = getrecordcount("IDIssueType", strid);

        if (count > 0)
        {
            Alert.Show("You cannot delete this Master Record. As there are (" + count + ") “Issues Records” Related to it.  ");
            e.Cancel = true;
        }
    }
    protected void gridissuetype_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblmastererror.Text = "";

        string strid;
        GridViewRow row = gridissuetype.Rows[e.NewEditIndex];

        strid = ((Label)(row.FindControl("Labelissueid"))).Text;

        int count = getrecordcount("IDIssueType", strid);

        if (count > 0)
        {
            Alert.Show("Do you want to edit the Master Record?  As there are (" + count + ") “Issues Records” Related to it.");
        }
        else if (count < 0)
        {
            lblmastererror.Text = "Error Editing";
            e.Cancel = true;
        }

    }
    protected void btnschclear_Click(Object sender, EventArgs e)
    {
        Errorsch.Text = MSGsch.Text = "";

        clearschcontrols();
        GridViewResult.Visible = false;
        
        GridViewResult.DataSource = null;
        GridViewResult.DataBind();
    }




    protected void btnnewdown_Click(object sender, EventArgs e)
    {
        string id = hidnewid.Value;
        downloadkbfile(id);
    }

   

    protected void gvrecent_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        HyperLink lnkDisplay;
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            
            lnkDisplay = (HyperLink)e.Item.FindControl("lnkDisplay");
          lnkDisplay.ImageUrl = "~/img/select.png";
           lnkDisplay.ToolTip = "Detail view";

           ListViewDataItem currentItem = (ListViewDataItem)e.Item;
           DataKey currentDataKey = gvrecent.DataKeys[currentItem.DataItemIndex];
           ListViewDataItem dataItem = (ListViewDataItem)e.Item;
           int issueId = (int)DataBinder.Eval(dataItem.DataItem, "IDIssue");

           lnkDisplay.Attributes.Add("onclick", "ShowMyModalPopup('" + issueId .ToString()+ "')");

        }
    }
    protected void DataPager_PreRender(object sender, EventArgs e)
    {
        bindrecentgv();
    }
    protected void listItems_PagePropertiesChanging(object sender, EventArgs e)
    {
       // this.pgr.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        bindrecentgv();
    }
    protected void RecentIssuesgrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         
        CIssue objissue = new CIssue();
        if (e.CommandName=="Select")
        {
            int rowindex = Convert.ToInt32(e.CommandArgument);
            int ID = Convert.ToInt32(RecentIssuesgrid.DataKeys[rowindex].Value);
           objissue= objdbkb.getIssuerecord(ID);
           BindNewissuecontrol(objissue);
           btnnewDel.Visible = true;

        }
    }

    protected void BindNewissuecontrol(CIssue objissue)
    {
        
        lblerrnew.Text = lblmsgnew.Text = "";
       
        ddlstate_countynew.SelectedValue = objissue.FIPSCounty;
        
        ddlfpisnew.SelectedValue = objissue.FIPSCounty;
       
        ddlProcessingtypenew.SelectedIndex = ddlProcessingtypenew.Items.IndexOf(ddlProcessingtypenew.Items.FindByText(objissue.ProcessingType));
        ddlFileTypenew.SelectedIndex = ddlFileTypenew.Items.IndexOf(ddlFileTypenew.Items.FindByText(objissue.FileType));
        ddlIssueTypenew.SelectedIndex = ddlIssueTypenew.Items.IndexOf(ddlIssueTypenew.Items.FindByText(objissue.IssueType));
        //ddlstate_countynew.Enabled = false;
        //ddlfpisnew.Enabled = false;
        FileUploadkb.Enabled = false;
       

        txtTitlenew.Text = objissue.Title.Replace("''", "'");
        txtIssueDetailsnew.Text = objissue.IssueDetails.Replace("''", "'");
        txtResolutionnew.Text = objissue.Resolution.Replace("''", "'");
        if (objissue.Edition > 0)
        {
            txtEditionnew.Text = Convert.ToString(objissue.Edition);
        }
        else
        {
            txtEditionnew.Text = "N/A";
        }
        if (objissue.Version> 0)
        {
            txtVersionnew.Text = Convert.ToString(objissue.Version);
        }
        else
        {
            txtVersionnew.Text = "N/A";
        }
        if (objissue.ICP > 0)
        {
             txtICPnew.Text = Convert.ToString(objissue.ICP);
        }
        else
        {
            txtICPnew.Text = "N/A";
        }
        if (ddlnewSubmitter.Items.FindByText(objissue.Submitter) != null)
        {
            ddlnewSubmitter.SelectedIndex = ddlnewSubmitter.Items.IndexOf(ddlnewSubmitter.Items.FindByText(objissue.Submitter));
      
           
        }
        else
        {
            ddlnewSubmitter.SelectedIndex = -1;
        }
        // txtSubmitternew.Text = "";
        txtRelatedLinksnew.Text = objissue.Relatedlink;
       
        btnNew.Text="Update";
        PanalAddNew.GroupingText = "Update";
        hidnewupdate.Value = objissue.IDIssue.ToString();
    }
    protected void Updatenewissue()
    {

        lblerrnew.Text = lblmsgnew.Text = "";

        string IDProcessingType = "1";
        if (ddlProcessingtypenew.SelectedIndex > 0)
        {
            IDProcessingType = ddlProcessingtypenew.SelectedValue.ToString();
        }
        string IDFileType = "1";
        if (ddlFileTypenew.SelectedIndex > 0)
            IDFileType = ddlFileTypenew.SelectedValue.ToString();
        string IDIssueType = "1";
        if (ddlIssueTypenew.SelectedIndex > 0)
            IDIssueType = ddlIssueTypenew.SelectedValue.ToString();
        int test;
        string Edition = "null";
        if (Int32.TryParse(txtEditionnew.Text, out test))
            Edition = txtEditionnew.Text;

        string strVersion = "null";
        if (Int32.TryParse(txtVersionnew.Text, out test))
            strVersion = txtVersionnew.Text;

        string Title = txtTitlenew.Text.Replace("'", "''");
        string IssueDetails = txtIssueDetailsnew.Text.Replace("'", "''");
        string Resolution = txtResolutionnew.Text.Replace("'", "''");

        string Submitter = "";// txtSubmitternew.Text.Replace("'", "''");
        if (ddlnewSubmitter.SelectedIndex > 0)
            Submitter = ddlnewSubmitter.SelectedItem.Text.ToString();
        string Relatedlink = txtRelatedLinksnew.Text.Replace("'", "''");

        string ICP = "null";
        if (Int32.TryParse(txtICPnew.Text, out test))
            ICP = txtICPnew.Text;
        string IssueUpdatedDate = DateTime.Now.ToString("yyyy/MM/dd");


        string sql = "Update Issuetbl Set IDProcessingType=" + IDProcessingType +
                     ", IDFileType=" + IDFileType + " ,IDIssueType=" + IDIssueType +
                     " ,Edition=" + Edition + " ,Version=" + strVersion + " ,Title='" + Title +
                     "' ,IssueDetails='" + IssueDetails + "' ,Resolution='" + Resolution +
                     "' ,Submitter='" + Submitter + "' ,Relatedlink='" + Relatedlink +
                     "' ,ICP=" + ICP + ", IssueUpdatedDate='"+IssueUpdatedDate+"' Where IDIssue=" + hidnewupdate.Value;


        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            TabContainer1.ActiveTab = TabContainer1.Tabs[2];
            txtdownfilenew.Style.Add("display", "none");
            btnnewdown.Style.Add("display", "none");
            bindnewrecentgrid();
            bindrecentgv();
            
            btnnewclear_Click(null, null);
            lblmsgnew.Text = "Issue(" + hidnewupdate.Value + ") updated successfully ";
        }
        catch (Exception ex)
        {
            txtdownfilenew.Style.Add("display", "none");
            btnnewdown.Style.Add("display", "none");
            lblerrnew.Text = "Error updating issue(" + hidnewupdate.Value + ")";
        }
    }
    protected void btnupdatenew_Click(object sender, EventArgs e)
    {

        lblerrnew.Text = lblmsgnew.Text = "";
        string stredition = txtpupEditionnew.Text.ToUpper() != "N/A" ? txtpupEditionnew.Text : "null";
        string strversion = txtpupVersionnew.Text.ToUpper() != "N/A" ? txtpupVersionnew.Text : "null";
        string strICP = txtpupicpnew.Text.ToUpper() != "N/A" ? txtpupicpnew.Text : "null";

        string sql = "Update Issuetbl Set IDProcessingType=" + ddlpupptypenew.SelectedValue.ToString() +
                     ", IDFileType=" + ddlpupftypenew.SelectedValue.ToString() + " ,IDIssueType=" + ddlpupitypenew.SelectedValue.ToString() +
                     " ,Edition=" + stredition + " ,Version=" + strversion + " ,Title='" + txtpuptitlenew.Text +
                     "' ,IssueDetails='" + txtpupissuenew.Text + "' ,Resolution='" + txtpupresolutionnew.Text +
                     "' ,Submitter='" + txtpupSubmitternew.Text + "' ,Relatedlink='" + txtpuprlinksnew.Text +
                     "' ,ICP=" + strICP + " Where IDIssue=" + hidnew.Value;

       
        try
        {
            SqlConnection conn = new SqlConnection(strconn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            TabContainer1.ActiveTab = TabContainer1.Tabs[2];
            txtdownfilenew.Style.Add("display", "none");
            btnnewdown.Style.Add("display", "none");
            bindnewrecentgrid();
            bindrecentgv();
            lblmsgnew.Text = "Issue(" + hidnew.Value + ") updated successfully ";
        }
        catch (Exception ex)
        {
            txtdownfilenew.Style.Add("display", "none");
            btnnewdown.Style.Add("display", "none");
            lblerrnew.Text = "Error updating issue(" + hidnew.Value + ")";
        }
    }
    protected void btnnewdelete_Click(object sender, EventArgs e)
    {

        lblerrnew.Text = lblmsgnew.Text = "";
        lblconfirmdelnew.Text = "Confirm Deletion of Issue (" + hidnewupdate.Value + ")";
        mpeconfirmnewdelete.Show();
    }


    protected void btnconfirmdelete_Click(object sender, EventArgs e)
 {
     lblerrnew.Text = lblmsgnew.Text = "";

     lblconfirmdelnew.Text = "";
     string sql = "Delete Issuetbl  Where IDIssue=" + hidnewupdate.Value;


     try
     {
         SqlConnection conn = new SqlConnection(strconn);
         conn.Open();
         SqlCommand cmd = new SqlCommand(sql, conn);
           cmd.ExecuteNonQuery();
         conn.Close();
         TabContainer1.ActiveTab = TabContainer1.Tabs[2];
         
         bindnewrecentgrid();
         bindrecentgv();
         btnnewclear_Click(null, null);
         lblmsgnew.Text = "Issue(" + hidnewupdate.Value + ") Deleted successfully ";
     }
     catch (Exception ex)
     {
        
         lblerrnew.Text = "Error Deleting Issue(" + hidnewupdate.Value + ")";
     }
 }
}
