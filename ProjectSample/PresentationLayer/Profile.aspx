<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ProjectSample.PresentationLayer.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 21px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
</asp:ScriptManager>
 <script type="text/javascript">
     function ShowAvailability() {
         PageMethods.CheckUserName(document.getElementById("<%=txtUserName.ClientID%>").value, OnSuccess);
       }
     function OnSuccess(response) {
         if ((document.getElementById("<%=hdfUserName.ClientID%>").value) != (document.getElementById("<%=txtUserName.ClientID%>").value))
         {
             var mesg = document.getElementById("<%=lblUserNameExists.ClientID%>");
             var hdnField = document.getElementById("<%=hdnUserNameExists.ClientID%>");
             switch (response) {
                 case "True":
                     mesg.style.color = "green";
                     mesg.innerHTML = "Available";
                     hdnField.value = "Available";
                     break;
                 case "False":
                     mesg.style.color = "red";
                     mesg.innerHTML = "Not Available";
                     hdnField.value = "Not Available";

                     break;
                 case "ErrorOccured":
                     mesg.style.color = "red";
                     mesg.innerHTML = "Error occured try later!";
                     hdnField.value = "Error occured try later!";
                     break;
             }
                 
             }
           
       }
     function OnChange() {
         var hdnField = document.getElementById("<%=hdnUserNameExists.ClientID%>");
         if (hdnField.value == "Available") {
             document.getElementById("<%=lblUserNameExists.ClientID%>").innerHTML = "";
         }
         
     }
     function zipAndphoneValidation(txtbox) {
         if (event.keyCode < 45 || event.keyCode > 57) {
             txtbox.value = "";
             alert("Enter numbers!!");
             return false;
         }
     }

 </script>
    <asp:Panel ID="Panel1" runat="server">
<table class="tablewidth">
    <tr>
        <td class="auto-style2">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="text-align: left">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label1" runat="server" CssClass="Label" Text="User Name *"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtUserName" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" onblur="ShowAvailability()" onkeyup="OnChange()" TabIndex="1" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/Edit.gif" OnClick="btnEdit_Click" style="height: 16px" ToolTip="edit personal details" />
                                <asp:Label ID="lblUserNameExists" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter Username</asp:RequiredFieldValidator>
                                <asp:HiddenField ID="hdfUserName" runat="server" />
                            </td>
                            <td>
                                <asp:HiddenField ID="hdnUserNameExists" runat="server" />
                            </td>
                            <td class="auto-style1">
                                <asp:HiddenField ID="hdfUserID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" CssClass="Label" Text="Name *"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtFirstName" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="2" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter Firstname</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtMInitial" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="3" Width="49px" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtLastName" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="4" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter Lastname</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td class="auto-style1">
                                <asp:Label ID="Label10" runat="server" CssClass="Label" Text="Firstname *"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="Label4" runat="server" CssClass="Label" Text="MI"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="Label3" runat="server" CssClass="Label" Text="Lastname *"></asp:Label>
                            </td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label11" runat="server" CssClass="Label" Text="Address *"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtAddress" runat="server" BackColor="#DFECEB" BorderColor="#E3E7E8" BorderStyle="Solid" TabIndex="5" Width="152px" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter address</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style1"></td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label6" runat="server" CssClass="Label" Text="City"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="6" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label7" runat="server" CssClass="Label" Text="State"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtState" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="7" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td class="auto-style1"></td>
                            <td class="auto-style1"></td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="Label8" runat="server" CssClass="Label" Text="Zipcode *"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtZipcode" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" onblur="return zipAndphoneValidation(this);" TabIndex="8" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="rfvZipcode" runat="server" ControlToValidate="txtZipcode" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter Zipcode</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label9" runat="server" CssClass="Label" Text="Home/Mobile Phone No. *"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNO" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" onkeypress="return zipAndphoneValidation();" TabIndex="9" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNO" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter Phone Number</asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label12" runat="server" CssClass="Label" Text="Alternate Phone"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAlternatePhone" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" onkeypress="return zipAndphoneValidation();" TabIndex="10" TextMode="Number" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label19" runat="server" CssClass="Label" Text="Email *"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="11" Width="138px" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                                <asp:ImageButton ID="btnEmail" runat="server" ImageUrl="~/Images/Edit.gif" OnClick="btnEmail_Click" ToolTip="Edit email" />
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" CssClass="RequiredFieldValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Save">Please enter a valid email address</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="RequiredFieldValidator" ValidationGroup="Save">Enter e-mail address</asp:RequiredFieldValidator>
                            </td>
                            <td></td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="lblEmail" runat="server" CssClass="Label" Text="Confirm Email *" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmEmail" runat="server" BackColor="#DFECEB" BorderColor="#E6E2E9" BorderStyle="Solid" TabIndex="12" Width="137px" Visible="False" Enabled="False" ValidationGroup="Save"></asp:TextBox>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" CssClass="RequiredFieldValidator" ValidationGroup="Save">Email ids do not match</asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" ControlToValidate="txtConfirmEmail" CssClass="RequiredFieldValidator" ErrorMessage="Enter email id once again" ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="Label16" runat="server" CssClass="Labeltxt" Text="We promote our families businesses and services.Please enter if you have any service to offer"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:CheckBox ID="chkServices" runat="server" AutoPostBack="True" Text="Click here to enable the options below" />
            <asp:UpdatePanel ID="upServices" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="text-align: left">
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" CssClass="Label" Text="Service/Business"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlService" runat="server" DataTextField="services" DataValueField="serviceMainId">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label20" runat="server" CssClass="Label" Text="Description"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="290px"></asp:TextBox>
                                <asp:Button ID="btnAdd" runat="server" CssClass="button" Text="Add " />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="False" EmptyDataText="No Services" PageSize="5" Width="537px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Service/Business">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Services") %>' ReadOnly="True"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtService" runat="server" Text='<%# Eval("Services") %>' ReadOnly="True"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtGrdDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="318px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                        <asp:CommandField HeaderText="Edit" />
                                    </Columns>
                                    <RowStyle Wrap="False" />
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:ImageButton ID="btnSavePersonalDetails" runat="server" Height="30px" ImageUrl="~/Images/save.gif" OnClick="btnSavePersonalDetails_Click" ToolTip="Save" ValidationGroup="Save" Width="32px" />
        </td>
    </tr>
</table>
        </asp:Panel>
</asp:Content>
