<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ProjectSample.PresentationLayer.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
        .auto-style1 {
        height: 21px;
    }
       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
   
    <table class="center" >
       
        <tr>
           
            <td class="auto-style5">
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/UserLog.gif" Width="35px" />
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="RequiredFieldValidator" ValidationGroup="login">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" CssClass="Label" Text="UserName"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="login"></asp:TextBox>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" CssClass="Label" Text="Password"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" ValidationGroup="login" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="RequiredFieldValidator" ValidationGroup="login">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Login" ValidationGroup="login" />
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label7" runat="server" CssClass="message" Text="Register if you own a Home"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:LinkButton ID="lnkRegister" runat="server" OnClick="lnkRegister_Click">Register</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
  
    <br />
    <br/>
    <br/>
   
</asp:Content>
