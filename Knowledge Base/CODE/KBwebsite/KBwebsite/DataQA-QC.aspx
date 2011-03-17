<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DataQA-QC.aspx.cs" Inherits="DataQA_QC" enableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="1032" Height="500" >
        <cc1:TabPanel runat="server" HeaderText="State/Country Search" ID="TabPanel1" ScrollBars="Auto">
            <HeaderTemplate>
                State/Country Search
            </HeaderTemplate>
            
        <ContentTemplate>
      
  
            <asp:Table ID="Table1" runat="server" Height="500px" Width="1027px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"><asp:Panel runat="server" ID="Panel1">
                        

<table border="1">
<tr>
  <td align="left" valign="top">
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server"/>
            <asp:Menu ID="Menu2" runat="server"  
                Orientation="Vertical" BackColor="#F7F6F3" DynamicHorizontalOffset="2" 
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" 
                StaticSubMenuIndent="10px">
                <StaticSelectedStyle BackColor="#5D7B9D" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#5D7B9D" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <Items>
                                    
                    <asp:MenuItem Text="Recent Issues" Value="Recent Issues" NavigateUrl="~/RecentIssues.aspx" ></asp:MenuItem>
                     <asp:MenuItem Text="Search Issues" Value="Search Issues" NavigateUrl="~/SearchIssues.aspx"></asp:MenuItem>
                     <asp:MenuItem Text="New Issue" Value="New Issue" NavigateUrl="~/NewIssue.aspx"></asp:MenuItem>
                     <asp:MenuItem Text="Manipulate Master" Value="Manipulate Master" NavigateUrl="~/ManipulateMaster.aspx"></asp:MenuItem>
                     <asp:MenuItem Text="Temp" Value="Temp" NavigateUrl="~/Temp.aspx"></asp:MenuItem>
                     <asp:MenuItem Text="Temp" Value="Temp" NavigateUrl="~/Temp1.aspx"></asp:MenuItem>
                    


                </Items>
               
            </asp:Menu>
            </td>
<td>
<asp:TextBox runat="server" ID="txtName"></asp:TextBox>
<asp:Button runat="server" Text="Search" ID="btnsubmit" OnClick="btnsave_Submit"></asp:Button>
<asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                RepeatDirection="Horizontal"><asp:ListItem>issue type</asp:ListItem>
<asp:ListItem>Product Affected</asp:ListItem>
<asp:ListItem>Other Field</asp:ListItem>
</asp:CheckBoxList>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                RepeatDirection="Horizontal"><asp:ListItem>County</asp:ListItem>
<asp:ListItem>Nationwide</asp:ListItem>
</asp:RadioButtonList>
<asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
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
          

  

</asp:Panel>
<asp:Panel runat="server" ID="Panel2">
                          
                  </asp:Panel>
</asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server" ColumnSpan="3"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
         </ContentTemplate>
          
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="StateWide Search">
         <ContentTemplate>
        <asp:Label ID="Label2" runat="server" Text="enter your Mobile"></asp:Label>
        <asp:TextBox ID="txtMobile"  runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="btnsave_Submit"/>
                </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="National search">
         <ContentTemplate>
        <asp:Label ID="Label3" runat="server" Text="enter your Address"></asp:Label>
        <asp:TextBox ID="txtAddress"  runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Submit" onclick="btnsave_Submit"/>
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
    <asp:Button runat="server" id="btnsave" Text="Save" onclick="btnsave_Click" 
        Visible="False" />
                    </asp:Content>