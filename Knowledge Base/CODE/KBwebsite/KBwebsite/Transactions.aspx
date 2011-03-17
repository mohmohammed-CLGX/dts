<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" validateRequest="false" Inherits="Transactions" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link type="text/css" href="App_Themes/datePicker.css" rel="stylesheet" />
     <script src="_scripts/jquery.datePicker.js" type="text/javascript"></script>
     <script src="_scripts/jquery-1.5.1.js" type="text/javascript"></script>
    <SCRIPT type="text/javascript">
        $(function() {
        $("#txtfdatesch").datepicker();
        });  
       </SCRIPT>
<script language="javascript">
    function OpenSearchResults(str) {
        var url = document.getElementById(str);
        
        window.open("http://"+url.value,"mywindow",'width=300,height=200,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

    } 
    function fipsselchange() {
       var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
       var Text = ddlFips.options[ddlFips.selectedIndex].text;
       var Value = ddlFips.options[ddlFips.selectedIndex].value;
       var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        ddlcounty.value = Value;
        ddlstate.value = Value.split(" ")[0];

       // alert("fips :" + Value);
    }
    function countyselchange() {
        var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
        var Text = ddlcounty.options[ddlcounty.selectedIndex].text;
        var Value = ddlcounty.options[ddlcounty.selectedIndex].value;

        ddlFips.value = ddlcounty.options[ddlcounty.selectedIndex].value;
        ddlstate.value = ddlcounty.options[ddlcounty.selectedIndex].value.split(" ")[0];

        //alert("county :" + Value);

    }
    function stateselchange() {
        var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        //var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
        var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
        var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
        var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
        if (ddlstate.options[ddlstate.selectedIndex].value == "1") {
            chkfips.disabled = true;
            chkcountysch1.disabled = true;
        }
        else {
            chkfips.disabled = false;
            chkcountysch1.disabled = false;
            
        }
        
    }

    function chkfips() {
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
        var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
        var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
        var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
        var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");
        if (chkfips.checked) { //ddlstate.style. = 'none';
            ddlFips.value = 0;
            ddlstate.disabled = true;
            ddlstate.value = 0;
            ddlcountysch1.disabled = true;
            ddlcountysch1.value = 0;
            ddlFips.disabled = false;
            chkstate.disabled = true;
            chkstate.checked = false;
            chkcountysch1.disabled = true;
            chkcountysch1.checked = false;
            
        }
        else {


            ddlFips.disabled = true;
            ddlFips.value = 0;
            ddlcountysch1.value = 0;
            ddlstate.value = 0;
            chkstate.disabled = false;
            //chkstate.checked = false;
            chkcountysch1.disabled = false;
            //chkcountysch1.checked = false;
        }
       
    }

    function chkstate() {
        var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        
        
        
        if (chkstate.checked) { //ddlstate.style. = 'none';
            ddlstate.disabled = false;
        }
        else {
            // ddlstate.style.display = '';
            ddlstate.disabled = true;
            ddlstate.value = 0;
           
        }

    }

    function chkcounty() {
        var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
        var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");
        var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
        var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
        var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
        var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
        
       
        if (chkcountysch1.checked) { //ddlstate.style. = 'none';
            ddlcountysch1.disabled = false;
            ddlFips.value = 0;
            ddlstate.disabled = true;
            ddlstate.value = 0;


            ddlFips.disabled = true;
            chkstate.disabled = true;
            chkstate.checked = false;
            chkfips.checked = false;
            chkfips.disabled = true;
           
        }
        else {
            // ddlstate.style.display = '';
            ddlcountysch1.disabled = true;
            ddlFips.value = 0;
            chkstate.disabled = false;
            ddlcountysch1.value = 0;
            ddlstate.value = 0;
            chkfips.disabled = false;

        }
    }
    
   
    function Togglecheck(checkid, Childid, isddl) {
        
        var chkcontrol = document.getElementById(checkid);
        var childcontrol = document.getElementById(Childid);
       
        if (chkcontrol.checked) {
            childcontrol.disabled = false;
            
            
        }
        else {
            childcontrol.disabled = true;
         if(isddl=="yes")
             childcontrol.value = 0;
         else
            childcontrol.value = ""
         
        }
    }
</script>
<style type="text/css">
        .grid
        {
         	border:solid 2px #a5a4bd;        	
        	font-family:Tahoma;
        	font-size:12px;
        	width:600px;
        }
        .grid H2
         {
         	background:#8988a5 url(_assets/img/title-bg.gif);
         	border-bottom:solid 1px #57566f;
         	height:28px;
         	line-height:28px;
         	margin:0px;
         	padding:0px 0px 0px 5px;
        	color:#fff;
        	font-size:15px;
         }
         .grid TABLE
         {
         	width:600px;
         }
         
         /* grid headers */
         .grid #orders .head TH
         {
         	background:#e9e9eb url(_assets/img/header-bg.gif);
         	height:24px;
         	line-height:24px;
         	padding-left:6px;
         	color:#666666;
         	text-align:left;
         }
         .grid #orders .head TH.first
         {
         	/* get rid of the first slash */
         	background:#e9e9eb url(_assets/img/header-bg.gif) -3px;
         	width:20px;
         } 
         
         /* group header */
         .grid #orders .group TH
         {
         	padding:10px 0px 2px 0px;
         	color:#666666;
         	text-align:left;
         	border-bottom:solid 2px #a5a4bd;
         } 
         .grid #orders .group TH.first
         {
         	text-align:center;         	
         	border-bottom:none;
         }              
         
         /* data items */                                       
         .grid #orders .item TD
         {
         	padding:3px 0px 3px 6px;
         	border-bottom:solid 1px #eae9e1; 
         	color:#222222;       	
         } 
         
         /* pager */    
        .grid #pager .pager TD
        {
        	height:40px;
        }  
        .grid #pager .pager .commands
        {
        	height:40px;
            padding:4px 0px 0px 25px;
        }               
        .grid #pager .pager .info
        {
            padding:4px 25px 0px 0px;
        	text-align:right;
        }       
        .hidden
        {
        	display:none;
        	visibility:hidden;
        }      
    </style>
    <script type="text/javascript">
        function toggleGroup(img, numberOfRows) {
            //  get a reference to the row and table
            var tr = img.parentNode.parentNode;
            var table = $get('orders');
            var src = img.src;

            //  do some simple math to determine how many
            //  rows we need to hide/show
            var startIndex = tr.rowIndex + 1;
            var stopIndex = startIndex + parseInt(numberOfRows);

            //  if the img src ends with plus, then we are expanding the
            //  rows.  go ahead and remove the hidden class from the rows
            //  and update the image src
            if (src.endsWith('plus.png')) {
                for (var i = startIndex; i < stopIndex; i++) {
                    Sys.UI.DomElement.removeCssClass(table.rows[i], 'hidden');
                }

                src = src.replace('plus.png', 'minus.png');
            }
            else {
                for (var i = startIndex; i < stopIndex; i++) {
                    Sys.UI.DomElement.addCssClass(table.rows[i], 'hidden');
                }

                src = src.replace('minus.png', 'plus.png');
            }

            //  update the src with the new value
            img.src = src;
        }
    </script>
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
    Width="1032px" Height="1000px">
        <cc1:TabPanel runat="server" HeaderText="Recent Issues" ID="RecentIssuestab">
            <HeaderTemplate>
                Recent Issues
            </HeaderTemplate>
        <ContentTemplate>
        <table>
        <tr>
        <td>
            <asp:Panel ID="Panel11" runat="server" GroupingText="State/County">
               <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="State" 
                                        Width="150px"  AppendDataBoundItems="True" 
                                        Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Nation Wide"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                        
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        DataSourceID="countySqlDataSource" DataTextField="StateCounty" DataValueField="Fips" 
                                        Width="150px"  AppendDataBoundItems="True" 
                                        Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Nation Wide"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                        
                                    </asp:DropDownList>
                                    
            </asp:Panel>
        </td>
        </tr>
        <tr>
        <td> 
        <asp:Panel ID="Panel14" runat="server">
                <asp:ListView ID="lv" runat="server" DataSourceID="SqlDataSourceissuehead" 
                    OnSorted="LvSorted" OnSorting="LvSorting">
                    <ItemTemplate>
                        <tr ID="row" runat="server" class="group">
                            <th class="first">
                                <img alt='Group: <%# Eval("IssueType")%>' 
                                    onclick='toggleGroup(this, &#039;<%# Eval("Total") %>&#039;);' 
                                    src="_assets/img/plus.png" />
                            </th>
                            <th colspan="5">
                                <%# Eval("IssueType")%> (<%# Eval("Total") %> Issue Type)
                            </th>
                        </tr>
                        <asp:ListView ID="lvItems" runat="server" 
                            DataSourceID="SqlDataSourceissuehead2">
                            <LayoutTemplate>
                                <tr ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr ID="row" runat="server" class="item hidden">
                                        <th class="first">
                                            <img alt='Group: <%# Eval("Title")%>' 
                                                onclick='toggleGroup(this, &#039;<%# Eval("Total") %>&#039;);' 
                                                src="_assets/img/plus.png" />
                                        </th>
                                        <th colspan="5">
                                            <%# Eval("Title")%> (<%# Eval("Total") %> Sectons)
                                            <asp:ListView ID="lvItems1" runat="server" 
                                                DataSourceID="SqlDataSourceissuedetais">
                                                <LayoutTemplate>
                                                    <tr ID="itemPlaceholder" runat="server" />
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <tr ID="row" runat="server" class="item hidden">
                                                            <td class="first">
                                                            </td>
                                                            <td>
                                                                <%# Eval("StateCounty")%></td>
                                                            <td>
                                                                <%# Eval("IssueCreatedDate", "{0:MM/dd/yyyy}")%></td>
                                                            <td>
                                                                <%# Eval("FileType")%></td>
                                                            <td>
                                                                <%# Eval("IssueDetails")%></td>
                                                            <td>
                                                                <%# Eval("Resolution")%></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </th>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="grid">
                                    <h2>
                                        Recent Issues<asp:ImageButton ID="btnSort" runat="server" CommandName="Sort" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/_assets/img/sort_asc.gif" />
                                    </h2>
                                    <table ID="orders" cellpadding="0" cellspacing="0">
                                        <tr class="head">
                                            <th class="first">
                                            </th>
                                            <th>
                                                State/County</th>
                                            <th>
                                                Date</th>
                                            <th>
                                                File Type</th>
                                            <th>
                                                Details</th>
                                            <th>
                                                Resolution</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server" />
                                        </table>
                                        <table ID="pager" cellpadding="0" cellspacing="0">
                                            <tr class="pager">
                                                <asp:DataPager ID="pager" runat="server" PageSize="15">
                                                    <Fields>
                                                        <asp:TemplatePagerField OnPagerCommand="PagerCommand">
                                                            <PagerTemplate>
                                                                <td class="commands">
                                                                    <asp:ImageButton ID="btnFirst" runat="server" AlternateText="First Page" 
                                                                        CommandName="First" ImageUrl="~/_assets/img/first.gif" ToolTip="First Page" />
                                                                    <asp:ImageButton ID="btnPrevious" runat="server" AlternateText="Previous Page" 
                                                                        CommandName="Previous" ImageUrl="~/_assets/img/prev.gif" 
                                                                        ToolTip="Previous Page" />
                                                                    <asp:ImageButton ID="btnNext" runat="server" AlternateText="Next Page" 
                                                                        CommandName="Next" ImageUrl="~/_assets/img/next.gif" ToolTip="Next Page" />
                                                                    <asp:ImageButton ID="btnLast" runat="server" AlternateText="Last Page" 
                                                                        CommandName="Last" ImageUrl="~/_assets/img/last.gif" ToolTip="Last Page" />
                                                                </td>
                                                                <td class="info">
                                                                    Page <b>
                                                                    <%# Container.TotalRowCount > 0 ? Math.Ceiling(((double)(Container.StartRowIndex + Container.MaximumRows) / Container.MaximumRows)) : 0 %>
                                                                    </b>of <b>
                                                                    <%# Math.Ceiling((double)Container.TotalRowCount / Container.MaximumRows)%> </b>
                                                                    (<%# Container.TotalRowCount %> items)
                                                                </td>
                                                            </PagerTemplate>
                                                        </asp:TemplatePagerField>
                                                    </Fields>
                                                </asp:DataPager>
                                            </tr>
                                        </table>
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                        </asp:Panel>
                        </td>
                        </tr>
                        </table>
           
            
    <asp:SqlDataSource ID="SqlDataSourceissuehead" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" SelectCommand="SELECT COUNT(*) as Total,
                IssueType   from Issuetbl inner join 
                       IssueTypetbl on Issuetbl.IDIssueType=IssueTypetbl.IssueType_ID
                      group by IssueTypetbl.IssueType" >
            </asp:SqlDataSource>
    
            <asp:SqlDataSource ID="SqlDataSourceissuehead2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="select COUNT(*) as Total,
                Title from Issuetbl where 
                Issuetbl.IDIssueType=(select IssueType_ID from IssueTypetbl where IssueType='Instructions') group by Title">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceissuedetais" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" SelectCommand="SELECT     Issuetbl.IDIssue, 
                Issuetbl.Edition, Issuetbl.Version, Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, 
                      Issuetbl.IssueCreatedDate, FileType.FileType, County.FIPS, County.StateCounty, IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType
FROM         County INNER JOIN
                      Issuetbl ON County.FIPS = Issuetbl.FIPSCounty INNER JOIN
                      FileType ON Issuetbl.IDFileType = FileType.IDFileType INNER JOIN
                      IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID INNER JOIN
                      ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType
                      where Issuetbl.Title='Duplicated PCL number - Realcomps counties'" >
            </asp:SqlDataSource>
         </ContentTemplate>
        </cc1:TabPanel>
        
        <cc1:TabPanel ID="SearchIssuestab" runat="server" HeaderText="Search Issues">
            <HeaderTemplate>
                Search Issues
            </HeaderTemplate>
         <ContentTemplate>
                 
         <table style="width:100%;" width="1000">
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
                    <asp:Panel ID="Panel4" runat="server" BackColor="#CCCCCC" 
                        GroupingText="Search by" Font-Size="Smaller" Width="1000px">
                        <table style="width:100%; height: 67px;">
                            <tr>
                                <td class="style6" style="height: 30px; width: 168px">
                                    <asp:CheckBox ID="chkstatesch" runat="server" Text="State" 
                                        Font-Size="X-Small" />
                                </td>
                                <td class="style7" style="width: 123px; height: 30px">
                                    <asp:CheckBox ID="chkcountysch1" runat="server" Text="County" 
                                        Font-Size="X-Small" />
                                </td>
                                <td style="width: 118px; height: 30px">
                                    <asp:CheckBox ID="chkFipssch" runat="server" Text="Fips" 
                                         />
                                </td>
                                <td style="height: 30px">
                                    <asp:CheckBox ID="chkIssueTypesch" runat="server" 
                                         Text="Issue Type"  />
                                </td>
                                <td style="height: 30px">
                                    <asp:CheckBox ID="chkFilesch" runat="server" 
                                        Text="File Type" />
                                </td>
                                <td style="height: 30px; width: 168px">
                                    <asp:CheckBox ID="chkProcessingsch" runat="server" 
                                         Text="Processing Type" />
                                </td>
                                
                                
                            </tr>
                            <tr>
                                <td class="style14" style="width: 168px">
                                    <asp:DropDownList ID="ddlstatesch" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="State" 
                                        Width="150px" Enabled="False" AppendDataBoundItems="True" 
                                        Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Nation Wide"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                        
                                    </asp:DropDownList>
                                </td>
                                <td class="style15" style="width: 123px">
                                    <asp:DropDownList ID="ddlcountysch1" runat="server" 
                                        DataSourceID="countySqlDataSource" DataTextField="County" DataValueField="StateCounty" 
                                        Width="150px" Enabled="False" AppendDataBoundItems="True" 
                                        Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                         <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style16" style="width: 118px">
                                    <asp:DropDownList ID="ddlFipssch" runat="server" Width="80px" 
                                        DataSourceID="countySqlDataSource" DataTextField="FIPS" DataValueField="StateCounty" 
                                         Enabled="False" AppendDataBoundItems="True" Font-Size="X-Small">
                                         <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                          <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style16">
                                    <asp:DropDownList ID="ddlIssuetypesch" runat="server" Width="150px" 
                                        DataSourceID="IssueTypeSqlDataSource" DataTextField="IssueType" 
                                        DataValueField="IssueType_ID" AppendDataBoundItems="True" Enabled="False" 
                                        Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style16">
                                    <asp:DropDownList ID="ddlFileTypesch" runat="server" Width="150px" 
                                        DataSourceID="filetypeSqlDataSource" DataTextField="FileType" 
                                        DataValueField="IDFileType" AppendDataBoundItems="True" Enabled="False" Font-Size="X-Small" 
                                        >
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style16" style="width: 168px">
                                    <asp:DropDownList ID="ddlProcessingsch" runat="server" Width="150px" 
                                        DataSourceID="ProcessingSqlDataSource" DataTextField="ProcessingType" 
                                        DataValueField="IDProcessingType" AppendDataBoundItems="True" 
                                        Enabled="False" Font-Size="X-Small">
                                        <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                    </asp:DropDownList>
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
                    <asp:Panel ID="Panel3" runat="server" BackColor="#CCCCCC" 
                        GroupingText="Search by" Font-Size="Smaller" Width="1000px">
                        <table style="width:100%;">
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7">
                                    <asp:CheckBox ID="chkEditionsch" runat="server" Text="Edition/Version" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkRelatedICPsch" runat="server" Text="Related ICP" />
                                </td>
                                 <td>
                                    <asp:CheckBox ID="chkSubmittersch" runat="server" Text="Submitter" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkDatesch" runat="server" Text="Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7">
                                    <asp:TextBox ID="txtEditionsch" runat="server" MaxLength="7" Width="75px" 
                                        Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRelatedICPsch" runat="server" Enabled="False" 
                                        Font-Size="X-Small"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubmittersch" runat="server" Enabled="False" 
                                        Font-Size="X-Small" ></asp:TextBox>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="20px"  Width="20px" 
                                        ImageUrl="~/App_Themes/calendar_icon.png" ImageAlign="Middle" />
                                    <asp:TextBox ID="txtfdatesch" runat="server" MaxLength="10" Width="55px"  ReadOnly="True"
                                        Font-Size="X-Small"></asp:TextBox>TO
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                                         TargetControlID="txtfdatesch" PopupButtonID="ImageButton1" 
                                        Enabled="True"/>

                                   <asp:TextBox ID="txttdatesch" runat="server" MaxLength="10" Width="58px" 
                                        Font-Size="X-Small" ReadOnly="True" ></asp:TextBox >
                                         <cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                         TargetControlID="txttdatesch" PopupButtonID="ImageButton2" 
                                        Enabled="True"/>
                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                                        ImageAlign="Middle" ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                </td>
                                </tr>
                                </table>
                                </asp:Panel>
                                </td>
                            </tr>
             <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <asp:Panel ID="Panel5" runat="server" BackColor="#CCCCCC" 
                        GroupingText="Search by" Font-Size="Smaller" Width="1000px">
                        <table style="width:100%;">
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7">
                                    <asp:CheckBox ID="chkIssuedetailsch" runat="server" Text="Issue details " />
                                     
                                    
                                </td>
                                <td>
                                    <asp:Panel ID="Panelwild" runat="server" GroupingText="Wildcard" Width="164px" Height="42px" 
                                        >
                                    
                                        <asp:DropDownList ID="ddlwildcsh" runat="server" Height="16px" Width="121px" 
                                            Font-Size="X-Small">
                                            <asp:ListItem Value="0">---Select---</asp:ListItem>
                                            <asp:ListItem>Like</asp:ListItem>
                                            <asp:ListItem>Contains</asp:ListItem>
                                            <asp:ListItem>Not Like</asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkResolutionsch" runat="server" Text="Resolution/Recommended Action" />
                                </td>
                                <td >
                                    &nbsp;</td>
                                
                            </tr>
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                                <td class="style7" colspan="2">
                                    <asp:TextBox ID="txtchkIssuedetailsch" runat="server" Height="59px" 
                                        TextMode="MultiLine" Width="492px" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtResolutionsch" runat="server" Height="58px" 
                                        TextMode="MultiLine" Width="436px" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                </td>
                                
                              
                               
                            </tr>
             
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
                    <tr>
                    <td colspan="2" align="right"> <asp:Button ID="btnsearch" runat="server" Font-Size="X-Small" Text="Search" onclick="btnsearch_Click"    />
              </td>
                    </tr>
            </tr>
            <tr><td colspan="2" align="left">
                <asp:Panel ID="Panelshowinfo" runat="server"  GroupingText="Details"
                    HorizontalAlign="Center" Visible="False" Width="900px" >
                    <asp:DetailsView ID="DetailsViewsch" runat="server" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Height="50px" Width="300px" >
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                       
                    </asp:DetailsView>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" />
                    <asp:Button ID="btnDel" runat="server" onclick="Button5_Click" Text="Delete" />
                    <asp:Button ID="btnclose" runat="server" Text="Close" 
                        onclick="btnclose_Click" /> 
                </asp:Panel>
                 </td></tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <asp:Panel ID="Panel6" runat="server"   ScrollBars="Auto"
                        GroupingText="Search Result" Font-Size="X-Small"  Width="1000px" >
                        <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" Font-Size="X-Small" ForeColor="#333333" GridLines="None" 
                            OnRowCommand="GridViewResult_RowCommand" 
                            OnRowCreated="GridViewResult_RowCreated" 
                            OnRowDataBound="GridViewResult_RowDataBound" 
                            OnSelectedIndexChanged="GridViewResult_SelectedIndexChanged" Width="1300px">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:ButtonField CommandName="SingleClick" Text="SingleClick" Visible="False" />
                                <asp:ButtonField CommandName="DoubleClick" Text="DoubleClick" Visible="False" />
                                <asp:BoundField DataField="IDIssue" HeaderText="ID" ReadOnly="True" 
                                    SortExpression="IDIssue" />
                                <asp:BoundField DataField="IssueCreatedDate" DataFormatString="{0:d}" 
                                    HeaderText="Date" ReadOnly="True" SortExpression="IssueCreatedDate" />
                                <asp:BoundField DataField="FIPSCounty" HeaderText="Fips" ReadOnly="True" />
                                <asp:BoundField DataField="County" HeaderText="County" ReadOnly="True" 
                                    SortExpression="County" />
                                <asp:BoundField DataField="State" HeaderText="State" ReadOnly="True" 
                                    SortExpression="State" />
                                <asp:BoundField DataField="IssueType" HeaderText="IssueType" ReadOnly="True" 
                                    SortExpression="IssueType" />
                                <asp:BoundField DataField="FileType" HeaderText="FileType" ReadOnly="True" 
                                    SortExpression="FileType" />
                                <asp:BoundField DataField="ProcessingType" HeaderText="ProcessingType" 
                                    ReadOnly="True" SortExpression="ProcessingType" />
                                <asp:BoundField DataField="Edition" HeaderText="Edition" ReadOnly="True" 
                                    SortExpression="Edition" />
                                <asp:BoundField DataField="Version" HeaderText="Version" ReadOnly="True" 
                                    SortExpression="Version" />
                                <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" 
                                    SortExpression="Title" />
                                <asp:BoundField DataField="IssueDetails" HeaderText="Issue Details" 
                                    ReadOnly="True" SortExpression="IssueDetails">
                                    <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Resolution" HeaderText="Resolution" ReadOnly="True" 
                                    SortExpression="Resolution">
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Submitter" HeaderText="Submitter" ReadOnly="True" 
                                    SortExpression="Submitter" />
                                <asp:BoundField DataField="Relatedlink" HeaderText="Relatedlink" 
                                    ReadOnly="True" SortExpression="Relatedlink" />
                                <asp:BoundField DataField="ICP" HeaderText="ICP" ReadOnly="True" 
                                    SortExpression="ICP" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr><td colspan="3">
                
                <asp:SqlDataSource ID="IssueTypeSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT [IssueType_ID], [IssueType] FROM [IssueTypetbl]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="filetypeSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT [IDFileType], [FileType] FROM [FileType]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="ProcessingSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    
                    SelectCommand="SELECT [IDProcessingType], [ProcessingType] FROM [ProcessingTypetbl]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="issueSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT Issuetbl.IDIssue, Issuetbl.Edition, Issuetbl.Version, Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, FileType.FileType, County.StateCounty, IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, Issuetbl.IssueCreatedDate, Issuetbl.FIPSCounty FROM Issuetbl INNER JOIN County ON Issuetbl.FIPSCounty = County.FIPS INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType">
                </asp:SqlDataSource>
               
             </tr>
            
        </table>
        
           
        
      
</ContentTemplate></cc1:TabPanel>
        <cc1:TabPanel ID="NewIssuetab" runat="server" HeaderText="New Issue" Width="1400px">
            <HeaderTemplate>
                New Issue</HeaderTemplate><ContentTemplate>
            <asp:Panel ID="Panel2" runat="server"  GroupingText="Add New" ScrollBars="Auto" 
                    Font-Size="XX-Small">
                <table style="width:87%;" >
                
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="      " 
                                Font-Size="X-Small" ></asp:Label>
                            <asp:Panel ID="Panel10" runat="server" GroupingText="State/County ">
                                <asp:DropDownList ID="ddlstate_countynew" runat="server" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSource5" 
                                    DataTextField="StateCounty" DataValueField="FIPS" Font-Size="X-Small" 
                                    Width="200px">
                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Nationwide" Value="NW"></asp:ListItem>
                                    
                                </asp:DropDownList>
                            </asp:Panel>
                        </td><td style="width: 109px">
                            <asp:Panel ID="PanelFips" runat="server" GroupingText="Fips">
                                <asp:DropDownList ID="ddlfpisnew" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="SqlDataSource5" DataTextField="FIPS" DataValueField="FIPS" 
                                    Font-Size="X-Small" Width="100px">
                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="N/A" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                               
                            </asp:Panel>
                        </td><td>
                            <asp:Panel ID="Panel12" runat="server" GroupingText="Processing Type" Width="225px">
                                <asp:DropDownList ID="ddlProcessingtypenew" runat="server" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSourceProcessingtype" 
                                    DataTextField="ProcessingType" DataValueField="IDProcessingType" 
                                    Font-Size="X-Small" Width="200px">
                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:Panel>
                        </td><td> 
                            <asp:Panel ID="Panel13" runat="server" GroupingText="File Type" Width="260px">
                                <asp:DropDownList ID="ddlFileTypenew" runat="server" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSource6" 
                                    DataTextField="FileType" DataValueField="IDFileType" Font-Size="X-Small" 
                                    Width="200px">
                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:Panel>
                        </td>
                            
                        
                    </tr>
                    
                    <tr>
                        <td rowspan="2" >
                            <asp:Panel ID="PanelIssueType" runat="server" GroupingText="Issue Type">
                                <asp:DropDownList ID="ddlIssueTypenew" runat="server" 
                                    AppendDataBoundItems="True" DataSourceID="SqlDataSource10" 
                                    DataTextField="IssueType" DataValueField="IssueType_ID" Font-Size="X-Small" 
                                    Width="200px">
                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:Panel>
                        </td>
                        <td rowspan="2" colspan="3">
                             <table>
                             <tr>
                             <td width="117">
                            <asp:Panel ID="PanelEdition" runat="server" GroupingText="Edition" Width="100px">
                            <asp:TextBox ID="txtEditionnew" runat="server" Font-Size="XX-Small" MaxLength="3" 
                                Width="30px"></asp:TextBox>
                            </asp:Panel>
                            </td>
                            <td width="125">
                            <asp:Panel ID="PanelVersion" runat="server" GroupingText="Version" 
                                 Width="100px">
                                <asp:TextBox ID="txtVersionnew" runat="server" Font-Size="X-Small" 
                                    MaxLength="3" Width="30px"></asp:TextBox>
                            </asp:Panel>
                            </td>
                            <td width="150">
                            <asp:Panel ID="PanelRelatedICP" runat="server" GroupingText="Related ICP" 
                                Width="100px">
                                <asp:TextBox ID="txtICPnew" runat="server" Font-Size="X-Small" MaxLength="3" 
                                    Width="30px"></asp:TextBox>
                            </asp:Panel>
                            </td>
                            <td width="200">
                            <asp:Panel ID="PanelTitle" runat="server" GroupingText="Title" 
                                Width="100px">
                                <asp:TextBox ID="txtTitlenew" runat="server" Font-Size="X-Small" MaxLength="100" 
                                    Width="233px"></asp:TextBox>
                            </asp:Panel>
                            </td>
                            </tr>
                            </table>
                        </td></tr>
                     <tr>
                         <td>
                                &nbsp;</td></tr>
                      <tr>
                        <td colspan="2" rowspan="2" valign="top">
                           
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Panel ID="PanelSubmitter" runat="server" GroupingText="Submitter">
                                <asp:TextBox ID="txtSubmitternew" runat="server" Font-Size="X-Small" 
                                    MaxLength="50" Width="200px"></asp:TextBox>
                            </asp:Panel>
                           
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Panel ID="Panel9" runat="server" 
                                GroupingText="Related Links">
                                <asp:TextBox ID="txtRelatedLinksnew" runat="server" Font-Size="X-Small" 
                                    Width="242px"></asp:TextBox>
                                <asp:Button ID="Button3" runat="server" Font-Size="XX-Small" 
                                    Text="Go To Link" onclick="Button3_Click1"  />
                            </asp:Panel>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           
                            <asp:Panel ID="Panel15" runat="server" GroupingText="Upload File">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="312px" />
                            </asp:Panel>
                           
                        </td>
                          <td colspan="2">
                              <asp:Panel ID="Panel7" runat="server" GroupingText="Issue Details">
                                  <asp:TextBox ID="txtIssueDetailsnew" runat="server" Font-Size="X-Small" 
                                      Height="77px" TextMode="MultiLine" Width="572px"></asp:TextBox>
                              </asp:Panel>
                          </td>
                          <tr>
                              <td colspan="2">
                                  <asp:Panel ID="Panel8" runat="server" 
                                      GroupingText="Resolution/Recommended Action">
                                      <asp:TextBox ID="txtResolutionnew" runat="server" Font-Size="X-Small" 
                                          Height="66px" TextMode="MultiLine" Width="566px"></asp:TextBox>
                                  </asp:Panel>
                              </td>
                          </tr><tr>
                        <td style="height: 30px" colspan="4" align="right">
                            <br />
                            <asp:Button ID="Button1" runat="server" Font-Size="X-Small" 
                                OnClick="Button1_Click" Text="Submit" />
                        </td>
                          </tr></table></asp:Panel>
                <asp:Panel ID="Panel1" 
                    runat="server" Width="1000px" GroupingText="Recently Added"  ScrollBars="Auto"
                    Font-Size="X-Small" Height="400px">
                                  <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataSourceID="SqlDataSource8" Font-Size="X-Small" 
                                    ForeColor="#333333" GridLines="None"
                                     onrowcommand="GridView5_RowCommand" onrowcreated="GridView5_RowCreated" 
                                     onrowdatabound="GridView5_RowDataBound"
                                    DataKeyNames="IDIssue" Width="1500px" >
                                      <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                   <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                    <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False"/>
                                       <asp:BoundField DataField="IDIssue" HeaderText="IDIssue" 
                                            SortExpression="IDIssue"  ReadOnly="True"/>
                                        <asp:BoundField DataField="IssueCreatedDate" HeaderText="Date" 
                                            SortExpression="IssueCreatedDate" DataFormatString="&quot;{0:d}&quot;" >
                                        <ItemStyle Width="12px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StateCounty" HeaderText="State/County" 
                                            SortExpression="StateCounty" />
                                        <asp:BoundField DataField="FIPSCounty" HeaderText="FIPS" 
                                            SortExpression="FIPSCounty" />
                                        <asp:BoundField DataField="ProcessingType" HeaderText="ProcessingType" 
                                            SortExpression="ProcessingType" />
                                        <asp:BoundField DataField="FileType" HeaderText="File Type" 
                                            SortExpression="FileType" />
                                        <asp:BoundField DataField="IssueType" HeaderText="Issue Type" 
                                            SortExpression="IssueType" />
                                        <asp:BoundField DataField="Title" HeaderText="Title" 
                                            SortExpression="Title" />
                                        <asp:BoundField DataField="IssueDetails" HeaderText="Issue Details" 
                                            SortExpression="IssueDetails" >
                                        <ItemStyle Width="300px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Resolution" HeaderText="Resolution" 
                                            SortExpression="Resolution" >
                                        <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Edition" HeaderText="Edition" 
                                            SortExpression="Edition">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Version" HeaderText="Version" 
                                            SortExpression="Version" />
                                        <asp:BoundField DataField="Submitter" HeaderText="Submitter" 
                                            SortExpression="Submitter" />
                                        <asp:BoundField DataField="Relatedlink" HeaderText="Related link" 
                                            SortExpression="Relatedlink" />
                                        <asp:BoundField DataField="ICP" HeaderText="ICP" SortExpression="ICP" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                                </asp:Panel>
                              
                            
                   
                
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                    SelectCommand="SELECT [IssueType_ID], [IssueType] FROM [IssueTypetbl]">
                                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceProcessingtype" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT  [IDProcessingType],[ProcessingType]   FROM [ProcessingTypetbl]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                SelectCommand="SELECT [FIPS], [StateCounty], [County] FROM [County] "></asp:SqlDataSource>
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
                    
                            SelectCommand="SELECT Issuetbl.IDIssue, Issuetbl.Edition, 
                            Issuetbl.Version, Issuetbl.Title, Issuetbl.IssueDetails, Issuetbl.Resolution, 
                            Issuetbl.Submitter, Issuetbl.Relatedlink, Issuetbl.ICP, FileType.FileType, 
                            County.StateCounty, IssueTypetbl.IssueType, ProcessingTypetbl.ProcessingType, 
                            Issuetbl.IssueCreatedDate, Issuetbl.FIPSCounty FROM Issuetbl 
                            INNER JOIN County ON Issuetbl.FIPSCounty = County.FIPS 
                            INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
                            INNER JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID 
                            INNER JOIN ProcessingTypetbl ON Issuetbl.IDProcessingType = ProcessingTypetbl.IDProcessingType order by  Issuetbl.IssueCreatedDate desc ">
                </asp:SqlDataSource>
            </ContentTemplate>
        </cc1:TabPanel>
        
        
        <cc1:TabPanel ID="editMastertab" runat="server" HeaderText="Manipulate Master">
            <HeaderTemplate>
                Manipulate Master
            </HeaderTemplate>
         <ContentTemplate>
       
         <cc1:CollapsiblePanelExtender ID="cpeProcessing" runat="server" TargetControlID="panelProcessing"
                ExpandControlID="panelProcessingTitle" 
                 CollapseControlID="panelProcessingTitle" Collapsed="True"
                ImageControlID="imgProcessingTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/ProcessingClose.png"
                                 CollapsedImage="App_Themes/CollapsiblePanel/images/processingtypeopen.png" 
                 SuppressPostBack="True" Enabled="True" >
            </cc1:CollapsiblePanelExtender>
            
            <cc1:CollapsiblePanelExtender ID="cpeFiletype" runat="server" TargetControlID="panelFiletype"
                ExpandControlID="panelFiletypeTitle" 
                 CollapseControlID="panelFiletypeTitle" Collapsed="True"
                ImageControlID="imgFiletypeTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/Filetypeclose.png"
                CollapsedImage="App_Themes/CollapsiblePanel/images/filetypeopen.png" 
                 SuppressPostBack="True" Enabled="True" >
            </cc1:CollapsiblePanelExtender>
               <cc1:CollapsiblePanelExtender ID="cpeIssuetype" runat="server" TargetControlID="panelIssuetypeDetail"
                ExpandControlID="panelIssuetypeTitle" 
                 CollapseControlID="panelIssuetypeTitle" Collapsed="True"
                ImageControlID="imgIssuetypeTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/issuetypeclose.png"
                CollapsedImage="App_Themes/CollapsiblePanel/images/issuetypeopen.png" 
                 SuppressPostBack="True" Enabled="True" >
            </cc1:CollapsiblePanelExtender>
             <cc1:CollapsiblePanelExtender ID="pefaq" runat="server" TargetControlID="panelfaqDetail"
                ExpandControlID="panelfaqTitle" 
                 CollapseControlID="panelfaqTitle" Collapsed="True"
                ImageControlID="img1" ExpandedImage="App_Themes/CollapsiblePanel/images/blankclose.png"
                CollapsedImage="App_Themes/CollapsiblePanel/images/blankopen.png" 
                 SuppressPostBack="True" Enabled="True" >
            </cc1:CollapsiblePanelExtender>
        <table width="100%" style="height: 90%">
            <tr  valign="top">
                <td width="10%">
                </td>
                <td width="70%">
           <asp:Panel ID="panelProcessingTitle" runat="server" Height="30px" Width="750px">
            <img id="imgProcessingTitle" src="App_Themes/CollapsiblePanel/images/ProcessingClose.png" Height="30px"  Width="750px"/></asp:Panel>
                         <asp:Panel ID="panelProcessing" runat="server" Height="400px" 
                        Width="750px"  ScrollBars="Auto" >
                     
                             <asp:GridView ID="gridprocessingtype" runat="server" AutoGenerateColumns="False" 
                                 DataKeyNames="IDProcessingType" DataSourceID="SqlDataSourceProcessing" 
                                 CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%"
                                 ShowFooter="True" EnableModelValidation="True" 
                                 onrowcommand="gridprocessingtype_RowCommand">
                                 <RowStyle BackColor="#EFF3FB" />
                                 <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                    <FooterTemplate>
                                         <asp:Label ID="Labelnew" runat="server" Text="Add New"></asp:Label>
                                      </FooterTemplate>
                                       <ItemTemplate>
                                        <asp:Label ID="Labelprocid" runat="server" Text='<%# Bind("IDProcessingType") %>'></asp:Label>
                                      </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="50px" />
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Processing Type">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtProcessingType" runat="server" Text='<%# Bind("ProcessingType") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="LabelprocType" runat="server" Text='<%# Bind("ProcessingType") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtproctype" runat="server" />
                                      </FooterTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Description">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtprocdesc" runat="server" Text='<%# Bind("ProcessingTypeDescription") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="lbldesc" runat="server" Text='<%# Bind("ProcessingTypeDescription") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtDescription" runat="server" />
                                      </FooterTemplate>
                                      <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" Wrap="True"/>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Commands">
                    <ItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Edit" Text="Edit" CommandName="Edit" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Delete" Text="Delete" CommandName="Delete" /> 
                   
                    </ItemTemplate>
                 <EditItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Update" Text="Update" CommandName="Update" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="Cancel" />                                    
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Insert" Text="Add" CommandName="InsertNew" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="CancelNew" />                                    
                </FooterTemplate>
                    <FooterStyle VerticalAlign="Bottom" />
                    
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom"  Width="100px" />
                </asp:TemplateField>
                                  </Columns>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <EditRowStyle BackColor="#2461BF" />
                                 <AlternatingRowStyle BackColor="White" />
                             </asp:GridView>
                            
                             <asp:SqlDataSource ID="SqlDataSourceProcessing" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                 DeleteCommand="DELETE FROM [ProcessingTypetbl] WHERE [IDProcessingType] = @IDProcessingType" 
                                 InsertCommand="INSERT INTO [ProcessingTypetbl] ([ProcessingType], [ProcessingTypeDescription]) VALUES (@ProcessingType, @ProcessingTypeDescription)" 
                                 SelectCommand="SELECT * FROM [ProcessingTypetbl]" 
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
                        
                        </asp:Panel>
          <asp:Panel ID="panelFiletypeTitle" runat="server" Height="30px" Width="750px">
             <img id="imgFiletypeTitle" src="App_Themes/CollapsiblePanel/images/Filetypeclose.png" Height="30px"  Width="750px"/></asp:Panel>
          <asp:Panel ID="panelFiletype" runat="server" Height="400px"   Width="750px"  ScrollBars="Auto" >
              <asp:GridView ID="gridFileType" runat="server" AutoGenerateColumns="False" 
                                 DataKeyNames="IDFileType" DataSourceID="SqlDataSourceFileType" 
                                 CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%"
                                 ShowFooter="True" EnableModelValidation="True" onrowcommand="gridFileType_RowCommand">
                                 <RowStyle BackColor="#EFF3FB" />
                                 <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                    <FooterTemplate>
                                         <asp:Label ID="Labelnewfid" runat="server" Text="Add New"></asp:Label>
                                      </FooterTemplate>
                                       <ItemTemplate>
                                        <asp:Label ID="Labelfileid" runat="server" Text='<%# Bind("IDFileType") %>'></asp:Label>
                                      </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="50px" />
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File Type">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtFileType" runat="server" Text='<%# Bind("FileType") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="LabelFileType" runat="server" Text='<%# Bind("FileType") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtfiletype" runat="server" />
                                      </FooterTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Description">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtfiledesc" runat="server" Text='<%# Bind("FileTypeDescription") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="lblfdesc" runat="server" Text='<%# Bind("FileTypeDescription") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtfileDescription" runat="server" />
                                      </FooterTemplate>
                                      <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" Wrap="True"/>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Commands">
                    <ItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Edit" Text="Edit" CommandName="Edit" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Delete" Text="Delete" CommandName="Delete" /> 
                   
                    </ItemTemplate>
                 <EditItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Update" Text="Update" CommandName="Update" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="Cancel" />                                    
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Insert" Text="Add" CommandName="InsertNew" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="CancelNew" />                                    
                </FooterTemplate>
                    <FooterStyle VerticalAlign="Bottom" />
                    
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom"  Width="100px" />
                </asp:TemplateField>
                                  </Columns>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <EditRowStyle BackColor="#2461BF" />
                                 <AlternatingRowStyle BackColor="White" />
                             </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSourceFileType" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                 DeleteCommand="DELETE FROM [FileType] WHERE [IDFileType] = @IDFileType" 
                                 InsertCommand="INSERT INTO [FileType] ([FileType], [FileTypeDescription]) VALUES (@FileType, @FileTypeDescription)" 
                                 SelectCommand="SELECT * FROM [FileType]" 
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
           </asp:Panel>
           <asp:Panel ID="panelIssuetypeTitle" runat="server" Height="30px" Width="750px">
             <img id="imgIssuetypeTitle" src="App_Themes/CollapsiblePanel/images/issuetypeclose.png" Height="30px"  Width="750px"/></asp:Panel>
             <asp:Panel ID="panelIssuetypeDetail" runat="server" Height="400px" 
                        Width="750px"  ScrollBars="Auto" >
                   
                         <asp:GridView ID="gridissuetype" runat="server" AutoGenerateColumns="False" 
                                 DataKeyNames="IssueType_ID" DataSourceID="SqlDataSourceIssuetype" 
                                 CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%"
                                 ShowFooter="True" EnableModelValidation="True" 
                                 onrowcommand="gridissuetype_RowCommand">
                                 <RowStyle BackColor="#EFF3FB" />
                                 <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                    <FooterTemplate>
                                         <asp:Label ID="Labelissuenew" runat="server" Text="Add New"></asp:Label>
                                      </FooterTemplate>
                                       <ItemTemplate>
                                        <asp:Label ID="Labelissueid" runat="server" Text='<%# Bind("IssueType_ID") %>'></asp:Label>
                                      </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="50px" />
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Processing Type">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtIssueType" runat="server" Text='<%# Bind("IssueType") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="LabelIssueType" runat="server" Text='<%# Bind("IssueType") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtIssueType" runat="server" />
                                      </FooterTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Description">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtissuedesc" runat="server" Text='<%# Bind("IssueTypeDescription") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="lblidesc" runat="server" Text='<%# Bind("IssueTypeDescription") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtiDescription" runat="server" />
                                      </FooterTemplate>
                                      <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" Wrap="True"/>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Commands">
                    <ItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Edit" Text="Edit" CommandName="Edit" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Delete" Text="Delete" CommandName="Delete" /> 
                   
                    </ItemTemplate>
                 <EditItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Update" Text="Update" CommandName="Update" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="Cancel" />                                    
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Insert" Text="Add" CommandName="InsertNew" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="CancelNew" />                                    
                </FooterTemplate>
                    <FooterStyle VerticalAlign="Bottom" />
                    
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom"  Width="100px" />
                </asp:TemplateField>
                                  </Columns>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <EditRowStyle BackColor="#2461BF" />
                                 <AlternatingRowStyle BackColor="White" />
                             </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSourceIssuetype" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                 DeleteCommand="DELETE FROM [IssueTypetbl] WHERE [IssueType_ID] = @IssueType_ID" 
                                 InsertCommand="INSERT INTO [IssueTypetbl] ([IssueType], [IssueTypeDescription]) VALUES (@IssueType, @IssueTypeDescription)" 
                                 SelectCommand="SELECT [IssueType_ID],[IssueType],[IssueTypeDescription] FROM [IssueTypetbl]" 
                                 UpdateCommand="UPDATE [IssueTypetbl] SET [IssueType] = @IssueType, [IssueTypeDescription] = @IssueTypeDescription WHERE [IssueType_ID] = @IssueType_ID">
                                 <DeleteParameters>
                                     <asp:Parameter Name="IssueType_ID" Type="Int32" />
                                 </DeleteParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="IssueType" Type="String" />
                                     <asp:Parameter Name="IssueTypeDescription" Type="String" />
                                     <asp:Parameter Name="IssueType_ID" Type="Int32" />
                                 </UpdateParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="IssueType" Type="String" />
                                     <asp:Parameter Name="IssueTypeDescription" Type="String" />
                                 </InsertParameters>
                             </asp:SqlDataSource>
                        </asp:Panel>
              <asp:Panel ID="panelfaqTitle" runat="server" Height="30px" Width="750px">
             <img id="img1" src="App_Themes/CollapsiblePanel/images/issuetypeclose.png" Height="30px"  Width="750px"/></asp:Panel>
           <asp:Panel ID="panelfaqDetail" runat="server" Height="400px" 
                        Width="750px"  ScrollBars="Auto" >
                
                         <asp:GridView ID="gridfaq" runat="server" AutoGenerateColumns="False" 
                                 DataKeyNames="IDFaq" DataSourceID="SqlDataSourcefaq" 
                                 CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%"
                                 ShowFooter="True" EnableModelValidation="True" 
                                 onrowcommand="gridfaq_RowCommand">
                                 <RowStyle BackColor="#EFF3FB" />
                                 <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                    <FooterTemplate>
                                         <asp:Label ID="Labelfaqnew" runat="server" Text="Add New"></asp:Label>
                                      </FooterTemplate>
                                       <ItemTemplate>
                                        <asp:Label ID="Labelfaqid" runat="server" Text='<%# Bind("IDFaq") %>'></asp:Label>
                                      </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="50px" />
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Faq">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtFaq" runat="server" Text='<%# Bind("Faqs") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="Labelfaqs" runat="server" Text='<%# Bind("Faqs") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtFaqs" runat="server" />
                                      </FooterTemplate>
                                       <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Answer">
                                      <EditItemTemplate>
                                        <asp:TextBox ID="txtFaqsans" runat="server" Text='<%# Bind("Faqsans") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemTemplate>
                                        <asp:Label ID="lblFaqsans" runat="server" Text='<%# Bind("Faqsans") %>'></asp:Label>
                                      </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox ID="newtxtFaqsans" runat="server" />
                                      </FooterTemplate>
                                      <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"  Width="100px" Wrap="True"/>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Commands">
                    <ItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Edit" Text="Edit" CommandName="Edit" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Delete" Text="Delete" CommandName="Delete" /> 
                   
                    </ItemTemplate>
                 <EditItemTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Update" Text="Update" CommandName="Update" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="Cancel" />                                    
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button CssClass="submitButton" runat="server" ID="Insert" Text="Add" CommandName="InsertNew" />                
                    <asp:Button CssClass="submitButton" runat="server" ID="Cancel" Text="Cancel" CommandName="CancelNew" />                                    
                </FooterTemplate>
                    <FooterStyle VerticalAlign="Bottom" />
                    
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom"  Width="100px" />
                </asp:TemplateField>
                                  </Columns>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <EditRowStyle BackColor="#2461BF" />
                                 <AlternatingRowStyle BackColor="White" />
                             </asp:GridView>
                              
                         <asp:SqlDataSource ID="SqlDataSourcefaq" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                                 DeleteCommand="DELETE FROM [faqtbl] WHERE [IDFaq] = @IDFaq" 
                                 InsertCommand="INSERT INTO [faqtbl] ([Faqs], [Faqsans]) VALUES (@Faqs, @Faqsans)" 
                                 SelectCommand="SELECT * FROM [faqtbl]" 
                                 UpdateCommand="UPDATE [faqtbl] SET [Faqs] = @Faqs, [Faqsans] = @Faqsans WHERE [IDFaq] = @IDFaq">
                                 <DeleteParameters>
                                     <asp:Parameter Name="IDFaq" Type="Int32" />
                                 </DeleteParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="Faqs" Type="String" />
                                     <asp:Parameter Name="Faqsans" Type="String" />
                                     <asp:Parameter Name="IDFaq" Type="Int32" />
                                 </UpdateParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="Faqs" Type="String" />
                                     <asp:Parameter Name="Faqsans" Type="String" />
                                 </InsertParameters>
                             </asp:SqlDataSource>
                        </asp:Panel>
                        
                        
        </td>
        </tr>
        </table>
                </ContentTemplate>
        </cc1:TabPanel>
        
        
          <cc1:TabPanel ID="FAQtab" runat="server" HeaderText="FAQ">
         <ContentTemplate>
       <table width="98%">
        <tr>
        <td>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="IDFaq" 
                DataSourceID="SqlDataSourcefaqlist">
                <ItemTemplate>
                    <li style="background-color: #DCDCDC;color: #000000;">
                        
                        
                        <asp:Label ID="FaqsLabel" runat="server" Text='<%#Eval("Faqs") %>' />
                        <br />
                        
                        <asp:Label ID="FaqsansLabel" runat="server" Text='<%# Eval("Faqsans") %>' />
                        <br />
                    </li>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <li style="background-color: #FFF8DC;">
                                               
                        <asp:Label ID="FaqsLabel" runat="server" Text='<%#Eval("Faqs") %>' />
                        <br />
                        
                        <asp:Label ID="FaqsansLabel" runat="server" Text='<%# Eval("Faqsans") %>' />
                        <br />
                    </li>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">Faqs:
                        <asp:TextBox ID="FaqsTextBox" runat="server" Text='<%# Bind("Faqs") %>' />
                        <br />
                        Faqsans:
                        <asp:TextBox ID="FaqsansTextBox" runat="server" Text='<%# Bind("Faqsans") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </li>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <ul ID="itemPlaceholderContainer" runat="server" 
                        style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <li ID="itemPlaceholder" runat="server" />
                        </ul>
                        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </div>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <li style="background-color: #008A8C;color: #FFFFFF;">IDFaq:
                            <asp:Label ID="IDFaqLabel1" runat="server" Text='<%# Eval("IDFaq") %>' />
                            <br />
                            Faqs:
                            <asp:TextBox ID="FaqsTextBox" runat="server" Text='<%# Bind("Faqs") %>' />
                            <br />
                            Faqsans:
                            <asp:TextBox ID="FaqsansTextBox" runat="server" Text='<%# Bind("Faqsans") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </li>
                    </EditItemTemplate>
                    <ItemSeparatorTemplate>
                        <br />
                    </ItemSeparatorTemplate>
                    <SelectedItemTemplate>
                        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">IDFaq:
                            <asp:Label ID="IDFaqLabel" runat="server" Text='<%# Eval("IDFaq") %>' />
                            <br />
                            Faqs:
                            <asp:Label ID="FaqsLabel" runat="server" Text='<%# Eval("Faqs") %>' />
                            <br />
                            Faqsans:
                            <asp:Label ID="FaqsansLabel" runat="server" Text='<%# Eval("Faqsans") %>' />
                            <br />
                        </li>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourcefaqlist" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:kbConnectionString %>" 
                    SelectCommand="SELECT * FROM [faqtbl]"></asp:SqlDataSource>
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