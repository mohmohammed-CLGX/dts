<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Transactions.aspx.cs" ValidateRequest="false" Inherits="Transactions"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" href="App_Themes/datePicker.css" rel="stylesheet" />
    <link type="text/css" href="_assets/css/grid.css" rel="stylesheet" />
    <link type="text/css" href="StyleSheet.css" rel="stylesheet" />   
  
    <script language="javascript"  type="text/javascript">
        function OpenSearchResults(str) {
            var url = document.getElementById(str);

            window.open("http://" + url.value, "mywindow", 'width=300,height=200,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

        }

        function OpenUrlLinks() {
            var url = document.getElementById("<%=txtRelatedLinksnew.ClientID%>").value;

            var urls = url.split(",");
            var regexp = /(http|https|HTTP|HTTPS):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
            for (var i = 0; i < urls.length; i++) {

                if (regexp.test(urls[i])) {
                    // alert(urls[i]);
                    window.open(urls[i], "", 'width=900,height=600,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

                }
            }


        }

        function newstateselchange() {
            var ddlnewstate = document.getElementById("<%=ddlstate_countynew.ClientID%>");
            var Value = ddlnewstate.options[ddlnewstate.selectedIndex].value;
            var ddlfips = document.getElementById("<%=ddlfpisnew.ClientID%>");
            ddlfips.value = Value;
        }
        function newFipsselchange() {
            var ddlFips = document.getElementById("<%=ddlfpisnew.ClientID%>");
            var Value = ddlFips.options[ddlFips.selectedIndex].value;
            var ddlnewstate = document.getElementById("<%=ddlstate_countynew.ClientID%>");
            ddlnewstate.value = Value;

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
            
//            if (ddlstate.options[ddlstate.selectedIndex].value == "1") {
//                chkfips.disabled = true;
//                chkcountysch1.disabled = true;
//            }
//            else {
//                chkfips.disabled = false;
//                chkcountysch1.disabled = false;

//            }

        }
        function chkstate() {
            var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
            var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");

            var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
            var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");

            var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
            var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");

            var ddlcountyschajax = document.getElementById("<%=ddlcountyschajax.ClientID%>");



            if (chkstate.checked) { //ddlstate.style. = 'none';
                ddlstate.disabled = false;
                chkfips.disabled = true;
                chkcountysch1.disabled = true;
                
                ddlFips.disabled = false;
                ddlcountysch1.disabled = false;
                ddlcountysch1.style.visibility = "hidden";
                ddlcountyschajax.style.visibility = "visible";

               

            }
            else {
                // ddlstate.style.display = '';
                ddlstate.disabled = true;
                ddlstate.value = 0;

                chkfips.disabled = false;
                chkcountysch1.disabled = false;
                ddlFips.disabled = true;
                ddlcountysch1.disabled = true;
                ddlFips.value = 0;
                ddlcountysch1.value = 0;
                ddlcountysch1.style.visibility = "visible";
                ddlcountyschajax.style.visibility = "hidden";
                

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
                if (isddl == "yes")
                    childcontrol.value = 0;
                else
                    childcontrol.value = ""

            }
        }



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
   
  
    

   

   

    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1032px"
        Height="1000px">
        <cc1:TabPanel runat="server" HeaderText="Recent Issues" ID="RecentIssuestab">
            <HeaderTemplate>
                Recent Issues
            </HeaderTemplate>
            <ContentTemplate>
            
                <table>
                    <tr>
                        <td width="340px">
                            <asp:Panel ID="Panel11" runat="server" GroupingText="State/County" 
                                Font-Size="X-Small" Width="330px">
                                <asp:DropDownList ID="ddlRecentState" runat="server" 
                                    Width="150px"       AppendDataBoundItems="True"      Font-Size="X-Small">
                                </asp:DropDownList>
                                
                                <asp:DropDownList ID="ddlRecentCounty" runat="server"  Width="150px" AppendDataBoundItems="True"
                                    Font-Size="X-Small">
                                    
                                </asp:DropDownList>
                                
                               <cc1:CascadingDropDown ID="ccddRegion" runat="server" Category="State" TargetControlID="ddlRecentState"
        PromptText="-Select State-" LoadingText="Loading State.." ServicePath="statecounty.asmx"
        ServiceMethod="CountryRegion" Enabled="True">
    </cc1:CascadingDropDown>
    <cc1:CascadingDropDown ID="ccddState" runat="server" Category="STATE" TargetControlID="ddlRecentCounty"
        PromptText="-Select County-" LoadingText="Loading County.." ServicePath="statecounty.asmx"
        ServiceMethod="StateProvince" ParentControlID="ddlRecentState" Enabled="True">
    </cc1:CascadingDropDown>
                            </asp:Panel>
                        </td>
                       
                        <td width="250px">
                            <asp:Panel  GroupingText="Date" Width="250px" 
                                Font-Size="X-Small" ID="Panelfdt" runat="server">
                                <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" 
                                    ImageAlign="Middle" ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                <asp:TextBox ID="txtRecentFromdt" runat="server" Font-Size="X-Small" 
                                    MaxLength="10"  Width="55px" ></asp:TextBox>TO
                                    <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" 
                                    ImageAlign="Middle" ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                <asp:TextBox ID="txtRecentTodt" runat="server" Font-Size="X-Small" 
                                    MaxLength="10"  Width="55px" ></asp:TextBox>
                                <cc1:CalendarExtender ID="clxfdt" runat="server" Enabled="True" 
                                    PopupButtonID="ImageButton3" TargetControlID="txtRecentFromdt">
                                </cc1:CalendarExtender>
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" 
                                    PopupButtonID="ImageButton4" TargetControlID="txtRecentTodt">
                                </cc1:CalendarExtender>
                              
                            </asp:Panel>
                        </td>
                        <td width="100px">
                          <asp:Button runat="server" ID="btnrecentgo" Text="GO" 
                                onclick="btnrecentgo_Click" />
                        </td>
                    </tr>
                    </table>
       <table>
        <tr>
        <td>
            
            <asp:Panel ID="PanelRecentissue" runat="server"  Width="1000px" Height="380px"  
                GroupingText="Recent Issues" Font-Size="Small">
                       <div style="width:1000px; height:360px; overflow:auto;">
                       <asp:GridView ID="gvrecent" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="IDIssue"
              
                 OnRowCreated="gvrecent_RowCreated" 
                OnRowDataBound="gvrecent_RowDataBound" DataKeys="IDIssue" Width="1500px" >
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                <asp:HyperLinkField AccessibleHeaderText="HyperLink1"  Text="Select" 
                        HeaderImageUrl="~/img/select.png" >
                    <ControlStyle Font-Underline="True" />
                    </asp:HyperLinkField>
                    <asp:ImageField AccessibleHeaderText="select" NullImageUrl="~/img/select.png" 
                        ReadOnly="True">
                    </asp:ImageField> 
                    
                    <asp:BoundField DataField="IDIssue" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="IDIssue" />
                        <asp:BoundField DataField="IssueCreatedDate" dataformatstring="{0:MMM d, yyyy}" 
                        htmlencode="False" HeaderText="Created Date" 
                        SortExpression="IssueCreatedDate" >
                            <ItemStyle Width="130px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FIPSCounty" HeaderText="FIPS" 
                        SortExpression="FIPSCounty" />
                    <asp:BoundField DataField="County" HeaderText="County" 
                        SortExpression="County" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="FileType" HeaderText="File Type" 
                        SortExpression="FileType" >
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IssueType" HeaderText="Issue Type" 
                        SortExpression="IssueType">
                        <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ProcessingType" HeaderText="Processing Type" 
                        SortExpression="ProcessingType">
                   
                        <ItemStyle Width="250px" />
                    </asp:BoundField>
                   
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IssueDetails" HeaderText="Issue Details" 
                        SortExpression="IssueDetails" >
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                    <asp:BoundField DataField="Resolution" HeaderText="Resolution" 
                        SortExpression="Resolution" >
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                    <asp:BoundField DataField="Submitter" HeaderText="Submitter" 
                        SortExpression="Submitter" />
                         <asp:BoundField DataField="Edition" HeaderText="Edition" 
                        SortExpression="Edition" />
                    <asp:BoundField DataField="Version" HeaderText="Version" 
                        SortExpression="Version" />   
                    
                    <asp:BoundField DataField="IssueCreatedUser" HeaderText="Created User" 
                        SortExpression="IssueCreatedUser" />
                    
                </Columns>
            </asp:GridView>   
                        </div>      
                            </asp:Panel>
           </td>  
           </tr>
            <tr>
            <td>
         <asp:Panel ID="Panel14" runat="server" BackColor="LightGray" Height="600px" 
                Width="500px" >
               
               <table  >
                 <tr>
                 <td width="13px"></td>
                     <td>  
                            <asp:Label ID="Label1" runat="server" Text="Issue ID # :"/>
                     </td>
                     <td>       
                            <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label> 
                            <asp:HiddenField ID="hidCusCode" runat="server" /> 
                      </td>
                </tr>
                
                <tr>
              <td width="13px"></td>
                    <td>
                            <asp:Label ID="Label2" runat="server" Text="FIPS:"/> 
                    </td>
                    <td>
                            <asp:TextBox ID="txtpupfips" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td></td>
                  <td>
                            <asp:Label ID="Label3" runat="server" Text="State:"/> 
                    </td>
                    <td>
                            <asp:TextBox ID="txtpupstate" runat="server" ReadOnly="True"></asp:TextBox>
                            
                    </td>
                
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                            <asp:Label ID="Label4" runat="server" Text="County:"/> 
                    </td>
                    <td>
                    <asp:TextBox ID="txtpupcounty" runat="server" ReadOnly="True"></asp:TextBox> 
                    </td>
                </tr>
             
                <tr>
               <td width="13px"></td>
                    <td>
                             <asp:Label ID="Label5" runat="server" Text="Processing Type:"/> 
                    </td>
                    <td>
                            <asp:DropDownList ID="ddlpupptype" runat="server"    Width="200px" 
                                     DataSourceID="ProcessingTypeObjectDataSource" DataTextField="ProcessingType" 
                                     DataValueField="IDProcessingType"> 
                            </asp:DropDownList>
                    </td>
                </tr>
             
                <tr>
               <td width="13px"></td>
                    <td>
                    <asp:Label ID="lblftype" runat="server" Text="File Type:"/> 
                    </td>
                    <td>
                     <asp:DropDownList ID="ddlpupftype" runat="server"    Width="200px" 
                            DataSourceID="FileTypeObjectDataSource" DataTextField="FileType" 
                            DataValueField="IDFileType"> </asp:DropDownList>
                    </td>
                </tr>
                
                
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label7" runat="server" Text="Issue Type:"/> 
                    </td>
                    <td>
                      <asp:DropDownList ID="ddlpupitype" runat="server"    Width="200px" 
                            DataSourceID="IssueTypeObjectDataSource" DataTextField="IssueType" 
                            DataValueField="IDIssueType"> </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label8" runat="server" Text="Edition:"/> 
                    </td>
                    <td>
                      <asp:TextBox ID="txtpupEdition" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label9" runat="server" Text="Version:"/> 
                    </td>
                    <td>
                      <asp:TextBox ID="txtpupVersion" runat="server"></asp:TextBox> 
                    </td>
                </tr>
                <tr>
               <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label10" runat="server" Text="ICP:"/> 
                    </td>
                    <td>
                      <asp:TextBox ID="txtpupicp" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label11" runat="server" Text="Title:"/> 
                    </td>
                    <td>
                     <asp:TextBox ID="txtpuptitle" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label12" runat="server" Text="Submitter:"/> 
                    </td>
                    <td>
                     <asp:TextBox ID="txtpupSubmitter" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label13" runat="server" Text="RelatedLinks:"/> 
                    </td>
                    <td>
                     <asp:TextBox ID="txtpuprlinks" runat="server"  TextMode="MultiLine" 
                            Width="330px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
               <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label14" runat="server" Text="Issue Details:"/> 
                    </td>
                    <td>
                     <asp:TextBox ID="txtpupissue" runat="server" Rows="4" TextMode="MultiLine" 
                            Width="330px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
               <td width="13px"></td>
                    <td>
                    <asp:Label ID="Label15" runat="server" Text="Resolution:"/> 
                    </td>
                    <td>
                     <asp:TextBox ID="txtpupresolution" runat="server" Rows="4" Width="330px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                   <td width="13px"></td>
                    <td>
                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" /> 
                    </td>
                    <td>
                      <asp:Button ID="btncancel" runat="server" Text="Cancel" /> 
                    </td>
                </tr>
          
           
            </table>
        </asp:Panel> 
        
      
        </td>
        </tr>
        </table>
              <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel14" 
       TargetControlID="Panel14" 
    
       CancelControlID="btncancel"    OnCancelScript="HideModalPopup()" DropShadow="True" 
                   BackgroundCssClass="modal" DynamicServicePath="" Enabled="True" > </cc1:ModalPopupExtender>         
                    
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="SearchIssuestab" runat="server" HeaderText="Search Issues">
            <HeaderTemplate>
                Search Issues
            </HeaderTemplate>
            <ContentTemplate>
                <table style="width: 100%;" width="1000">
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
                            <asp:Panel ID="Panel4" runat="server" BackColor="#CCCCCC" GroupingText="Search by"
                                Font-Size="Smaller" Width="1000px">
                                <table style="width: 100%; height: 67px;">
                                    <tr>
                                        <td class="style6" style="height: 30px; width: 168px">
                                            <asp:CheckBox ID="chkstatesch" runat="server" Text="State" Font-Size="X-Small" />
                                        </td>
                                        <td class="style7" style="width: 123px; height: 30px">
                                            <asp:CheckBox ID="chkcountysch1" runat="server" Text="County" Font-Size="X-Small" />
                                        </td>
                                        <td style="width: 118px; height: 30px">
                                            <asp:CheckBox ID="chkFipssch" runat="server" Text="Fips" />
                                        </td>
                                        <td style="height: 30px">
                                            <asp:CheckBox ID="chkIssueTypesch" runat="server" Text="Issue Type" />
                                        </td>
                                        <td style="height: 30px">
                                            <asp:CheckBox ID="chkFilesch" runat="server" Text="File Type" />
                                        </td>
                                        <td style="height: 30px; width: 168px">
                                            <asp:CheckBox ID="chkProcessingsch" runat="server" Text="Processing Type" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style14" style="width: 168px">
                                            <asp:DropDownList ID="ddlstatesch" runat="server" DataSourceID="StateObjectDataSource"
                                                DataTextField="State" DataValueField="State" Width="150px" Enabled="False" AppendDataBoundItems="True"
                                                Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select State---"></asp:ListItem>
                                               <%-- <asp:ListItem Value="1" Text="Nation Wide"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="N/A"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style15" style="width: 123px">
                                            <asp:DropDownList ID="ddlcountysch1" runat="server" DataSourceID="FIPSObjectDataSource"
                                                DataTextField="County" DataValueField="StateCounty" Width="150px" Enabled="False"
                                                AppendDataBoundItems="True" Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                                 </asp:DropDownList>
                                                <asp:DropDownList ID="ddlcountyschajax" runat="server" 
                                               Width="150px"   Visible="true"  Font-Size="X-Small">
                                                                                              
                                            </asp:DropDownList>
                                            <cc1:CascadingDropDown ID="ccddStatesch" runat="server" Category="State" 
                                            TargetControlID="ddlcountyschajax"
                                             PromptText="-Select County-" LoadingText="Loading County.." ServicePath="statecounty.asmx"
                                             ServiceMethod="StateProvince" ParentControlID="ddlstatesch" Enabled="True">
                                            </cc1:CascadingDropDown>  
                                            
                                            
                                        </td>
                                        <td class="style16" style="width: 118px">
                                            <asp:DropDownList ID="ddlFipssch" runat="server" Width="80px" DataSourceID="FIPSObjectDataSource"
                                                DataTextField="FIPS" DataValueField="StateCounty" Enabled="False" AppendDataBoundItems="True"
                                                Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="N/A"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style16">
                                            <asp:DropDownList ID="ddlIssuetypesch" runat="server" Width="150px" DataSourceID="IssueTypeObjectDataSource"
                                                DataTextField="IssueType" DataValueField="IDIssueType" AppendDataBoundItems="True"
                                                Enabled="False" Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style16">
                                            <asp:DropDownList ID="ddlFileTypesch" runat="server" Width="150px" DataSourceID="FileTypeObjectDataSource"
                                                DataTextField="FileType" DataValueField="IDFileType" AppendDataBoundItems="True"
                                                Enabled="False" Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style16" style="width: 168px">
                                            <asp:DropDownList ID="ddlProcessingsch" runat="server" Width="150px" DataSourceID="ProcessingTypeObjectDataSource"
                                                DataTextField="ProcessingType" DataValueField="IDProcessingType" AppendDataBoundItems="True"
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
                            &nbsp;
                        </td>
                        <td class="style2">
                            <asp:Panel ID="Panel3" runat="server" BackColor="#CCCCCC" GroupingText="Search by"
                                Font-Size="Smaller" Width="1000px">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
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
                                            &nbsp;
                                        </td>
                                        <td class="style7">
                                            <asp:TextBox ID="txtEditionsch" runat="server" MaxLength="7" Width="75px" Enabled="False"
                                                Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRelatedICPsch" runat="server" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSubmittersch" runat="server" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" Width="20px" ImageUrl="~/App_Themes/calendar_icon.png"
                                                ImageAlign="Middle" />
                                            <asp:TextBox ID="txtfdatesch" runat="server" MaxLength="10" Width="55px" 
                                                Font-Size="X-Small"></asp:TextBox>TO
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfdatesch"
                                                PopupButtonID="ImageButton1" Enabled="True" />
                                            <asp:TextBox ID="txttdatesch" runat="server" MaxLength="10" Width="58px" Font-Size="X-Small" ></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txttdatesch"
                                                PopupButtonID="ImageButton2" Enabled="True" />
                                            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageAlign="Middle"
                                                ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="style2">
                            <asp:Panel ID="Panel5" runat="server" BackColor="#CCCCCC" GroupingText="Search by"
                                Font-Size="Smaller" Width="1000px">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td class="style7">
                                            <asp:CheckBox ID="chkIssuedetailsch" runat="server" Text="Issue details " />
                                        </td>
                                        <td>
                                            <asp:Panel ID="Panelwild" runat="server" GroupingText="Wildcard" Width="164px" Height="42px">
                                                <asp:DropDownList ID="ddlwildcsh" runat="server" Height="16px" Width="121px" Font-Size="X-Small">
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
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td class="style7" colspan="2">
                                            <asp:TextBox ID="txtchkIssuedetailsch" runat="server" Height="59px" TextMode="MultiLine"
                                                Width="492px" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtResolutionsch" runat="server" Height="58px" TextMode="MultiLine"
                                                Width="436px" Enabled="False" Font-Size="X-Small"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <tr>
                            <td colspan="2" align="right">
                                <asp:Button ID="btnsearch" runat="server" Font-Size="X-Small" Text="Search" OnClick="btnsearch_Click" />
                            </td>
                        </tr>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Panel ID="Panel6" runat="server" ScrollBars="Auto" GroupingText="Search Result"
                                Font-Size="X-Small" Width="1000px" Height="400px">
                                <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" Font-Size="X-Small" ForeColor="#333333" GridLines="None" 
                                    OnRowCommand="GridViewResult_RowCommand" 
                                    OnRowCreated="GridViewResult_RowCreated" 
                                    OnRowDataBound="GridViewResult_RowDataBound" 
                                    OnSelectedIndexChanged="GridViewResult_SelectedIndexChanged" Visible="False" 
                                    Width="1300px">
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
                    </tr>
                   
                    <tr>
                        <td colspan="3">
                    </tr>
                </table>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="NewIssuetab" runat="server" HeaderText="New Issue" Width="1400px">
            <HeaderTemplate>
                New Issue</HeaderTemplate>
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" GroupingText="Add New" Font-Size="XX-Small">
                    <table style="width: 87%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="      " Font-Size="X-Small"></asp:Label>
                                <asp:Panel ID="Panel10" runat="server" GroupingText="State/County ">
                                    <asp:DropDownList ID="ddlstate_countynew" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="FIPSObjectDataSource" DataTextField="StateCounty" DataValueField="FIPS"
                                        Font-Size="X-Small" Width="200px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                            <td style="width: 109px">
                                <asp:Panel ID="PanelFips" runat="server" GroupingText="Fips">
                                    <asp:DropDownList ID="ddlfpisnew" runat="server" AppendDataBoundItems="True" DataSourceID="FIPSObjectDataSource"
                                        DataTextField="FIPS" DataValueField="FIPS" Font-Size="X-Small" Width="100px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="N/A" Value="00000"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="Panel12" runat="server" GroupingText="Processing Type" Width="225px">
                                    <asp:DropDownList ID="ddlProcessingtypenew" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="ProcessingTypeObjectDataSource" DataTextField="ProcessingType"
                                        DataValueField="IDProcessingType" Font-Size="X-Small" Width="200px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="Panel13" runat="server" GroupingText="File Type" Width="260px">
                                    <asp:DropDownList ID="ddlFileTypenew" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="FileTypeObjectDataSource" DataTextField="FileType" DataValueField="IDFileType"
                                        Font-Size="X-Small" Width="200px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                                <asp:Panel ID="PanelIssueType" runat="server" GroupingText="Issue Type">
                                    <asp:DropDownList ID="ddlIssueTypenew" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="IssueTypeObjectDataSource" DataTextField="IssueType" DataValueField="IDIssueType"
                                        Font-Size="X-Small" Width="200px">
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
                                                    Width="30px">N/A</asp:TextBox>
                                                <asp:RegularExpressionValidator ID="ValidatEditionnew" runat="server" ValidationExpression="^((N/A)|(100)|(\d{0,2}))$"
                                                    ErrorMessage="Edition should be in the range of 0-100 or N/A" Display="None"
                                                    ControlToValidate="txtEditionnew" />
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ValidatEditionnew"
                                                    Enabled="True" >
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </td>
                                        <td width="125">
                                            <asp:Panel ID="PanelVersion" runat="server" GroupingText="Version" Width="100px">
                                                <asp:TextBox ID="txtVersionnew" runat="server" Font-Size="X-Small" MaxLength="3"
                                                    Width="30px">N/A</asp:TextBox>
                                                <asp:RegularExpressionValidator ID="Validatversionnew" runat="server" ValidationExpression="^((N/A)|([0-9]|1[0-9]|2[0-5]))$"
                                                    ErrorMessage="Version should be in the range of 0-25 or N/A" Display="None" ControlToValidate="txtVersionnew" />
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="Validatversionnew"
                                                    Enabled="True" >
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </td>
                                        <td width="123">
                                            <asp:Panel ID="PanelRelatedICP" runat="server" GroupingText="Related ICP" Width="83px">
                                                <asp:TextBox ID="txtICPnew" runat="server" Font-Size="X-Small" MaxLength="5" Width="40px">N/A</asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td width="200">
                                            <asp:Panel ID="PanelTitle" runat="server" GroupingText="Title" Width="240px" Style="margin-left: 0px">
                                                <asp:TextBox ID="txtTitlenew" runat="server" Font-Size="X-Small" MaxLength="100"
                                                    Width="226px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" rowspan="2" valign="top">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Panel ID="PanelSubmitter" runat="server" GroupingText="Submitter">
                                    <asp:TextBox ID="txtSubmitternew" runat="server" Font-Size="X-Small" MaxLength="50"
                                        Width="200px"></asp:TextBox>
                                </asp:Panel>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Panel
                                    ID="Panel9" runat="server" GroupingText="Related Links">
                                    <asp:TextBox ID="txtRelatedLinksnew" runat="server" Font-Size="X-Small" Width="242px"></asp:TextBox>
                                    <asp:Button ID="Button3" runat="server" Font-Size="XX-Small" Text="Go To Link" 
                                        CausesValidation="False" UseSubmitBehavior="False"/>
                                </asp:Panel>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Panel ID="Panel15" runat="server" GroupingText="Upload File">
                                    <asp:FileUpload ID="FileUploadkb" runat="server" Width="312px" />
                                </asp:Panel>
                            </td>
                            <td colspan="2">
                                <asp:Panel ID="Panel7" runat="server" GroupingText="Issue Details">
                                    <asp:TextBox ID="txtIssueDetailsnew" runat="server" Font-Size="X-Small" Height="77px"
                                        TextMode="MultiLine" Width="572px"></asp:TextBox>
                                </asp:Panel>
                            </td>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="Panel8" runat="server" GroupingText="Resolution/Recommended Action">
                                        <asp:TextBox ID="txtResolutionnew" runat="server" Font-Size="X-Small" Height="66px"
                                            TextMode="MultiLine" Width="566px"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px" colspan="4" align="right">
                                    <br />
                                    <asp:Button ID="Button1" runat="server" Font-Size="X-Small" OnClick="Button1_Click"
                                        Text="Save" />
                                </td>
                            </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server"  GroupingText="Recently Added"
                   Width="1000px" Font-Size="X-Small" Height="400px" ScrollBars="Auto">
                    <asp:GridView ID="RecentIssuesgrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="IssueObjectDataSource" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="IDIssue" HeaderText="IDIssue" SortExpression="IDIssue" />
                            <asp:BoundField DataField="IssueCreatedDate" DataFormatString="{0:d}" HeaderText="Date"
                                SortExpression="IssueCreatedDate" />
                            <asp:BoundField DataField="FIPSCounty" HeaderText="FIPS" SortExpression="FIPSCounty" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                            <asp:BoundField DataField="IDProcessingType" HeaderText="IDProcessingType" SortExpression="IDProcessingType"
                                Visible="False" />
                            <asp:BoundField DataField="ProcessingType" HeaderText="Processing Type" SortExpression="ProcessingType" />
                            <asp:BoundField DataField="IDFileType" HeaderText="IDFileType" SortExpression="IDFileType"
                                Visible="False" />
                            <asp:BoundField DataField="FileType" HeaderText="File Type" SortExpression="FileType" />
                            <asp:BoundField DataField="IDIssueType" HeaderText="IDIssueType" SortExpression="IDIssueType"
                                Visible="False" />
                            <asp:BoundField DataField="IssueType" HeaderText="Issue Type" SortExpression="IssueType" />
                            <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" />
                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="IssueDetails" HeaderText="Details" SortExpression="IssueDetails" />
                            <asp:BoundField DataField="Resolution" HeaderText="Resolution" SortExpression="Resolution" />
                            <asp:BoundField DataField="Submitter" HeaderText="Submitter" SortExpression="Submitter" />
                            <asp:BoundField DataField="Relatedlink" HeaderText="Relatedlink" SortExpression="Relatedlink" />
                            <asp:BoundField DataField="ICP" HeaderText="ICP" SortExpression="ICP" />
                            <asp:BoundField DataField="IssueCreatedUser" HeaderText="IssueCreatedUser" SortExpression="IssueCreatedUser" />
                            <asp:BoundField DataField="IssueUpdatedDate" HeaderText="IssueUpdatedDate" SortExpression="IssueUpdatedDate"
                                Visible="False" />
                            <asp:BoundField DataField="IssueUpdatedUser" HeaderText="IssueUpdatedUser" SortExpression="IssueUpdatedUser"
                                Visible="False" />
                            <asp:CheckBoxField DataField="Isuplodedfile" HeaderText="Isuplodedfile" SortExpression="Isuplodedfile"
                                Visible="False" />
                            <asp:BoundField DataField="IDuploadedfile" HeaderText="IDuploadedfile" SortExpression="IDuploadedfile"
                                Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </asp:Panel>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="editMastertab" runat="server" HeaderText="Manipulate Master">
            <HeaderTemplate>
                Manipulate Master
            </HeaderTemplate>
            <ContentTemplate>
                <cc1:CollapsiblePanelExtender ID="cpeProcessing" runat="server" TargetControlID="panelProcessing"
                    ExpandControlID="panelProcessingTitle" CollapseControlID="panelProcessingTitle"
                    Collapsed="True" ImageControlID="imgProcessingTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/ProcessingClose.png"
                    CollapsedImage="App_Themes/CollapsiblePanel/images/processingtypeopen.png" SuppressPostBack="True"
                    Enabled="True">
                </cc1:CollapsiblePanelExtender>
                <cc1:CollapsiblePanelExtender ID="cpeFiletype" runat="server" TargetControlID="panelFiletype"
                    ExpandControlID="panelFiletypeTitle" CollapseControlID="panelFiletypeTitle" Collapsed="True"
                    ImageControlID="imgFiletypeTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/Filetypeclose.png"
                    CollapsedImage="App_Themes/CollapsiblePanel/images/filetypeopen.png" SuppressPostBack="True"
                    Enabled="True">
                </cc1:CollapsiblePanelExtender>
                <cc1:CollapsiblePanelExtender ID="cpeIssuetype" runat="server" TargetControlID="panelIssuetypeDetail"
                    ExpandControlID="panelIssuetypeTitle" CollapseControlID="panelIssuetypeTitle"
                    Collapsed="True" ImageControlID="imgIssuetypeTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/issuetypeclose.png"
                    CollapsedImage="App_Themes/CollapsiblePanel/images/issuetypeopen.png" SuppressPostBack="True"
                    Enabled="True">
                </cc1:CollapsiblePanelExtender>
                <cc1:CollapsiblePanelExtender ID="pefaq" runat="server" TargetControlID="panelfaqDetail"
                    ExpandControlID="panelfaqTitle" CollapseControlID="panelfaqTitle" Collapsed="True"
                    ImageControlID="img1" ExpandedImage="App_Themes/CollapsiblePanel/images/faqsclose.png"
                    CollapsedImage="App_Themes/CollapsiblePanel/images/faqsopen.png" SuppressPostBack="True"
                    Enabled="True">
                </cc1:CollapsiblePanelExtender>
                <table width="100%" style="height: 90%">
                    <tr valign="top">
                        <td width="10%">
                        </td>
                        <td width="70%">
                            <asp:Panel ID="panelProcessingTitle" runat="server" Height="30px" Width="750px">
                                <img id="imgProcessingTitle" src="App_Themes/CollapsiblePanel/images/ProcessingClose.png"
                                    height="30px" width="750px" /></asp:Panel>
                            <asp:Panel ID="panelProcessing" runat="server" Height="400px" Width="750px" ScrollBars="Auto">
                                <asp:GridView ID="gridprocessingtype" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="IDProcessingType" DataSourceID="ProcessingTypeObjectDataSource"
                                    CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%" ShowFooter="True"
                                    EnableModelValidation="True" OnRowCommand="gridprocessingtype_RowCommand">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <FooterTemplate>
                                                <asp:Label ID="Labelnew" runat="server" Text="Add New"></asp:Label>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Labelprocid" runat="server" Text='<%# Bind("IDProcessingType") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" Wrap="True" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </asp:Panel>
                            <asp:Panel ID="panelFiletypeTitle" runat="server" Height="30px" Width="750px">
                                <img id="imgFiletypeTitle" src="App_Themes/CollapsiblePanel/images/Filetypeclose.png"
                                    height="30px" width="750px" /></asp:Panel>
                            <asp:Panel ID="panelFiletype" runat="server" Height="400px" Width="750px" ScrollBars="Auto">
                                <asp:GridView ID="gridFileType" runat="server" AutoGenerateColumns="False" DataKeyNames="IDFileType"
                                    DataSourceID="SqlDataSourceFileType" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" OnRowCommand="gridFileType_RowCommand">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <FooterTemplate>
                                                <asp:Label ID="Labelnewfid" runat="server" Text="Add New"></asp:Label>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Labelfileid" runat="server" Text='<%# Bind("IDFileType") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" Wrap="True" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceFileType" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                    DeleteCommand="DELETE FROM [FileType] WHERE [IDFileType] = @IDFileType" InsertCommand="INSERT INTO [FileType] ([FileType], [FileTypeDescription]) VALUES (@FileType, @FileTypeDescription)"
                                    SelectCommand="SELECT * FROM [FileType]" UpdateCommand="UPDATE [FileType] SET [FileType] = @FileType, [FileTypeDescription] = @FileTypeDescription WHERE [IDFileType] = @IDFileType">
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
                                <img id="imgIssuetypeTitle" src="App_Themes/CollapsiblePanel/images/issuetypeclose.png"
                                    height="30px" width="750px" /></asp:Panel>
                            <asp:Panel ID="panelIssuetypeDetail" runat="server" Height="400px" Width="750px"
                                ScrollBars="Auto">
                                <asp:GridView ID="gridissuetype" runat="server" AutoGenerateColumns="False" DataKeyNames="IDIssueType"
                                    DataSourceID="SqlDataSourceIssuetype" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" OnRowCommand="gridissuetype_RowCommand">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <FooterTemplate>
                                                <asp:Label ID="Labelissuenew" runat="server" Text="Add New"></asp:Label>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Labelissueid" runat="server" Text='<%# Bind("IDIssueType") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" Wrap="True" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceIssuetype" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                    DeleteCommand="DELETE FROM [IssueTypetbl] WHERE [IDIssueType] = @IDIssueType"
                                    InsertCommand="INSERT INTO [IssueTypetbl] ([IssueType], [IssueTypeDescription]) VALUES (@IssueType, @IssueTypeDescription)"
                                    SelectCommand="SELECT [IDIssueType],[IssueType],[IssueTypeDescription] FROM [IssueTypetbl]"
                                    UpdateCommand="UPDATE [IssueTypetbl] SET [IssueType] = @IssueType, [IssueTypeDescription] = @IssueTypeDescription WHERE [IDIssueType] = @IDIssueType">
                                    <DeleteParameters>
                                        <asp:Parameter Name="IDIssueType" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="IssueType" Type="String" />
                                        <asp:Parameter Name="IssueTypeDescription" Type="String" />
                                        <asp:Parameter Name="IDIssueType" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="IssueType" Type="String" />
                                        <asp:Parameter Name="IssueTypeDescription" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </asp:Panel>
                            <asp:Panel ID="panelfaqTitle" runat="server" Height="30px" Width="750px">
                                <img id="img1" src="App_Themes/CollapsiblePanel/images/faqsclose.png" height="30px"
                                    width="750px" /></asp:Panel>
                            <asp:Panel ID="panelfaqDetail" runat="server" Height="400px" Width="750px" ScrollBars="Auto">
                               <asp:GridView ID="gridfaq" runat="server" AutoGenerateColumns="False" DataKeyNames="IDfaq"
                                    DataSourceID="SqlDataSourcefaq" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" OnRowCommand="gridfaq_RowCommand">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <FooterTemplate>
                                                <asp:Label ID="lblAddnew" runat="server" Text="Add New"></asp:Label>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblIDFaq" runat="server" Text='<%# Bind("IDFaq") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Processing Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFaqs" runat="server" Text='<%# Bind("Faqs") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblFaqs" runat="server" Text='<%# Bind("Faqs") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="newtxtFaqs" runat="server" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFaqsans" runat="server" Text='<%# Bind("Faqsans") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblFaqsans" runat="server" Text='<%# Bind("Faqsans") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="newtxtFaqsans" runat="server" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" Wrap="True" />
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
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                
                                <asp:SqlDataSource ID="SqlDataSourcefaq" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                    DeleteCommand="DELETE FROM [faqtbl] WHERE [IDFaq] = @IDFaq" 
                                    InsertCommand="INSERT INTO [faqtbl] ([Faqs], [Faqsans]) VALUES (@Faqs, @Faqsans)"
                                    SelectCommand="SELECT * FROM [faqtbl]" UpdateCommand="UPDATE [faqtbl] SET [Faqs] = @Faqs, [Faqsans] = @Faqsans WHERE [IDFaq] = @IDFaq">
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
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="IDFaq" DataSourceID="SqlDataSourcefaqlist">
                                <ItemTemplate>
                                    <li style="background-color: #DCDCDC; color: #000000;">
                                        <asp:Label ID="FaqsLabel" runat="server" Text='<%#Eval("Faqs") %>' />
                                        <br />
                                        <asp:Label ID="FaqsansLabel" runat="server" Text='<%# Eval("Faqsans") %>' />
                                        <br />
                                    </li>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <li id="itemPlaceholder" runat="server" />
                                    </ul>
                                    <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                                        color: #000000;">
                                    </div>
                                </LayoutTemplate>
                                <AlternatingItemTemplate>
                                    <li style="background-color: #FFF8DC;">
                                        <asp:Label ID="FaqsLabel" runat="server" Text='<%#Eval("Faqs") %>' />
                                        <br />
                                        <asp:Label ID="FaqsansLabel" runat="server" Text='<%# Eval("Faqsans") %>' />
                                        <br />
                                    </li>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <li style="background-color: #008A8C; color: #FFFFFF;">IDFaq:
                                        <asp:Label ID="IDFaqLabel1" runat="server" Text='<%# Eval("IDFaq") %>' />
                                        <br />
                                        Faqs:
                                        <asp:TextBox ID="FaqsTextBox" runat="server" Text='<%# Bind("Faqs") %>' />
                                        <br />
                                        Faqsans:
                                        <asp:TextBox ID="FaqsansTextBox" runat="server" Text='<%# Bind("Faqsans") %>' />
                                        <br />
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </li>
                                </EditItemTemplate>
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
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </li>
                                </InsertItemTemplate>
                                <ItemSeparatorTemplate>
                                    <br />
                                </ItemSeparatorTemplate>
                                <SelectedItemTemplate>
                                    <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">IDFaq:
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
                            <asp:SqlDataSource ID="SqlDataSourcefaqlist" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                SelectCommand="SELECT * FROM [faqtbl]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
    <asp:ObjectDataSource ID="FIPSObjectDataSource" runat="server" SelectMethod="getCountylist"
        TypeName="KBDAL.DBConnectionsKB"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="FaqObjectDataSource" runat="server" InsertMethod="insertFaqs"
        SelectMethod="getfaqslist" TypeName="KBDAL.DBConnectionsKB" DeleteMethod="deleteFaqs"
        UpdateMethod="updateFaqs">
        <DeleteParameters>
            <asp:Parameter Name="IDFaq" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDFaq" Type="Int32" />
            <asp:Parameter Name="Faqs" Type="String" />
            <asp:Parameter Name="Faqsans" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="strFaqs" Type="String" />
            <asp:Parameter Name="strFaqsans" Type="String" />
            <asp:Parameter Name="dtCreateddate" Type="DateTime" />
            <asp:Parameter Name="iCreateduser" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="FileTypeObjectDataSource" runat="server" InsertMethod="insertFileType"
        SelectMethod="getFileTypelist" TypeName="KBDAL.DBConnectionsKB">
        <InsertParameters>
            <asp:Parameter Name="strFileType" Type="String" />
            <asp:Parameter Name="strFileTypeDescription" Type="String" />
            <asp:Parameter Name="dtCreateddate" Type="DateTime" />
            <asp:Parameter Name="iCreateduser" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="IssueTypeObjectDataSource" runat="server" InsertMethod="insertIssueType"
        SelectMethod="getIssueTypelist" TypeName="KBDAL.DBConnectionsKB">
        <InsertParameters>
            <asp:Parameter Name="strIssueType" Type="String" />
            <asp:Parameter Name="strIssueTypeDescription" Type="String" />
            <asp:Parameter Name="dtCreateddate" Type="DateTime" />
            <asp:Parameter Name="iCreateduser" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProcessingTypeObjectDataSource" runat="server" InsertMethod="insertProcessingType"
        SelectMethod="getCProcessingTypelist" TypeName="KBDAL.DBConnectionsKB" DeleteMethod="deleteProcessingType"
        UpdateMethod="updateProcessingType">
        <DeleteParameters>
            <asp:Parameter Name="IDProcessingType" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDProcessingType" Type="Int32" />
            <asp:Parameter Name="ProcessingType" Type="String" />
            <asp:Parameter Name="ProcessingTypeDescription" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="strProcessingType" Type="String" />
            <asp:Parameter Name="strProcessingTypeDescription" Type="String" />
            <asp:Parameter Name="dtCreateddate" Type="DateTime" />
            <asp:Parameter Name="iCreateduser" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="IssueObjectDataSource" runat="server" SelectMethod="getIssueslist"
        TypeName="KBDAL.DBConnectionsKB"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="StateObjectDataSource" runat="server" SelectMethod="getStatelist"
        TypeName="KBDAL.DBConnectionsKB"></asp:ObjectDataSource>
</asp:Content>
