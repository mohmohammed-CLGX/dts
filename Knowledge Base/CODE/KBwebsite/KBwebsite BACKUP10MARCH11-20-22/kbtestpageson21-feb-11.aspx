<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="kbtestpageson21-feb-11.aspx.cs" Inherits="kbtestpageson21_feb_11" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
    Width="1032" Height="500">
        <cc1:TabPanel runat="server" HeaderText="Recent Issues" ID="RecentIssuestab">
        <ContentTemplate>
        <table style="width: -2147483648%">
       <%-- <tr><td> <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                GridLines="Vertical"  CssClass="datatable" 
                onrowcommand="GridView2_RowCommand" onrowcreated="GridView2_RowCreated" 
                onrowdatabound="GridView2_RowDataBound" >
            <AlternatingRowStyle BackColor="White" />

<Columns>
<asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False"/>
<asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False"/>
<asp:BoundField DataField="CompanyName" HeaderText="CompanyName" 
                  SortExpression="CompanyName" />
<asp:BoundField DataField="ContactName" HeaderText="ContactName" 
                  SortExpression="ContactName" />
<asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" 
                  SortExpression="ContactTitle" />
<asp:BoundField DataField="Address" HeaderText="Address" 
                  SortExpression="Address" />
<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
<asp:BoundField DataField="Region" HeaderText="Region" 
                  SortExpression="Region" />
<asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                  SortExpression="PostalCode" />
</Columns>

<FooterStyle BackColor="#CCCC99" />


<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />

<PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />

<RowStyle CssClass="row" />

            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />


</asp:GridView>
        </td>
        </tr>--%>
        </table>
            

         </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="SearchIssuestab" runat="server" HeaderText="Search Issues">
         <ContentTemplate>
         <table style="width:95%;">
        <tr>
        <td>
        <%-- <table style="width:100%;">
            <tr>
                <td>
                </td>
                <td class="style4">
                </td>
                <td class="style5">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td class="style9">
                    <asp:Panel ID="Panel4" runat="server" BackColor="#CCFFCC" 
                        GroupingText="Search by" Font-Size="Smaller">
                        <table style="width:100%; height: 67px;">
                            <tr>
                                <td class="style6" style="height: 30px; width: 168px">
                                    <asp:CheckBox ID="CheckBox4" runat="server" Text="State/County" />
                                </td>
                                <td class="style7" style="width: 123px; height: 30px">
                                    <asp:CheckBox ID="CheckBox5" runat="server" Text="FIPS" />
                                </td>
                                <td style="width: 118px; height: 30px">
                                    <asp:CheckBox ID="CheckBox6" runat="server" Text="SCM ID" />
                                </td>
                                <td style="height: 30px; width: 168px">
                                    <asp:CheckBox ID="CheckBox7" runat="server" 
                                        oncheckedchanged="CheckBox1_CheckedChanged" Text="File Type" />
                                </td>
                                <td style="height: 30px">
                                    <asp:CheckBox ID="CheckBox1" runat="server" 
                                        oncheckedchanged="CheckBox1_CheckedChanged" Text="date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style14" style="width: 168px">
                                    <asp:DropDownList ID="ddlstatecounty" runat="server" 
                                       Width="160px" DataSourceID="SqlDataSource2" DataTextField="StateCounty" 
                                        DataValueField="FIPS">
                                    </asp:DropDownList>
                                </td>
                                <td class="style15" style="width: 123px">
                                    <asp:DropDownList ID="ddlfips" runat="server" Width="100px" 
                                        DataSourceID="SqlDataSource2" DataTextField="FIPS" DataValueField="FIPS">
                                    </asp:DropDownList>
                                </td>
                                <td class="style16" style="width: 118px">
                                    <asp:DropDownList ID="ddlscm" runat="server" Width="100px">
                                    </asp:DropDownList>
                                </td>
                                <td class="style16" style="width: 168px">
                                    <asp:DropDownList ID="ddlfiletype" runat="server" Width="160px" 
                                        DataSourceID="SqlDataSource3" DataTextField="FileType" 
                                        DataValueField="IDFileType">
                                    </asp:DropDownList>
                                </td>
                                <td class="style16">
                                    <asp:Label ID="Label4" runat="server" Text="From"></asp:Label>
                                    <asp:TextBox ID="txtfromdt0" runat="server" Width="80px"></asp:TextBox>
                                    <asp:Label ID="Label5" runat="server" Text="To"></asp:Label>
                                    <asp:TextBox ID="txttodt0" runat="server" Width="80px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="style10">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#CCFFCC" 
                        GroupingText="Search by" Font-Size="Smaller">
                        <table style="width:100%;">
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7">
                                    <asp:CheckBox ID="CheckBox2" runat="server" Text="Comment Type" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Comment Text" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7">
                                    <asp:DropDownList ID="ddlcommenttype" runat="server" Width="200px" 
                                        DataSourceID="SqlDataSource4" DataTextField="CommentType" 
                                        DataValueField="IDCommentType">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcommenttext" runat="server" Width="331px"></asp:TextBox>
                                    <asp:Button ID="Button2" runat="server" Text="Search" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT * FROM [County]" 
                onselecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [IDFileType], [FileType] FROM [FileType]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [IDCommentType], [CommentType] FROM [CommentTypetbl]">
            </asp:SqlDataSource>--%>
        </td>
        </tr>
             <tr>
                 <td colspan="2">
                     <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                         CellPadding="4" DataSourceID="SqlDataSource9" Font-Size="Small" 
                         ForeColor="Black" GridLines="Vertical" OnRowCommand="GridView2_RowCommand" 
                         OnRowCreated="GridView2_RowCreated" OnRowDataBound="GridView2_RowDataBound">
                         <AlternatingRowStyle BackColor="White" />
                         <Columns>
                             <asp:BoundField DataField="CommentType" HeaderText="CommentType" 
                                 SortExpression="CommentType" />
                             <asp:BoundField DataField="StateCounty" HeaderText="StateCounty" 
                                 SortExpression="StateCounty" />
                             <asp:BoundField DataField="FileType" HeaderText="FileType" 
                                 SortExpression="FileType" />
                             <asp:BoundField DataField="FIPSCounty" HeaderText="FIPSCounty" 
                                 SortExpression="FIPSCounty" />
                             <asp:BoundField DataField="IssueType" HeaderText="IssueType" 
                                 SortExpression="IssueType" />
                             <asp:BoundField DataField="IssueDescription" HeaderText="Issue Description" 
                                 SortExpression="IssueDescription" />
                             <asp:BoundField DataField="IssueResolution" HeaderText="Resolution" 
                                 SortExpression="IssueResolution" />
                             <asp:BoundField DataField="IssueCreatedDate" HeaderText="Created Date" 
                                 SortExpression="IssueCreatedDate" />
                             <asp:BoundField DataField="IssueCreatedUser" HeaderText="Created User" 
                                 SortExpression="IssueCreatedUser" />
                         </Columns>
                         <FooterStyle BackColor="#CCCC99" />
                         <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                         <RowStyle BackColor="#F7F7DE" />
                         <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                     </asp:GridView>--%>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT  CommentTypetbl.CommentType,  County.StateCounty, FileType.FileType, Issuetbl.FIPSCounty, 
 IssueTypetbl.IssueType, Issuetbl.IssueDescription, Issuetbl.IssueResolution, Issuetbl.IssueCreatedDate, Issuetbl.IssueCreatedUser 
 FROM CommentTypetbl INNER JOIN CommentTypetbl AS CommentTypetbl_1 ON CommentTypetbl.IDCommentType = CommentTypetbl_1.IDCommentType 
full JOIN Issuetbl ON CommentTypetbl.IDCommentType = Issuetbl.IDCommentType AND CommentTypetbl_1.IDCommentType = Issuetbl.IDCommentType 
 full JOIN County ON Issuetbl.FIPSCounty = County.FIPS INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
 full JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID

order by Issuetbl.IssueCreatedDate desc">
                </asp:SqlDataSource>
                </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="NewIssuetab" runat="server" HeaderText="New Issue">
            <HeaderTemplate>
                New Issue
            </HeaderTemplate>
            <ContentTemplate>
               <%-- <table style="width:100%;">
                    <tr>
                        <td style="width: 274px">
                            <asp:Label ID="Label6" runat="server" Text="State/County"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="File Type" Width="200px"></asp:Label>
                        </td>
                        <td> 
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 274px">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource5" DataTextField="StateCounty" DataValueField="FIPS" 
                                Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="SqlDataSource6" DataTextField="FileType" 
                                DataValueField="IDFileType" Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 274px">
                            <asp:Label ID="Label8" runat="server" Text="Comment Type"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Issue Type"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 274px">
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                DataSourceID="SqlDataSource7" DataTextField="CommentType" 
                                DataValueField="IDCommentType" Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                DataSourceID="SqlDataSource10" DataTextField="IssueType" 
                                DataValueField="IssueType_ID" Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 274px">
                            <asp:Label ID="Label9" runat="server" Text="Comment Type"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="txtnewcommenttext" runat="server" Height="111px" 
                                TextMode="MultiLine" Width="572px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 30px" colspan="2">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                            <br />
                            <asp:Label ID="Label10" runat="server" Text="Recently Added"></asp:Label>
                            </td>
                        <td style="height: 30px">
                        </td>
                    </tr>
                    <caption>
                        <tr>
                            <td colspan="2">
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                    SelectCommand="SELECT [IssueType_ID], [IssueType] FROM [IssueTypetbl]">
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="4" DataSourceID="SqlDataSource8" Font-Size="Small" 
                                    ForeColor="Black" GridLines="Vertical" OnRowCreated="GridView2_RowCreated">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="CommentType" HeaderText="CommentType" 
                                            SortExpression="CommentType" />
                                        <asp:BoundField DataField="StateCounty" HeaderText="StateCounty" 
                                            SortExpression="StateCounty" />
                                        <asp:BoundField DataField="FileType" HeaderText="FileType" 
                                            SortExpression="FileType" />
                                        <asp:BoundField DataField="FIPSCounty" HeaderText="FIPSCounty" 
                                            SortExpression="FIPSCounty" />
                                        <asp:BoundField DataField="IssueType" HeaderText="IssueType" 
                                            SortExpression="IssueType" />
                                        <asp:BoundField DataField="IssueDescription" HeaderText="IssueDescription" 
                                            SortExpression="IssueDescription">
                                            <ControlStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="IssueResolution" HeaderText="Resolution" 
                                            SortExpression="IssueResolution" />
                                        <asp:BoundField DataField="IssueCreatedDate" HeaderText="CreatedDate" 
                                            SortExpression="IssueCreatedDate" />
                                        <asp:BoundField DataField="IssueCreatedUser" HeaderText="CreatedUser" 
                                            SortExpression="IssueCreatedUser" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </caption>
                </table>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [FIPS], [StateCounty], [County] FROM [County]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [IDFileType], [FileType] FROM [FileType]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [IDCommentType], [CommentType] FROM [CommentTypetbl]">
            </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT  CommentTypetbl.CommentType,  County.StateCounty, FileType.FileType, Issuetbl.FIPSCounty, 
 IssueTypetbl.IssueType, Issuetbl.IssueDescription, Issuetbl.IssueResolution, Issuetbl.IssueCreatedDate, Issuetbl.IssueCreatedUser 
 FROM CommentTypetbl INNER JOIN CommentTypetbl AS CommentTypetbl_1 ON CommentTypetbl.IDCommentType = CommentTypetbl_1.IDCommentType 
full JOIN Issuetbl ON CommentTypetbl.IDCommentType = Issuetbl.IDCommentType AND CommentTypetbl_1.IDCommentType = Issuetbl.IDCommentType 
 full JOIN County ON Issuetbl.FIPSCounty = County.FIPS INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
 full JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID

order by Issuetbl.IssueCreatedDate desc">
                </asp:SqlDataSource>--%>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="editMastertab" runat="server" HeaderText="Manipulate Master">
         <ContentTemplate>
          <cc1:CollapsiblePanelExtender ID="cpeEmployeeList" runat="server" TargetControlID="panelContentEmployeeList"
                ExpandControlID="panelTitleEmployeeList" 
                 CollapseControlID="panelTitleEmployeeList" Collapsed="True"
                ImageControlID="imgBackgroundEmployeeList" ExpandedImage="App_Themes/CollapsiblePanel/images/ProcessingClose.png"
                
                 CollapsedImage="App_Themes/CollapsiblePanel/images/processingtypeopen.png" 
                 SuppressPostBack="True" Enabled="True" >
            </cc1:CollapsiblePanelExtender>
            <cc1:CollapsiblePanelExtender ID="cpeEmployeeDetail" runat="server" TargetControlID="panelContentEmployeeDetail"
                ExpandControlID="panelTitleEmployeeDetail" 
                 CollapseControlID="panelTitleEmployeeDetail" Collapsed="True"
                ImageControlID="imgBackgroundEmployeeDetail" ExpandedImage="App_Themes/CollapsiblePanel/images/Filetypeclose.png"
                CollapsedImage="App_Themes/CollapsiblePanel/images/filetypeopen.png" 
                 SuppressPostBack="True" Enabled="True">
            </cc1:CollapsiblePanelExtender>
               <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="panel2"
                ExpandControlID="panel1" 
                 CollapseControlID="panel1" Collapsed="True"
                ImageControlID="img1" ExpandedImage="App_Themes/CollapsiblePanel/images/issuetypeclose.png"
                CollapsedImage="App_Themes/CollapsiblePanel/images/issuetypeopen.png" 
                 SuppressPostBack="True" Enabled="True">
            </cc1:CollapsiblePanelExtender>
            
       <table width="100%" style="height: 90%">
            <tr  valign="top">
                <td width="15%">
                </td>
                <td width="70%">
                <asp:Panel ID="panelTitleEmployeeList" runat="server" Height="25px" Width="405px">
                        <img id="imgBackgroundEmployeeList" src="App_Themes/CollapsiblePanel/images/ProcessingClose.png" /></asp:Panel>
                    <asp:Panel ID="panelContentEmployeeList" runat="server" Height="200px" 
                        Width="714px"  ScrollBars="Auto">
                        <div>
                            <div style='width: 390px; margin-top: 0px; margin-bottom: 0px;
                                            margin-left: 10px; margin-right: 10px; padding-top: 0px; padding-bottom: 0px;
                                            padding-right: 5px; padding-left: 5px; border-top-width: 0px; border-bottom-width: 0px;
                                            border-left-width: 2px; border-right-width: 2px; border-style: solid; border-color: #cccccc;'>
                                                                
                                            <div style="width: 90%; clear: both;">
                                                                          
                                            
                                                <asp:GridView ID="GridView6" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                                    DataKeyNames="IDProcessingType" DataSourceID="SqlDataSource11" 
                                                    Font-Size="Small" ForeColor="#333333" GridLines="None" Width="645px" 
                                                    ShowFooter="True">
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:BoundField DataField="IDProcessingType" HeaderText="IDProcessingType" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="IDProcessingType" />
                                                        <asp:BoundField DataField="ProcessingType" HeaderText="ProcessingType" 
                                                            SortExpression="ProcessingType">
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ProcessingTypeDescription" 
                                                            HeaderText="ProcessingTypeDescription" 
                                                            SortExpression="ProcessingTypeDescription">
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                            
                                                
                                            
                                            </div>
                                        </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panelTitleEmployeeDetail" runat="server" Height="25px" Width="405px">
                        <img id="imgBackgroundEmployeeDetail" src="App_Themes/CollapsiblePanel/images/Filetypeclose.png" /></asp:Panel>
                    <asp:Panel ID="panelContentEmployeeDetail" runat="server"  Height="200px" 
                        Width="714px"  ScrollBars="Auto">
                        <div>
                                        <div style='width: 390px; margin-top: 0px; margin-bottom: 0px;
                                            margin-left: 10px; margin-right: 10px; padding-top: 0px; padding-bottom: 0px;
                                            padding-right: 5px; padding-left: 5px; border-top-width: 0px; border-bottom-width: 0px;
                                            border-left-width: 2px; border-right-width: 2px; border-style: solid; border-color: #cccccc;'>
                                                
                                            <div style="width: 100%; clear: both;">
                                            
                                                <asp:GridView ID="GridView7" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                                    DataKeyNames="IDProblemType" DataSourceID="SqlDataSource12" Font-Size="Small" 
                                                    ForeColor="#333333" GridLines="None" Width="652px">
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                                        <asp:BoundField DataField="IDProblemType" HeaderText="IDProblemType" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="IDProblemType" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="ProblemType" HeaderText="ProblemType" 
                                                            SortExpression="Problem Type">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ProblemTypeDescription" 
                                                            HeaderText="ProblemTypeDescription" SortExpression="Problem Type Description">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                            
                                            </div>
                                        </div>
                                    </div>
                    </asp:Panel>
                        <asp:Panel ID="panel1" runat="server" Height="25px" Width="405px">
                        <img id="img1" src="App_Themes/CollapsiblePanel/images/issuetypeclose.png" /></asp:Panel>
                    <asp:Panel ID="panel2" runat="server"  Height="200px" 
                        Width="714px"  ScrollBars="Auto">
                        <div>
                                        <div style='border-left: 2px solid #cccccc; border-right: 2px solid #cccccc; border-top: 0px solid #cccccc; border-bottom: 0px solid #cccccc; margin: 0px 10px; padding: 0px 5px; width: 684px; '>
                                                
                                            <div style="width: 100%; clear: both;">
                                                                                   
                                            <asp:GridView ID="GridView8" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                                    DataKeyNames="IDFileType" DataSourceID="SqlDataSource13" ForeColor="#333333" 
                                                    GridLines="None" Width="652px">
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                                        <asp:BoundField DataField="IDFileType" HeaderText="IDFileType" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="IDFileType" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="FileType" HeaderText="FileType" 
                                                            SortExpression="File Type">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="FileTypeDescription" 
                                                            HeaderText="File Type Description" SortExpression="FileTypeDescription">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                                                                   
                                            
                                            </div>
                                        </div>
                                    </div>
                    </asp:Panel>
                     
                </td>
                <td width="15%">
                </td>
            </tr>
        </table>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT * FROM [ProcessingTypetbl]" 
                 DeleteCommand="DELETE FROM [ProcessingTypetbl] WHERE [IDProcessingType] = @IDProcessingType" 
                 InsertCommand="INSERT INTO [ProcessingTypetbl] ([ProcessingType], [ProcessingTypeDescription]) VALUES (@ProcessingType, @ProcessingTypeDescription)" 
                 UpdateCommand="UPDATE [ProcessingTypetbl] SET [ProcessingType] = @ProcessingType, [ProcessingTypeDescription] = @ProcessingTypeDescription WHERE [IDProcessingType] = @IDProcessingType">
                <DeleteParameters>
                    <asp:Parameter Name="IDProcessingType" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProcessingType" Type="String" />
                    <asp:Parameter Name="ProcessingTypeDescription" Type="String" />
                    <asp:Parameter Name="IDProcessingType" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProcessingType" Type="String" />
                    <asp:Parameter Name="ProcessingTypeDescription" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                
                 SelectCommand="SELECT [IDProblemType], [ProblemType], [ProblemTypeDescription] FROM [ProblemTypetbl]" 
                 DeleteCommand="DELETE FROM [ProblemTypetbl] WHERE [IDProblemType] = @IDProblemType" 
                 InsertCommand="INSERT INTO [ProblemTypetbl] ([ProblemType], [ProblemTypeDescription]) VALUES (@ProblemType, @ProblemTypeDescription)" 
                 UpdateCommand="UPDATE [ProblemTypetbl] SET [ProblemType] = @ProblemType, [ProblemTypeDescription] = @ProblemTypeDescription WHERE [IDProblemType] = @IDProblemType">
                 <DeleteParameters>
                     <asp:Parameter Name="IDProblemType" Type="Int32" />
                 </DeleteParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="ProblemType" Type="String" />
                     <asp:Parameter Name="ProblemTypeDescription" Type="String" />
                     <asp:Parameter Name="IDProblemType" Type="Int32" />
                 </UpdateParameters>
                 <InsertParameters>
                     <asp:Parameter Name="ProblemType" Type="String" />
                     <asp:Parameter Name="ProblemTypeDescription" Type="String" />
                 </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                
                 SelectCommand="SELECT [IDFileType], [FileType], [FileTypeDescription] FROM [FileType]" 
                 DeleteCommand="DELETE FROM [FileType] WHERE [IDFileType] = @IDFileType" 
                 InsertCommand="INSERT INTO [FileType] ([FileType], [FileTypeDescription]) VALUES (@FileType, @FileTypeDescription)" 
                 UpdateCommand="UPDATE [FileType] SET [FileType] = @FileType, [FileTypeDescription] = @FileTypeDescription WHERE [IDFileType] = @IDFileType">
                <DeleteParameters>
                    <asp:Parameter Name="IDFileType" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FileType" Type="String" />
                    <asp:Parameter Name="FileTypeDescription" Type="String" />
                    <asp:Parameter Name="IDFileType" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="FileType" Type="String" />
                    <asp:Parameter Name="FileTypeDescription" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                
                 SelectCommand="SELECT [IDIssueStatus], [IssueStatus], [IssueStatusDescription] FROM [IssueStatustbl]" 
                 DeleteCommand="DELETE FROM [IssueStatustbl] WHERE [IDIssueStatus] = @IDIssueStatus" 
                 InsertCommand="INSERT INTO [IssueStatustbl] ([IDIssueStatus], [IssueStatus], [IssueStatusDescription]) VALUES (@IDIssueStatus, @IssueStatus, @IssueStatusDescription)" 
                 UpdateCommand="UPDATE [IssueStatustbl] SET [IssueStatus] = @IssueStatus, [IssueStatusDescription] = @IssueStatusDescription WHERE [IDIssueStatus] = @IDIssueStatus">
                <DeleteParameters>
                    <asp:Parameter Name="IDIssueStatus" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IssueStatus" Type="String" />
                    <asp:Parameter Name="IssueStatusDescription" Type="String" />
                    <asp:Parameter Name="IDIssueStatus" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="IDIssueStatus" Type="Int32" />
                    <asp:Parameter Name="IssueStatus" Type="String" />
                    <asp:Parameter Name="IssueStatusDescription" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        
                </ContentTemplate>
        </cc1:TabPanel>
          <cc1:TabPanel ID="FAQtab" runat="server" HeaderText="FAQ">
         <ContentTemplate>
       <table width="98%">
        <tr>
        <td>
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                GridLines="Vertical"  CssClass="datatable" 
                onrowcommand="GridView2_RowCommand" onrowcreated="GridView2_RowCreated" 
                onrowdatabound="GridView2_RowDataBound" >

<RowStyle CssClass="row" />

<Columns>
<asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="false"/>
<asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="false"/>
<asp:BoundField DataField="CompanyName" HeaderText="CompanyName" 
                  SortExpression="CompanyName" />
<asp:BoundField DataField="ContactName" HeaderText="ContactName" 
                  SortExpression="ContactName" />
<asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" 
                  SortExpression="ContactTitle" />
<asp:BoundField DataField="Address" HeaderText="Address" 
                  SortExpression="Address" />
<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
<asp:BoundField DataField="Region" HeaderText="Region" 
                  SortExpression="Region" />
<asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                  SortExpression="PostalCode" />
</Columns>

<FooterStyle BackColor="#CCCC99" />

<PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" /><SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />


<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" /><AlternatingRowStyle BackColor="White" />
</asp:GridView>
        </td>
        </tr>
        </table>
                </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        SelectCommand="SELECT * FROM [Customers] WHERE ([City] = @City)">
        <SelectParameters>
            <asp:Parameter DefaultValue="london" Name="City" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
                    </asp:Content>