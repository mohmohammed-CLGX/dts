<%@ Page Language="C#"MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecentIssues.aspx.cs" Inherits="RecentIssues" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" >
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="enter your name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
           <%-- <asp:Button ID="btnsubmit" runat="server" Text="Submit" onclick="btnsave_Submit"/>--%>
                </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
         <ContentTemplate>
        <asp:Label ID="Label2" runat="server" Text="enter your Mobile"></asp:Label>
        <asp:TextBox ID="txtMobile"  runat="server"></asp:TextBox>
        <%--<asp:Button ID="Button1" runat="server" Text="Submit" onclick="btnsave_Submit"/>--%>
                </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
         <ContentTemplate>
        <asp:Label ID="Label3" runat="server" Text="enter your Address"></asp:Label>
        <asp:TextBox ID="txtAddress"  runat="server"></asp:TextBox>
       <%-- <asp:Button ID="Button2" runat="server" Text="Submit" onclick="btnsave_Submit"/>--%>
                </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
    <%--<asp:Button runat="server" id="btnsave" Text="Save" onclick="btnsave_Click" />--%>
                    </asp:Content>
