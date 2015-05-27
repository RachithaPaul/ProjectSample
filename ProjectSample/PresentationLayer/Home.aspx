<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjectSample.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*.auto-style1
        {
            height: 17px;
        }*/
    .auto-style1 {
        width: 239px;
    }
    .auto-style2 {
        width: 236px;
    }
    .auto-style3 {
        width: 212px;
    }
    .auto-style4 {
        width: 212px;
        height: 21px;
    }
         
       
       
       
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <div>
      
        <table class="TableClass">
            <tr>
                <td class="auto-style1">Home</td>
                <td class="auto-style1"></td>
                <td style="text-align: center" class="auto-style1">

                    </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style1">
                    <p>
                        Welcome to My Web Application.This website is<br />
                        for the families of our community.You can veiw our
                        <br />
                        services by logging in as a guest</p>
                    <p>
                        Welcome to our community again</p>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style1"></td>
                <td></td>
            </tr>
        </table>
       
       
       
    </div>
</asp:Content>
