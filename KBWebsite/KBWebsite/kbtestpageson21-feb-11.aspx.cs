﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using KBDAL;
using System.Data;

public partial class kbtestpageson21_feb_11 : System.Web.UI.Page
{
    //string strstatecounty;
    //string strfiletype;
    //string strcommenttype;
    string strconnm = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();
    SqlConnection connm ;
    DBConnectionsKB objdbkb = new DBConnectionsKB();
    protected void Page_Load(object sender, EventArgs e)
    {
        connm = new SqlConnection(strconnm);
        
        //if (IsPostBack)
        //{
        //    strstatecounty = ddlstatecounty.SelectedItem.Text;
        //    strfiletype = ddlfiletype.SelectedItem.Value;
        //    strcommenttype = ddlcommenttype.SelectedItem.Value;
        //    int i = ddlstatecounty.SelectedIndex;
        //}


    }
    protected void btnsave_Submit(object sender, EventArgs e)
    {
       // Response.Write("testing submit");
    }
    
    protected void btnsave_Click(object sender, EventArgs e)
    {
        Response.Write("testing save");
    }
    protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
            e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;

        // Get the selected index and the command name
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        string _commandName = e.CommandName;

        switch (_commandName)
        {
            case ("SingleClick"):
                _gridView.SelectedIndex = _selectedIndex;
                // this.Message.Text += "Single clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                break;
            case ("DoubleClick"):
                // this.Message.Text += "Double clicked GridView row at index " + _selectedIndex.ToString() + "<br />";
                Response.Redirect("~/QA-QCSearch.aspx");
                break;
        }

    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the LinkButton control in the first cell
            //  LinkButton _singleClickButton = (LinkButton)e.Row.Cells[0].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            // string _jsSingle = ClientScript.GetPostBackClientHyperlink(_singleClickButton, "");
            // To prevent the first click from posting back immediately 
            // (therefore giving the user a chance to double click) pause the 
            // postback for 300 milliseconds by using setTimeout
            //  _jsSingle = _jsSingle.Insert(11, "setTimeout(\"");
            //_jsSingle += "\", 300)";
            // Add this javascript to the onclick Attribute of the row
            //  e.Row.Attributes["onclick"] = _jsSingle;

            // Get the LinkButton control in the second cell
            //LinkButton _doubleClickButton = (LinkButton)e.Row.Cells[1].Controls[0];
            // Get the javascript which is assigned to this LinkButton
            // string _jsDouble = ClientScript.GetPostBackClientHyperlink(_doubleClickButton, "");
            // Add this javascript to the ondblclick Attribute of the row
            //e.Row.Attributes["ondblclick"] = _jsDouble;
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["kbConnectionString"].ToString();

    //    string strstatecounty = DropDownList1.SelectedValue.ToString();
    //    string strfiletype = DropDownList2.SelectedValue.ToString();
    //    string strcommenttype = DropDownList3.SelectedItem.Value;
    //    string strIssueType = DropDownList4.SelectedValue.ToString();
    //    string command = "insert into [Issuetbl]([FIPSCounty],[IDFileType],[IDCommentType],[IDIssueType],[IssueDescription],[IssueCreatedDate],[IssueCreatedUser])" +
    //                    "Values(" + strstatecounty + "," + strfiletype + "," + strcommenttype + "," + strIssueType + ",'" + txtnewcommenttext.Text + "','" + DateTime.Now + "',9000011)";


    //    try
    //    {
    //        SqlConnection conn = new SqlConnection(strconn);
    //        SqlCommand cmd = new SqlCommand(command, conn);
    //        conn.Open();
    //        cmd.ExecuteNonQuery();
    //        conn.Close();

    //        DropDownList1.SelectedIndex = 0;
    //        DropDownList2.SelectedIndex = 0;
    //        DropDownList3.SelectedIndex = 0;
    //        txtnewcommenttext.Text = "";
    //        GridView5.DataBind();


    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        BoundField boundFileType = new BoundField();
        boundFileType.DataField = "FileType";
        boundFileType.HeaderText = "File Type";

        BoundField boundDescription = new BoundField();
        boundDescription.DataField = "FileTypeDescription";
        boundDescription.HeaderText = "Description";

        BoundField boundCreateddate = new BoundField();
        boundCreateddate.DataField = "Createddate";
        boundCreateddate.HeaderText = "Date";

     }

    public DataTable getproc()
    {
        return objdbkb.getProcessingTypeTable();
    }
}
