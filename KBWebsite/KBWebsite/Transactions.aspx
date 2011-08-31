<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Transactions.aspx.cs" ValidateRequest="false" Inherits="Transactions"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <style type="text/css">
     .cpHeader
        {
            color: white;
            background-color: #719DDB;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 12px;
            cursor: pointer;
            width:450px;
            height:18px;
            padding: 4px;           
        }
        .pBOdy
        {
            border-top:solid 2px #719DDB;
        }
        </style>
  

    <script language="javascript" type="text/javascript">


        function fipsschonchange() {



            var ddlfipsschvalue = document.getElementById("<%=ddlfipssch.ClientID%>")
            if (ddlfipsschvalue.selectedIndex > 0) {
                WebService.getstatefromfips(ddlfipsschvalue.value, setstate);
            }
            else {
                var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
                var ddlcounty = document.getElementById("<%=ddlcountysch.ClientID%>");
                var txt = document.getElementById("<%=txtcountysch.ClientID%>");
                ddlstate.selectedIndex = 0;
                ddlstate.disabled = false;
                ddlcounty.style.display = "";
                ddlcounty.disabled = true;
                ddlcounty.selectedIndex = 0;
                txt.style.display = 'none'
                txt.value = "";
            }


        }
        function setstate(state) {
            var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
            var ddlcounty = document.getElementById("<%=ddlcountysch.ClientID%>");

            var txt = document.getElementById("<%=txtcountysch.ClientID%>");
            var ddlfipsschvalue = document.getElementById("<%=ddlfipssch.ClientID%>").value;
            // document.getElementById("sel").value = 3
            var mySplitResult = state.split(";");
            ddlstate.value = mySplitResult[0];
            //ddlcounty.value = ddlfipsschvalue;
            ddlstate.disabled = true;
            ddlcounty.style.display = 'none';
            txt.style.display = "";
            txt.value = mySplitResult[1];

        }
        function OpenSearchResults(str) {
            var url = document.getElementById(str);

            window.open("http://" + url.value, "mywindow", 'width=300,height=200,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

        }

        function OpenUrlLinks() {
            var url = document.getElementById("<%=txtRelatedLinksnew.ClientID%>").value;

            var urls = url.split(",");
             var regexp = /(http|https|HTTP|HTTPS|Http|Https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/

           // var regexp = new RegExp("^(((h|H?)(t|T?)(t|T?)(p|P?)(s|S?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]*$");
            for (var i = 0; i < urls.length; i++) {

                var urltemp=urls[i].replace("www.", "").replace("WWW.","");
                if (regexp.test(urltemp)) {
                    // alert(urls[i]);
                    window.open(urltemp, "", 'width=900,height=600,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

                }
                else {
                    alert("URL not in correct format :" + urls[i]);
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



        function countyselchange() {
            var ddlcounty = document.getElementById("<%=ddlcountysch.ClientID%>");
            var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
            var Text = ddlcounty.options[ddlcounty.selectedIndex].text;
            var Value = ddlcounty.options[ddlcounty.selectedIndex].value;

            ddlstate.value = ddlcounty.options[ddlcounty.selectedIndex].value.split(" ")[0];

            //alert("county :" + Value);

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
    


    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" Width="1032px"
        Height="1000px" onactivetabchanged="TabContainer1_ActiveTabChanged" >
        <cc1:TabPanel runat="server" HeaderText="Recent Issues" ID="RecentIssuestab">
            <HeaderTemplate>
                Recent Issues
            </HeaderTemplate>
            <ContentTemplate>
                <table><tr><td align="left">
              <asp:Label ID="lblerrrecent" runat="server"  ForeColor="Red" Font-Size="Smaller"></asp:Label>
              <asp:Label ID="lblmsgrecent" runat="server" ForeColor="Green" Font-Size="X-Small" ></asp:Label>
            
            </td></tr></table>
                <table>
                    <tr>
                        <td width="340px">
                            <asp:Panel ID="Panel11" runat="server" GroupingText="State/County" Font-Size="X-Small"
                                Width="330px">
                                <asp:DropDownList ID="ddlRecentState" runat="server" Width="150px" AppendDataBoundItems="True"
                                    Font-Size="X-Small">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlRecentCounty" runat="server" Width="150px" AppendDataBoundItems="True"
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
                            <asp:Panel GroupingText="Date" Width="250px" Font-Size="X-Small" ID="Panelfdt" runat="server">
                                <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" ImageAlign="Middle"
                                    ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                <asp:TextBox ID="txtRecentFromdt" runat="server" Font-Size="X-Small" MaxLength="10"
                                    Width="55px"></asp:TextBox>TO
                                <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ImageAlign="Middle"
                                    ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                <asp:TextBox ID="txtRecentTodt" runat="server" Font-Size="X-Small" MaxLength="10"
                                    Width="55px"></asp:TextBox>
                                <cc1:CalendarExtender ID="clxfdt" runat="server" Enabled="True" PopupButtonID="ImageButton3"
                                    TargetControlID="txtRecentFromdt">
                                </cc1:CalendarExtender>
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" PopupButtonID="ImageButton4"
                                    TargetControlID="txtRecentTodt">
                                </cc1:CalendarExtender>
                                
                                
                                <asp:RegularExpressionValidator ID="regFromDate" 
                    runat="server" ErrorMessage="Please enter a date in mm-dd-yyyy format." 
                    ControlToValidate="txtRecentFromdt" Display="None" ValidationExpression="([1-9]|0[1-9]|1[012])([-]|[/])([1-9]|0[1-9]|[12][0-9]|3[01])([-]|[/])(19|20)\d\d"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="cmpInvalidFromDate_vldCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="regFromDate">
                    </cc1:ValidatorCalloutExtender>                    
                    <asp:RegularExpressionValidator ID="regToDate" 
                    runat="server" ErrorMessage="Please enter a date in mm-dd-yyyy format." 
                    ControlToValidate="txtRecentTodt" Display="None" ValidationExpression="([1-9]|0[1-9]|1[012])([-]|[/])([1-9]|0[1-9]|[12][0-9]|3[01])([-]|[/])(19|20)\d\d"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="cmpInvalidToDate_vldCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="regToDate">
                    </cc1:ValidatorCalloutExtender>
                    
                    
                    <!-- Calendar - From date cannot be greater than To date validation -->                                    
                    <asp:CompareValidator ID="cmpValidatorDate" runat="server" ControlToCompare="txtRecentFromdt" 
                    ControlToValidate="txtRecentTodt" Operator="GreaterThanEqual" Type="Date" Display="None" 
                    ErrorMessage="From Date cannot be greater than To Date"  ></asp:CompareValidator> 
                    <cc1:ValidatorCalloutExtender ID="cmpValidatorDate_vldCalloutExtender"
                    runat="server" Enabled="True" TargetControlID="cmpValidatorDate">
                    </cc1:ValidatorCalloutExtender> 
                    
                    
                    
                    
                    
                            </asp:Panel>
                        </td>
                        <td width="100px">
                            <asp:Button runat="server" ID="btnrecentgo" Text="GO" OnClick="btnrecentgo_Click" Font-Size="X-Small" />
                            <asp:Button ID="btnrecentclear" runat="server" Font-Size="X-Small" 
                                onclick="btnrecentclear_Click" Text="Clear" enable="false"/>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="PanelRecentissue" runat="server" Width="1000px" Height="390px" GroupingText="Recent Issues"
                                Font-Size="X-Small">
                                <div style="width:940px;height:500px;overflow:auto; ">
                                    
                  <asp:ListView ID="gvrecent" runat="server" 
                onitemdatabound="gvrecent_ItemDataBound">
        <LayoutTemplate >
        <asp:PlaceHolder id="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
       
         <table>
         <tr>
         <td>
          <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader" Width="300px" Height="100%">
         <asp:Image ID="img" runat="server" ImageUrl="~/images/collapse.jpg" />
               <%-- <asp:Label ID="lblText" runat="server" />--%>
               <asp:Label ID="lblTitle1" runat="server"><%#Eval("State")%>\<%#Eval("County")%>\<%#Eval("FIPSCounty")%>\<%#Eval("IssueCreatedDate")%>\<%#Eval("Submitter")%></asp:Label>
               </asp:Panel>
         </td>
         </tr>
         <tr>
         <td>
        
         </td>
         <td>
          <asp:Panel ID="pBody" runat="server" CssClass="pBOdy" >
           <div style="overflow:auto; height:150px;width:500px;" >  
          
           <table width="500px">
           <tr>
           <td>
          <asp:HyperLink ID="lnkDisplay" runat="server" NavigateUrl="#">Select</asp:HyperLink>
           <table>
           <tr>
           <td >
          Issue Type:
           </td>
           
           
           <td>
           <%#Eval("IssueType")%>
           </td>
           </tr>
            <tr>
           <td>
          Processing Type:
           </td>
                  
           <td>
           <%#Eval("ProcessingType")%>
           </td>
           </tr>
            <tr>
           <td>
          File Type:
           </td>
                
           <td>
           <%#Eval("FileType")%>
           </td>
           </tr>
           <tr>
           <td>
          Issue Details:
           </td>
           </tr>
           <tr>
           <td>
           <%#Eval("IssueDetails")%>
           </td>
           </tr>
            <tr>
           <td>
           Resolution:
           </td>
           </tr>
           <tr>
           <td>
           <%#Eval("Resolution")%>
           </td>
           </tr>
           </table>          
           </td>
           </tr>
           </table>
            </div>
            </asp:Panel>
            <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pBody" CollapseControlID="img" 
            ExpandControlID="img"
Collapsed="false" TextLabelID=""
ExpandedImage="~/images/collapse.jpg"
    CollapsedImage="~/images/expand.jpg" ImageControlID="img"
CollapsedSize="0">
            </cc1:CollapsiblePanelExtender>
         </td>
         </tr>
         
         </table>
            
           <%-- </asp:Panel>--%>
         </ItemTemplate>
</asp:ListView>

           
    
                                </div>
                                
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
             <asp:Panel ID="Panel14" runat="server" BackColor="LightGray" Height="418px" GroupingText="Recent Issue Detail view"
        Width="100%">
                                <table>                                   
                                   
                                    
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel ID="pnlIssueId" runat="server" GroupingText="IssueId" Width="166px">
                                         <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
                                            <asp:HiddenField ID="hidCusCode" runat="server" /> 
                                        </asp:Panel>
                                         
                                        </td>
                                        <td style="width: 304px">
                                            <asp:Panel ID="pnlFips" runat="server" GroupingText="FIPS:" Width="140px">
                                            <asp:TextBox ID="txtpupfips" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel ID="pnlState" runat="server" GroupingText="State:" Width="189px">
                                         <asp:TextBox ID="txtpupstate" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox></asp:Panel>
                                            
                                           
                                        </td>
                                        <td>
                                           <asp:Panel runat="server" ID="pnlCountry" GroupingText="Country:">
                                           <asp:TextBox ID="txtpupcounty" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                           </asp:Panel>
                                           
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                         <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="pnlProcessingType" GroupingText="Processing Type:" 
                                                Width="219px">
                                          
                                            <asp:DropDownList ID="ddlpupptype" runat="server" 
                                                DataSourceID="ProcessingTypeObjectDataSource" DataTextField="ProcessingType" 
                                                DataValueField="IDProcessingType" Width="200px" >
                                            </asp:DropDownList></asp:Panel>
                                         </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="pnlFileType" GroupingText="File Type:" Width="181px">
                                        <asp:DropDownList ID="ddlpupftype" runat="server" 
                                                DataSourceID="FileTypeObjectDataSource" DataTextField="FileType" 
                                                DataValueField="IDFileType" Width="174px" >
                                            </asp:DropDownList>
                                        </asp:Panel>
                                            
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="pnlIssueType" runat="server" GroupingText="Issue Type:" 
                                                 Width="204px">
                                          <asp:DropDownList ID="ddlpupitype" runat="server" 
                                                 DataSourceID="IssueTypeObjectDataSource" DataTextField="IssueType" 
                                                 DataValueField="IDIssueType" Width="200px">
                                             </asp:DropDownList>
                                         </asp:Panel>
                                             
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="pnlEdition" runat="server" GroupingText="Edition:">
                                         <asp:TextBox ID="txtpupEdition" runat="server"></asp:TextBox>
                                         </asp:Panel>
                                             
                                             
                                         </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="pnlVersion" GroupingText="Version:" Width="150px">
                                         <asp:TextBox ID="txtpupVersion" runat="server"></asp:TextBox>
                                        </asp:Panel>
                                           
                                           
                                        </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="pnlICP" GroupingText="ICP:" Width="136px">
                                            
                                            <asp:TextBox ID="txtpupicp" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="pnlTitle" GroupingText="Title:" Width="201px">
                                          
                                            <asp:TextBox ID="txtpuptitle" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="pnlSubmitter" GroupingText="Submitter:">
                                            
                                            <asp:TextBox ID="txtpupSubmitter" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="4">
                                        <table>
                                        <tr>
                                        <td>
                                        <asp:Panel runat="server" ID="pnlRelatedLinks" GroupingText="RelatedLinks:" 
                                                Width="100%">
                                         
                                            <asp:TextBox ID="txtpuprlinks" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True" TextMode="MultiLine" Width="342px" Height="60px"></asp:TextBox>
                                                </asp:Panel>
                                        </td>
                                        <td>
                                         <asp:Panel ID="pnlIssueDetails" runat="server" GroupingText="Issue Details:" 
                                                Width="100%">
                                                <asp:TextBox ID="txtpupissue" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="375px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        </tr>
                                        </table>
                                        
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px" style="height: 98px">
                                        </td>
                                        <td colspan="3" style="height: 98px">
                                            <asp:Panel ID="pnlResolution" runat="server" GroupingText="Resolution:" 
                                                Width="347px">
                                                <asp:TextBox ID="txtpupresolution" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="330px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtdownfile" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                            <asp:Button ID="btnrecentdown" runat="server" OnClick="btnrecentdown_Click" 
                                                Text="Download File" />
                                            <asp:HiddenField ID="hiduploadfileid" runat="server" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:Button ID="btnupdate" runat="server" OnClick="btnupdate_Click" 
                                                Text="Update" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                </table>
                            </asp:Panel>
                       
                        </td>
                    </tr>
                </table>
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel14"
                    TargetControlID="Panel14" CancelControlID="btncancel" OnCancelScript="HideModalPopup()"
                    DropShadow="True" BackgroundCssClass="modal" DynamicServicePath="" Enabled="True">
                </cc1:ModalPopupExtender>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="SearchIssuestab" runat="server" HeaderText="Search Issues">
            <HeaderTemplate>
                Search Issues
            </HeaderTemplate>
            <ContentTemplate>
            <table>
            
            <tr><td align="left">
                    <asp:Label ID="Errorsch" runat="server"  ForeColor="Red" Font-Size="Smaller"></asp:Label>
                            <asp:Label ID="MSGsch" runat="server" ForeColor="Green" Font-Size="X-Small" ></asp:Label>
                    </td></tr>
                    
            </table>
                <table style="width: 100%;" width="1000">
                    
                    <tr>
                        <td>
                        </td>
                        <td >
                            <asp:Panel ID="Panel4" runat="server" BackColor="#CCCCCC" GroupingText="Search by"
                                Font-Size="Smaller" Width="1000px">
                                <table style="width: 100%; height: 67px;">
                                    <tr>
                                        <td  style="width: 168px">
                                            <asp:Panel ID="panelstatecountysch" runat="server" GroupingText="State/County" Font-Size="X-Small"
                                                Width="330px">
                                                <asp:DropDownList ID="ddlstatesch" runat="server" Width="150px" AppendDataBoundItems="True"
                                                    Font-Size="X-Small">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlcountysch" runat="server" Width="150px" AppendDataBoundItems="True"
                                                    Font-Size="X-Small">
                                                </asp:DropDownList>
                                                <asp:TextBox ID="txtcountysch"   runat="server" Width="150px" 
                                                    Font-Size="X-Small" Enabled="False"></asp:TextBox>
                                                <cc1:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="State" TargetControlID="ddlstatesch"
                                                    PromptText="-Select State-" LoadingText="Loading State.." ServicePath="statecounty.asmx"
                                                    ServiceMethod="CountryRegion" Enabled="True">
                                                </cc1:CascadingDropDown>
                                                <cc1:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="STATE" TargetControlID="ddlcountysch"
                                                    PromptText="-Select County-" LoadingText="Loading County.." ServicePath="statecounty.asmx"
                                                    ServiceMethod="StateProvince" ParentControlID="ddlstatesch" Enabled="True">
                                                </cc1:CascadingDropDown>
                                            </asp:Panel>
                                            
                                           
                                            
                                        </td>
                                        <td  >
                                        </td>
                                        <td  style="width: 75px">
                                            <asp:Panel ID="Panelschfips" runat="server" GroupingText="Fips" Font-Size="X-Small">
                                          <asp:DropDownList ID="ddlfipssch" runat="server"  AppendDataBoundItems="True"
                                                   DataSourceID="FIPSObjectDataSource"
                                        DataTextField="FIPS" DataValueField="FIPS" Font-Size="X-Small" Width="75px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                        
                                    </asp:DropDownList></asp:Panel>
                                        </td>
                                        <td >
                                         <asp:Panel ID="PanelIssuetypesch" runat="server" GroupingText="Issue Type" Font-Size="X-Small">
                                            <asp:DropDownList ID="ddlIssuetypesch" runat="server" Width="150px" DataSourceID="IssueTypeObjectDataSource"
                                                DataTextField="IssueType" DataValueField="IDIssueType" AppendDataBoundItems="True"
                                                 Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                            </asp:DropDownList>
                                            </asp:Panel>
                                            
                                        </td>
                                        <td class="style16">
                                         <asp:Panel ID="PanelFileTypesch" runat="server" GroupingText="File Type" Font-Size="X-Small">
                                               <asp:DropDownList ID="ddlFileTypesch" runat="server" Width="150px" DataSourceID="FileTypeObjectDataSource"
                                                DataTextField="FileType" DataValueField="IDFileType" AppendDataBoundItems="True"
                                                Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                            </asp:DropDownList>
                                             </asp:Panel>
                                        </td>
                                        <td class="style16" style="width: 168px">
                                            <asp:Panel ID="PanelProcessingTypesch" runat="server" GroupingText="Processing Type" Font-Size="X-Small">
                                              <asp:DropDownList ID="ddlProcessingsch" runat="server" Width="150px" DataSourceID="ProcessingTypeObjectDataSource"
                                                DataTextField="ProcessingType" DataValueField="IDProcessingType" AppendDataBoundItems="True"
                                                 Font-Size="X-Small">
                                                <asp:ListItem Value="0" Text="---Select---"></asp:ListItem>
                                            </asp:DropDownList>
                                            </asp:Panel>
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
                            <asp:Panel ID="Panel3" runat="server" BackColor="#CCCCCC" Font-Size="Smaller" 
                                GroupingText="Search by" Width="1000px">
                                <table style="width: 100%; height:100%;">
                                    <tr>
                                        <td >
                                             <asp:Panel ID="Paneleditionsch" runat="server" Font-Size="X-Small" 
                                                GroupingText="Edition\version" Width="100px">
                                                <asp:TextBox ID="txtEditionsch" runat="server" Font-Size="X-Small" 
                                                    MaxLength="2" Width="15px"></asp:TextBox>
                                                \
                                                <asp:TextBox ID="txtVersionsch" runat="server" Font-Size="X-Small" 
                                                    MaxLength="2" Width="15px"></asp:TextBox>
                                                    
                                                    <asp:RegularExpressionValidator ID="ValidatEditionsch" runat="server" ValidationExpression="^(()|(N/A)|(100)|(\d{0,2}))$"
                                                    ErrorMessage="Edition should be in the range of 0-100 or N/A" Display="None"
                                                    ControlToValidate="txtEditionsch" />
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="ValidatEditionsch"
                                                    Enabled="True">
                                                </cc1:ValidatorCalloutExtender>
                                                
                                                 <asp:RegularExpressionValidator ID="Validatversionsch" runat="server" ValidationExpression="^(()|(N/A)|([0-9]|1[0-9]|2[0-5]))$"
                                                    ErrorMessage="Version should be in the range of 0-25 or N/A" Display="None" ControlToValidate="txtVersionsch" />
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="Validatversionsch"
                                                    Enabled="True">
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </td>
                                        <td >
                                            <asp:Panel ID="PanelIcpsch" runat="server" Font-Size="X-Small" 
                                                GroupingText="ICP" Width="60px">
                                                <asp:TextBox ID="txtRelatedICPsch" runat="server" Font-Size="X-Small" 
                                                    MaxLength="5" Width="40px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                           <asp:Panel ID="PanelSubmittersch" runat="server" Font-Size="X-Small" 
                                                GroupingText="Submitter" Width="125px">
                                                <asp:TextBox ID="txtSubmittersch" runat="server" Font-Size="X-Small"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            <asp:Panel ID="PanelDatesch" runat="server" Font-Size="X-Small" 
                                                GroupingText="Date" Width="220px">
                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                                                    ImageAlign="Middle" ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                                <asp:TextBox ID="txtfdatesch" runat="server" Font-Size="X-Small" MaxLength="10" 
                                                    Width="55px"></asp:TextBox>
                                                TO
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                    PopupButtonID="ImageButton1" TargetControlID="txtfdatesch">
                                                </cc1:CalendarExtender>
                                                <asp:TextBox ID="txttdatesch" runat="server" Font-Size="X-Small" MaxLength="10" 
                                                    Width="58px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" 
                                                    PopupButtonID="ImageButton2" TargetControlID="txttdatesch">
                                                </cc1:CalendarExtender>
                                                <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                                                    ImageAlign="Middle" ImageUrl="~/App_Themes/calendar_icon.png" Width="20px" />
                                                    
                                                    
                                                    <asp:RegularExpressionValidator ID="regFromDatesch" 
                    runat="server" ErrorMessage="Please enter a date in mm-dd-yyyy format." 
                    ControlToValidate="txtfdatesch" Display="None" ValidationExpression="([1-9]|0[1-9]|1[012])([-]|[/])([1-9]|0[1-9]|[12][0-9]|3[01])([-]|[/])(19|20)\d\d"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5"
                                    runat="server" Enabled="True" TargetControlID="regFromDatesch">
                    </cc1:ValidatorCalloutExtender>                    
                    <asp:RegularExpressionValidator ID="regToDatesch" 
                    runat="server" ErrorMessage="Please enter a date in mm-dd-yyyy format." 
                    ControlToValidate="txttdatesch" Display="None" ValidationExpression="([1-9]|0[1-9]|1[012])([-]|[/])([1-9]|0[1-9]|[12][0-9]|3[01])([-]|[/])(19|20)\d\d"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6"
                                    runat="server" Enabled="True" TargetControlID="regToDatesch">
                    </cc1:ValidatorCalloutExtender>
                    
                    
                    <!-- Calendar - From date cannot be greater than To date validation -->                                    
                    <asp:CompareValidator ID="cmpValidatorDatesch" runat="server" ControlToCompare="txtfdatesch" 
                    ControlToValidate="txttdatesch" Operator="GreaterThanEqual" Type="Date" Display="None" 
                    ErrorMessage="From Date cannot be greater than To Date"  ></asp:CompareValidator> 
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7"
                    runat="server" Enabled="True" TargetControlID="cmpValidatorDatesch">
                    </cc1:ValidatorCalloutExtender> 
                                            </asp:Panel> 
                                        </td>
                                        <td>
                                           <asp:Panel ID="pnlschTitle" runat="server" Font-Size="X-Small" 
                                                GroupingText="Title" Width="460px">
                                                <asp:Label ID="Label33" runat="server" Text="Wildcard"></asp:Label>
                                                                <asp:DropDownList ID="ddlwildcardstitlesch" runat="server" Font-Size="X-Small" 
                                                                    Height="16px" Width="121px">
                                                                    <asp:ListItem Value="0">---Select---</asp:ListItem>
                                                                    <asp:ListItem>Like</asp:ListItem>
                                                                    <asp:ListItem>Contains</asp:ListItem>
                                                                    <asp:ListItem>Not Like</asp:ListItem>
                                                                </asp:DropDownList>
                                                <asp:TextBox ID="txttitlesch" runat="server" Font-Size="X-Small" Width="250px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="style2">
                                <asp:Panel ID="Panel5" runat="server" BackColor="#CCCCCC" Font-Size="Smaller" 
                                    GroupingText="Search by" Width="1000px" Height="130px">
                                    <table style="width: 100%; height: 100%;">
                                        <tr>
                                            <td class="style7">
                                                <asp:Panel ID="PanelIssuesch" runat="server" GroupingText="Issue Detail" 
                                                    Height="75px" Width="520px">
                                                    <table>
                                                        <tr>
                                                            <td Width="164px">
                                                                <asp:Label ID="Label17" runat="server" Text="Wildcard"></asp:Label>
                                                                <asp:DropDownList ID="ddlwildcsh" runat="server" Font-Size="X-Small" 
                                                                    Height="16px" Width="121px">
                                                                    <asp:ListItem Value="0">---Select---</asp:ListItem>
                                                                    <asp:ListItem>Like</asp:ListItem>
                                                                    <asp:ListItem>Contains</asp:ListItem>
                                                                    <asp:ListItem>Not Like</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtIssuedetailsch" runat="server" Font-Size="X-Small" 
                                                                    Height="59px" TextMode="MultiLine" Width="492px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:Panel ID="PanelResolutionsch" runat="server" GroupingText="Resolution" 
                                                    Height="75px" Width="460px">
                                                    <table>
                                                        <tr>
                                                            <td Width="164px">
                                                                <asp:Label ID="Label32" runat="server" Text="Wildcard"></asp:Label>
                                                                <asp:DropDownList ID="ddlwildcardsresolutionsch" runat="server" Font-Size="X-Small" 
                                                                    Height="16px" Width="121px">
                                                                    <asp:ListItem Value="0">---Select---</asp:ListItem>
                                                                    <asp:ListItem>Like</asp:ListItem>
                                                                    <asp:ListItem>Contains</asp:ListItem>
                                                                    <asp:ListItem>Not Like</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtResolutionsch" runat="server" Font-Size="X-Small" 
                                                                    Height="58px" TextMode="MultiLine" Width="436px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="right" colspan="3" width="600px">
                                <asp:RadioButtonList ID="radioandor" runat="server" 
                                    RepeatDirection="Horizontal"  Font-Size="X-Small"  >
                                 <asp:listitem value="And" />
                                    <asp:listitem value="Or" />
                                </asp:RadioButtonList>
                           
                                <asp:Button ID="btnsearch" runat="server" Font-Size="X-Small" 
                                    OnClick="btnsearch_Click" Text="Search" />
                                    <asp:Button ID="btnschclear" runat="server" Font-Size="X-Small" 
                                    OnClick="btnschclear_Click" Text="Clear" />
                            </td>
                        </tr>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <asp:Panel ID="Panel6" runat="server" Font-Size="X-Small" 
                                GroupingText="Search Result" Height="390px" Width="1000px">
                                <div style="width: 980px; height: 380px; overflow: auto;">
                                    <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeys="IDIssue" Font-Size="X-Small" ForeColor="#333333" 
                                        GridLines="None" OnRowDataBound="GridViewResult_RowDataBound" 
                                        Width="1500px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:HyperLinkField AccessibleHeaderText="HyperLink1" 
                                                HeaderImageUrl="~/img/select.png" Text="Select">
                                                <ControlStyle Font-Underline="True" />
                                            </asp:HyperLinkField>
                                            <asp:ImageField AccessibleHeaderText="select" NullImageUrl="~/img/select.png" 
                                                ReadOnly="True">
                                            </asp:ImageField>
                                            <asp:BoundField DataField="IDIssue" HeaderText="ID" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="IDIssue" />
                                            <asp:BoundField DataField="IssueCreatedDate" DataFormatString="{0:MMM d, yyyy}" 
                                                HeaderText="Created Date" HtmlEncode="False" SortExpression="IssueCreatedDate">
                                                <ItemStyle Width="130px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FIPSCounty" HeaderText="FIPS" 
                                                SortExpression="FIPSCounty" />
                                            <asp:BoundField DataField="County" HeaderText="County" 
                                                SortExpression="County" />
                                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                            <asp:BoundField DataField="FileType" HeaderText="File Type" 
                                                SortExpression="FileType">
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
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="IssueDetails" HeaderText="Issue Details" 
                                                SortExpression="IssueDetails">
                                                <ItemStyle Width="300px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Resolution" HeaderText="Resolution" 
                                                SortExpression="Resolution">
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
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                            CssClass="HeaderStyle" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                             <asp:Panel ID="panalpopupsch" runat="server" BackColor="LightGray" Height="418px" GroupingText="Search Issues Detail view"
        Width="100%">
                                <table>                                   
                                   
                                    
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel ID="Panel16" runat="server" GroupingText="IssueId" Width="166px">
                                         <asp:Label ID="lblschID" runat="server" Text="Label"></asp:Label>
                                            <asp:HiddenField ID="hidsch" runat="server" /> 
                                        </asp:Panel>
                                         
                                        </td>
                                        <td style="width: 304px">
                                            <asp:Panel ID="Panel17" runat="server" GroupingText="FIPS:" Width="140px">
                                            <asp:TextBox ID="txtpupfipssch" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel ID="Panel18" runat="server" GroupingText="State:" Width="189px">
                                         <asp:TextBox ID="txtpupstatesch" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox></asp:Panel>
                                            
                                           
                                        </td>
                                        <td>
                                           <asp:Panel runat="server" ID="Panel19" GroupingText="Country:">
                                           <asp:TextBox ID="txtpupcountysch" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                           </asp:Panel>
                                           
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                         <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel20" GroupingText="Processing Type:" 
                                                Width="219px">
                                          
                                            <asp:DropDownList ID="ddlpupptypesch" runat="server" 
                                                DataSourceID="ProcessingTypeObjectDataSource" DataTextField="ProcessingType" 
                                                DataValueField="IDProcessingType" Width="200px">
                                            </asp:DropDownList></asp:Panel>
                                         </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="Panel21" GroupingText="File Type:" Width="181px">
                                        <asp:DropDownList ID="ddlpupftypesch" runat="server" 
                                                DataSourceID="FileTypeObjectDataSource" DataTextField="FileType" 
                                                DataValueField="IDFileType" Width="174px">
                                            </asp:DropDownList>
                                        </asp:Panel>
                                            
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="Panel22" runat="server" GroupingText="Issue Type:" 
                                                 Width="204px">
                                          <asp:DropDownList ID="ddlpupitypesch" runat="server" 
                                                 DataSourceID="IssueTypeObjectDataSource" DataTextField="IssueType" 
                                                 DataValueField="IDIssueType" Width="200px">
                                             </asp:DropDownList>
                                         </asp:Panel>
                                             
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="Panel23" runat="server" GroupingText="Edition:">
                                         <asp:TextBox ID="txtpupEditionsch" runat="server"></asp:TextBox>
                                         </asp:Panel>
                                             
                                             
                                         </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel24" GroupingText="Version:" Width="150px">
                                         <asp:TextBox ID="txtpupVersionsch" runat="server"></asp:TextBox>
                                        </asp:Panel>
                                           
                                           
                                        </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="Panel25" GroupingText="ICP:" Width="136px">
                                            
                                            <asp:TextBox ID="txtpupicpsch" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel26" GroupingText="Title:" Width="201px">
                                          
                                            <asp:TextBox ID="txtpuptitlesch" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel27" GroupingText="Submitter:">
                                            
                                            <asp:TextBox ID="txtpupSubmittersch" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="4">
                                        <table>
                                        <tr>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel28" GroupingText="RelatedLinks:" 
                                                Width="100%">
                                         
                                            <asp:TextBox ID="txtpuprlinkssch" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True" TextMode="MultiLine" Width="342px" Height="60px"></asp:TextBox>
                                                </asp:Panel>
                                        </td>
                                        <td>
                                         <asp:Panel ID="Panel29" runat="server" GroupingText="Issue Details:" 
                                                Width="100%">
                                                <asp:TextBox ID="txtpupissuesch" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="375px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        </tr>
                                        </table>
                                        
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px" style="height: 98px">
                                        </td>
                                        <td colspan="3" style="height: 98px">
                                            <asp:Panel ID="Panel30" runat="server" GroupingText="Resolution:" 
                                                Width="347px">
                                                <asp:TextBox ID="txtpupresolutionsch" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="330px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtdownfilesch" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                            <asp:Button ID="btnschdown" runat="server" OnClick="btnschdown_Click" 
                                                Text="Download File" />
                                            <asp:HiddenField ID="hidschid" runat="server" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:Button ID="btnupdatesch" runat="server" OnClick="btnupdatesch_Click" 
                                                Text="Update" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btncancelsch" runat="server" Text="Cancel" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <cc1:ModalPopupExtender ID="ModalPopupExtendersch" runat="server" PopupControlID="panalpopupsch"
                    TargetControlID="panalpopupsch" CancelControlID="btncancelsch" OnCancelScript="HideModalPopupsch()"
                    DropShadow="True" BackgroundCssClass="modal" DynamicServicePath="" Enabled="True">
                </cc1:ModalPopupExtender>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="NewIssuetab" runat="server" HeaderText="New Issue" Width="1400px">
            <HeaderTemplate>
                New Issue</HeaderTemplate>
            <ContentTemplate>
            <table><tr><td align="left">
              <asp:Label ID="lblerrnew" runat="server"  ForeColor="Red" Font-Size="Smaller"></asp:Label>
              <asp:Label ID="lblmsgnew" runat="server" ForeColor="Green" Font-Size="X-Small" ></asp:Label>
            
            </td></tr></table>
                <asp:Panel ID="PanalAddNew" runat="server" GroupingText="Add New" Font-Size="XX-Small" Width="1000px">
                    <table style="width: 87%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="      " Font-Size="X-Small"></asp:Label>
                                <asp:Panel ID="Panel10" runat="server" GroupingText="State/County ">
                                    <asp:HiddenField ID="hidnewupdate" runat="server" />
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
                                        <td width="117px">
                                            <asp:Panel ID="PanelEdition" runat="server" GroupingText="Edition" Width="100px">
                                                <asp:TextBox ID="txtEditionnew" runat="server" Font-Size="XX-Small" MaxLength="3"
                                                    Width="30px">N/A</asp:TextBox>
                                                <asp:RegularExpressionValidator ID="ValidatEditionnew" runat="server" ValidationExpression="^((N/A)|(100)|(\d{0,2}))$"
                                                    ErrorMessage="Edition should be in the range of 0-100 or N/A" Display="None"
                                                    ControlToValidate="txtEditionnew" SetFocusOnError = "True"  ValidationGroup="newissuegrp"/>
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ValidatEditionnew"
                                                    Enabled="True"  >
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </td>
                                        <td width="125">
                                            <asp:Panel ID="PanelVersion" runat="server" GroupingText="Version" Width="100px">
                                                <asp:TextBox ID="txtVersionnew" runat="server" Font-Size="X-Small" MaxLength="3"
                                                    Width="30px">N/A</asp:TextBox>
                                                <asp:RegularExpressionValidator ID="Validatversionnew" runat="server" 
                                                ValidationExpression="^((N/A)|([0-9]|1[0-9]|2[0-5]))$"
                                                    ErrorMessage="Version should be in the range of 0-25 or N/A" Display="None" 
                                                    ControlToValidate="txtVersionnew" SetFocusOnError = "True" ValidationGroup="newissuegrp"/>
                                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="Validatversionnew"
                                                    Enabled="True">
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </td>
                                        <td width="135px">
                                            <asp:Panel ID="PanelRelatedICP" runat="server" GroupingText="Related ICP" Width="87px">
                                                <asp:TextBox ID="txtICPnew" runat="server" Font-Size="X-Small" MaxLength="5" Width="40px">N/A</asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td width="270px">
                                            <asp:Panel ID="PanelTitle" runat="server" GroupingText="Title" Width="260px" Style="margin-left: 0px">
                                                <asp:TextBox ID="txtTitlenew" runat="server" Font-Size="X-Small" 
                                                    Width="240px"></asp:TextBox>
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
                                
                                <asp:Panel ID="PanelSubmitter" runat="server" GroupingText="Submitter">
                                         <asp:DropDownList ID="ddlnewSubmitter" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="SubmitterObjectDataSource" DataTextField="Name" DataValueField="SubmitterID"
                                        Font-Size="X-Small" Width="200px">
                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                     
                                </asp:Panel>
                                
                                
                                <br />
                                <asp:Panel
                                    ID="Panel9" runat="server" GroupingText="Related Links">
                                    <asp:TextBox ID="txtRelatedLinksnew" runat="server" Font-Size="X-Small" Width="242px"></asp:TextBox>
                                    <asp:Button ID="Button3" runat="server" Font-Size="XX-Small" Text="Go To Link" CausesValidation="False"
                                        UseSubmitBehavior="False" />
                                </asp:Panel>
                                <asp:RequiredFieldValidator ID="rfvnewsubmitter" runat ="server" InitialValue="0"  
                                        ControlToValidate ="ddlnewSubmitter" ErrorMessage ="Please Select Submitter" 
                                        Display="None" SetFocusOnError = "True" ValidationGroup="newissuegrp"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="vcenewsubmiter" runat="server" 
                                        TargetControlID="rfvnewsubmitter"  
                                                    Enabled="True"  >
                                                </cc1:ValidatorCalloutExtender>
                                
                                <asp:Panel ID="PanelUploadfile" runat="server" GroupingText="Upload File">
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
                                    
                                    <asp:Button ID="btnNew" runat="server" Font-Size="X-Small" 
                                        OnClick="btnNew_Click" Text="Save" ValidationGroup="newissuegrp" />
                                        <asp:Button ID="btnnewclear" runat="server" Font-Size="X-Small" 
                                        OnClick="btnnewclear_Click" Text="Clear" />
                                        <asp:Button ID="btnnewDel" runat="server" Font-Size="X-Small" 
                                        OnClick="btnnewdelete_Click" Text="Delete"  Visible="False"/>
                                </td>
                            </tr>
                    </table>
                </asp:Panel>
                  <table width="300px" >
                    <tr>
                        <td>
                             <asp:Panel ID="Panelconfirmdelnew" runat="server" BackColor="LightGray" Height="150px"  Width="250px" GroupingText="Confirm Delete"
        >
                                <table>
                                <tr ><td colspan="2" ></td>
                                    <asp:Label ID="lblconfirmdelnew" runat="server" ></asp:Label>
                                </tr>
                                <tr><td> 
                                    <asp:Button ID="btncancelnewdel" runat="server" Text="Cancel" /></td>
                                <td>
                                    <asp:Button ID="btnconfirmdelnew" runat="server" Text="Confirm"  OnClick="btnconfirmdelete_Click"/></td></tr>
                                </table>
                              
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <cc1:ModalPopupExtender ID="mpeconfirmnewdelete" runat="server" PopupControlID="Panelconfirmdelnew"
                    TargetControlID="Panelconfirmdelnew" CancelControlID="btncancelnewdel" OnCancelScript="HideModalPopupmpenewdel()"
                    DropShadow="True" BackgroundCssClass="modal" DynamicServicePath="" Enabled="True">
                </cc1:ModalPopupExtender>
               
                 <asp:Panel ID="Panel1" runat="server" GroupingText="Recently Added" Width="1000px"
                    Font-Size="X-Small" Height="390px" >
                      <div style="width: 980px; height: 380px; overflow: auto;">
                    <asp:GridView ID="RecentIssuesgrid" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeyNames="IDIssue"  Font-Size="X-Small" ForeColor="#333333" 
                                        GridLines="None" OnRowDataBound="RecentIssuesgrid_RowDataBound" OnRowCommand ="RecentIssuesgrid_RowCommand" 
                              Width="1500px" AutoGenerateSelectButton="True">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                            CssClass="HeaderStyle"  />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="IDIssue" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                                SortExpression="IDIssue" />
                                            <asp:BoundField DataField="IssueCreatedDate" DataFormatString="{0:MMM d, yyyy}" HtmlEncode="False"
                                                HeaderText="Created Date" SortExpression="IssueCreatedDate">
                                                <ItemStyle Width="130px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="FIPSCounty" HeaderText="FIPS" SortExpression="FIPSCounty" />
                                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                            <asp:BoundField DataField="FileType" HeaderText="File Type" SortExpression="FileType">
                                                <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="IssueType" HeaderText="Issue Type" SortExpression="IssueType">
                                                <ItemStyle Width="150px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ProcessingType" HeaderText="Processing Type" SortExpression="ProcessingType">
                                                <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="IssueDetails" HeaderText="Issue Details" SortExpression="IssueDetails">
                                                <ItemStyle Width="300px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Resolution" HeaderText="Resolution" SortExpression="Resolution">
                                                <ItemStyle Width="300px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Submitter" HeaderText="Submitter" SortExpression="Submitter" />
                                            <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" />
                                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                                            <asp:BoundField DataField="IssueCreatedUser" HeaderText="Created User" SortExpression="IssueCreatedUser" />
                                        </Columns>
                                    </asp:GridView>
                     </div>
                </asp:Panel>
                
                 <table>
                    <tr>
                        <td>
                             <asp:Panel ID="panalpopupnew" runat="server" BackColor="LightGray" Height="418px" GroupingText="New Issue Detail view"
        Width="100%">
                                <table>                                   
                                   
                                    
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel ID="Panel31" runat="server" GroupingText="IssueId" Width="166px">
                                         <asp:Label ID="lblnewID" runat="server" Text="Label"></asp:Label>
                                            <asp:HiddenField ID="hidnew" runat="server" /> 
                                        </asp:Panel>
                                         
                                        </td>
                                        <td style="width: 304px">
                                            <asp:Panel ID="Panel32" runat="server" GroupingText="FIPS:" Width="140px">
                                            <asp:TextBox ID="txtpupfipsnew" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel ID="Panel33" runat="server" GroupingText="State:" Width="189px">
                                         <asp:TextBox ID="txtpupstatenew" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox></asp:Panel>
                                            
                                           
                                        </td>
                                        <td>
                                           <asp:Panel runat="server" ID="Panel34" GroupingText="Country:">
                                           <asp:TextBox ID="txtpupcountynew" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True"></asp:TextBox>
                                           </asp:Panel>
                                           
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                         <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel35" GroupingText="Processing Type:" 
                                                Width="219px">
                                          
                                            <asp:DropDownList ID="ddlpupptypenew" runat="server" 
                                                DataSourceID="ProcessingTypeObjectDataSource" DataTextField="ProcessingType" 
                                                DataValueField="IDProcessingType" Width="200px">
                                            </asp:DropDownList></asp:Panel>
                                         </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="Panel36" GroupingText="File Type:" Width="181px">
                                        <asp:DropDownList ID="ddlpupftypenew" runat="server" 
                                                DataSourceID="FileTypeObjectDataSource" DataTextField="FileType" 
                                                DataValueField="IDFileType" Width="174px">
                                            </asp:DropDownList>
                                        </asp:Panel>
                                            
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="Panel37" runat="server" GroupingText="Issue Type:" 
                                                 Width="204px">
                                          <asp:DropDownList ID="ddlpupitypenew" runat="server" 
                                                 DataSourceID="IssueTypeObjectDataSource" DataTextField="IssueType" 
                                                 DataValueField="IDIssueType" Width="200px">
                                             </asp:DropDownList>
                                         </asp:Panel>
                                             
                                            
                                         </td>
                                         <td>
                                         <asp:Panel ID="Panel38" runat="server" GroupingText="Edition:">
                                         <asp:TextBox ID="txtpupEditionnew" runat="server"></asp:TextBox>
                                         </asp:Panel>
                                             
                                             
                                         </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel39" GroupingText="Version:" Width="150px">
                                         <asp:TextBox ID="txtpupVersionnew" runat="server"></asp:TextBox>
                                        </asp:Panel>
                                           
                                           
                                        </td>
                                        <td style="width: 304px">
                                        <asp:Panel runat="server" ID="Panel40" GroupingText="ICP:" Width="136px">
                                            
                                            <asp:TextBox ID="txtpupicpnew" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel41" GroupingText="Title:" Width="201px">
                                          
                                            <asp:TextBox ID="txtpuptitlenew" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel42" GroupingText="Submitter:">
                                            
                                            <asp:TextBox ID="txtpupSubmitternew" runat="server"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="4">
                                        <table>
                                        <tr>
                                        <td>
                                        <asp:Panel runat="server" ID="Panel43" GroupingText="RelatedLinks:" 
                                                Width="100%">
                                         
                                            <asp:TextBox ID="txtpuprlinksnew" runat="server" BackColor="ControlLight" 
                                                ReadOnly="True" TextMode="MultiLine" Width="342px" Height="60px"></asp:TextBox>
                                                </asp:Panel>
                                        </td>
                                        <td>
                                         <asp:Panel ID="Panel44" runat="server" GroupingText="Issue Details:" 
                                                Width="100%">
                                                <asp:TextBox ID="txtpupissuenew" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="375px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                        </tr>
                                        </table>
                                        
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px" style="height: 98px">
                                        </td>
                                        <td colspan="3" style="height: 98px">
                                            <asp:Panel ID="Panel45" runat="server" GroupingText="Resolution:" 
                                                Width="347px">
                                                <asp:TextBox ID="txtpupresolutionnew" runat="server" Rows="4" TextMode="MultiLine" 
                                                    Width="330px"></asp:TextBox>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtdownfilenew" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                            <asp:Button ID="btnnewdown" runat="server" OnClick="btnnewdown_Click" 
                                                Text="Download File" />
                                            <asp:HiddenField ID="hidnewid" runat="server" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="13px">
                                        </td>
                                        <td colspan="3">
                                            <asp:Button ID="btnupdatenew" runat="server" OnClick="btnupdatenew_Click" 
                                                Text="Update" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btncancelnew" runat="server" Text="Cancel" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <cc1:ModalPopupExtender ID="ModalPopupExtendernew" runat="server" PopupControlID="panalpopupnew"
                    TargetControlID="panalpopupnew" CancelControlID="btncancelnew" OnCancelScript="HideModalPopupnew()"
                    DropShadow="True" BackgroundCssClass="modal" DynamicServicePath="" Enabled="True">
                </cc1:ModalPopupExtender>
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
                 <cc1:CollapsiblePanelExtender ID="cpesubmitter" runat="server" TargetControlID="panelSubmitterDetail"
                    ExpandControlID="panelSubmitterTitle" CollapseControlID="panelSubmitterTitle" Collapsed="True"
                    ImageControlID="imgsubmitterTitle" ExpandedImage="App_Themes/CollapsiblePanel/images/Submitterclose.png"
                    CollapsedImage="App_Themes/CollapsiblePanel/images/Submitteropen.png" SuppressPostBack="True"
                    Enabled="True">
                </cc1:CollapsiblePanelExtender>
               
                
                    
                <table><tr><td align="left">
              <asp:Label ID="lblmastererror" runat="server"  ForeColor="Red" Font-Size="Smaller"></asp:Label>
                            <asp:Label ID="lblmasternew" runat="server" ForeColor="Green" Font-Size="X-Small" ></asp:Label>
                   
            </td></tr></table>
                
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
                                    DataKeyNames="IDProcessingType" DataSourceID="SqlDataSourceProcessingType"
                                    CellPadding="4" ForeColor="#333333" GridLines="Vertical" Width="98%" ShowFooter="True"
                                    EnableModelValidation="True" OnRowCommand="gridprocessingtype_RowCommand" 
                                    onrowdeleted="gridprocessingtype_RowDeleted" 
                                    onrowupdated="gridprocessingtype_RowUpdated" 
                                    onrowediting="gridprocessingtype_RowEditing" 
                                    onrowdeleting="gridprocessingtype_RowDeleting">
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
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                        CssClass="HeaderStyle" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceProcessingType" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
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
                                <img id="imgFiletypeTitle" src="App_Themes/CollapsiblePanel/images/Filetypeclose.png"
                                    height="30px" width="750px" /></asp:Panel>
                            <asp:Panel ID="panelFiletype" runat="server" Height="400px" Width="750px" ScrollBars="Auto">
                                <asp:GridView ID="gridFileType" runat="server" AutoGenerateColumns="False" DataKeyNames="IDFileType"
                                    DataSourceID="SqlDataSourceFileType" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" 
                                    OnRowCommand="gridFileType_RowCommand" 
                                    onrowupdated="gridFileType_RowUpdated" 
                                    onrowdeleted="gridFileType_RowDeleted" onrowdeleting="gridFileType_RowDeleting" 
                                    onrowediting="gridFileType_RowEditing">
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
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                        CssClass="HeaderStyle" />
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
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" 
                                    OnRowCommand="gridissuetype_RowCommand" onrowdeleted="gridissuetype_RowDeleted" 
                                    onrowupdated="gridissuetype_RowUpdated" 
                                    onrowdeleting="gridissuetype_RowDeleting" 
                                    onrowediting="gridissuetype_RowEditing">
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
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                        CssClass="HeaderStyle" />
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
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" OnRowCommand="gridfaq_RowCommand"
                                     onrowdeleted="gridfaq_RowDeleted" 
                                    onrowupdated="gridfaq_RowUpdated">
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
                                        <asp:TemplateField HeaderText="Faqs">
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
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                        CssClass="HeaderStyle" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourcefaq" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                    DeleteCommand="DELETE FROM [faqtbl] WHERE [IDFaq] = @IDFaq" InsertCommand="INSERT INTO [faqtbl] ([Faqs], [Faqsans]) VALUES (@Faqs, @Faqsans)"
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
                             <asp:Panel ID="panelSubmitterTitle" runat="server" Height="30px" Width="750px">
                                <img id="imgsubmitterTitle" src="App_Themes/CollapsiblePanel/images/Submitterclose" height="30px"
                                    width="750px" /></asp:Panel>
                            <asp:Panel ID="panelSubmitterDetail" runat="server" Height="400px" Width="750px" ScrollBars="Auto">
                                <asp:GridView ID="gridSubmitter" runat="server" AutoGenerateColumns="False" DataKeyNames="SubmitterID"
                                    DataSourceID="SqlDataSourceSubmitter" CellPadding="4" ForeColor="#333333" GridLines="Vertical"
                                    Width="98%" ShowFooter="True" EnableModelValidation="True" OnRowCommand="gridSubmitter_RowCommand"
                                     onrowdeleted="gridSubmitter_RowDeleted" 
                                    onrowupdated="gridSubmitter_RowUpdated">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <FooterTemplate>
                                                <asp:Label ID="lblAddnew" runat="server" Text="Add New"></asp:Label>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblIDSubmitter" runat="server" Text='<%# Bind("SubmitterID") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="First Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFirstname" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="newtxtFirstName" runat="server" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Last Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="newtxtLastName" runat="server" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="100px" Wrap="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Level">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtUserLevel" runat="server" Text='<%# Bind("UserLevel") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserLevel" runat="server" Text='<%# Bind("UserLevel") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="newtxtUserLevel" runat="server" />
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
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                                        CssClass="HeaderStyle" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceSubmitter" runat="server" ConnectionString="<%$ ConnectionStrings:kbConnectionString %>"
                                    DeleteCommand="DELETE FROM Submitter WHERE [SubmitterID] = @SubmitterID" InsertCommand="INSERT INTO [Submitter] ([FirstName], [LastName],[UserLevel]) VALUES (@FirstName, @LastName,@userLevel)"
                                    SelectCommand="SELECT * FROM [Submitter]" UpdateCommand="UPDATE [Submitter] SET [FirstName] = @FirstName, [LastName] = @LastName,[UserLevel] = @UserLevel WHERE [SubmitterID] = @SubmitterID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SubmitterID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="FirstName" Type="String" />
                                        <asp:Parameter Name="LastName" Type="String" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
                                           <asp:Parameter Name="SubmitterID" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="FirstName" Type="String" />
                                        <asp:Parameter Name="LastName" Type="String" />
                                        <asp:Parameter Name="UserLevel" Type="Int32" />
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
                            <asp:ListView ID="ListViewfaq" runat="server" DataKeyNames="IDFaq" 
                                DataSourceID="SqlDataSourcefaqlist">
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
    
    <asp:ObjectDataSource ID="SubmitterObjectDataSource" runat="server" InsertMethod="insertSubmitter"
        SelectMethod="getSubmitterlist" TypeName="KBDAL.DBConnectionsKB">
        <InsertParameters>
            <asp:Parameter Name="strFirstName" Type="String" />
            <asp:Parameter Name="strLastName" Type="String" />
            <asp:Parameter Name="dtCreateddate" Type="DateTime" />
            <asp:Parameter Name="UserLevel" Type="Int32" />
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
