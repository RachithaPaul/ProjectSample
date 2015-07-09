<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ProjectSample.PresentationLayer.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
     function RegistrationAlert() {
         alert('Registration Complete!Check profile for any updation.');
         window.location.href = "Home.aspx";
     }
  //  function click() {
    //     document.getElementById("<%=upServices.ClientID%>").visible = true;
     //} 

 </script>
   
    <table class="tablewidth">
        <tr>
            <td class="auto-style2">
                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                <table>
                    <tr>
                        <td class="auto-style5" >
                            <asp:Label ID="Label1" runat="server" Text="User Name *" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left"  >
                          
                            <asp:TextBox ID="txtUserName" runat="server" TabIndex="1" onblur="ShowAvailability()" onkeyup ="OnChange()" CausesValidation="True" Width="144px"></asp:TextBox>
                            <asp:Label ID="lblUserNameExists" runat="server"></asp:Label>
                               
                        </td>
                        <td style="text-align: left" >
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter Username</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">
                            <asp:HiddenField ID="hdnUserNameExists" runat="server" />
                        </td>
                        <td class="auto-style1" ></td>
                    </tr>
                    <tr>
                       
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="FirstName *" CssClass="Label"></asp:Label>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:TextBox ID="txtFirstName" runat="server" TabIndex="2" CausesValidation="True" Width="144px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter Firstname</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:Label ID="Label4" runat="server" CssClass="Label" Text="MI"></asp:Label>
                            <asp:TextBox ID="txtMInitial" runat="server" TabIndex="3" Width="137px"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" CssClass="Label" Text="Lastname *"></asp:Label>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:TextBox ID="txtLastName" runat="server" TabIndex="4" Width="144px"></asp:TextBox>
                        </td>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter Lastname</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label11" runat="server" Text="Address *" CssClass="Label"></asp:Label>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:TextBox ID="txtAddress" runat="server" TabIndex="5" Width="144px" CausesValidation="True"></asp:TextBox>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter address</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1" style="text-align: left"></td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label6" runat="server" Text="City*" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left" class="auto-style1">
                            <asp:TextBox ID="txtCity" runat="server" TabIndex="6" Width="144px"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity" CssClass="RequiredFieldValidator" ValidationGroup="SaveValidation">Enter City</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left"></td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label7" runat="server" Text="State*" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtState" runat="server" TabIndex="7" Width="144px"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtState" CssClass="RequiredFieldValidator" ValidationGroup="SaveValidation">Enter State</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="Label8" runat="server" Text="Zipcode *" CssClass="Label"></asp:Label>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:TextBox ID="txtZipcode" runat="server" TabIndex="8"  onkeypress="return zipAndphoneValidation(this);" Width="144px"></asp:TextBox>
                        </td>
                        <td class="auto-style1" style="text-align: left">
                            <asp:RequiredFieldValidator ID="rfvZipcode" runat="server" ControlToValidate="txtZipcode" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter Zipcode</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1" style="text-align: left">&nbsp;</td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label9" runat="server" Text="Home/Mobile Phone No. *" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtPhoneNO" runat="server" TabIndex="9" onkeypress="return zipAndphoneValidation(this);" Width="144px"></asp:TextBox>
                            <asp:CheckBox ID="chkPh1" runat="server" />
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNO" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter Phone Number</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label12" runat="server" Text="Alternate Phone" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtAlternatePhone" runat="server" TabIndex="10" onkeypress="return zipAndphoneValidation();" TextMode="Number" Width="144px"></asp:TextBox>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td style="text-align: left">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label19" runat="server" CssClass="Label" Text="Email *"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtEmail" runat="server" TabIndex="11" Width="144px"></asp:TextBox>
                            <asp:CheckBox ID="chkEmail" runat="server" />
                        </td>
                        <td style="text-align: left">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Please enter a valid email address</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter e-mail address</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label13" runat="server" Text="Confirm Email *" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtConfirmEmail" runat="server" TabIndex="12" Width="144px"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Email ids do not match</asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" ControlToValidate="txtConfirmEmail" ErrorMessage="Enter email id once again" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label14" runat="server" Text="Password *" CssClass="Label"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtPassword" runat="server" TabIndex="13" ValidationGroup="SaveValidation" Width="144px"></asp:TextBox>
                        </td>
                        <td style="text-align: left">
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter password</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label15" runat="server" Text="Confirm Password *" CssClass="Label"></asp:Label>
                        </td>
                        <td class="auto-style4" style="text-align: left">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TabIndex="14" ValidationGroup="SaveValidation" Width="144px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" style="text-align: left">
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Passwords do not match</asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPassword" ValidationGroup="SaveValidation" CssClass="RequiredFieldValidator">Enter password once again</asp:RequiredFieldValidator>
                        </td>
                        <td style="text-align: left" >&nbsp;</td>
                        <td class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: left" >
                            <asp:Label ID="Label16" runat="server" CssClass="Label" Text="We promote our families businesses and services.Please enter if you have any service to offer"></asp:Label>
                        </td>
                    </tr>
                </table>
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
              
                <asp:CheckBox ID="chkServices" runat="server" Text="Click here to add the service you offer" OnCheckedChanged="chkServices_CheckedChanged" AutoPostBack="True" CssClass="Label" />
                
                <asp:UpdatePanel ID="upServices" UpdateMode="Conditional" runat="server" Visible="False" >
                    <ContentTemplate>
                <table>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label17" runat="server" CssClass="Label" Text="Service/Business"></asp:Label>
                        </td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlService" runat="server" DataTextField="services" DataValueField="serviceMainId" Width="144px">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="Description" CssClass="Label"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="144px"></asp:TextBox>
                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add " CssClass="button" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                                    <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="False" EmptyDataText="No Services" Width="537px" PageSize="5" OnRowDeleting="grdView_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Service/Business">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Services") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtService" runat="server" Text='<%# Bind("Services") %>' ReadOnly="True"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtGrdDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="318px" ReadOnly="True"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                        </Columns>
                                        <RowStyle Wrap="False" />
                                    </asp:GridView>
                                </td>
                        <td>&nbsp;</td>
                    </tr>
               
                  
                </table>
                </ContentTemplate>
                    <Triggers><asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Label ID="lblCheck" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cambria" ForeColor="Red" Text="Check the box near the Phone and Email if you want to hide it from public"></asp:Label>
              
                <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/Images/save.gif" OnClick="imgBtnSave_Click" ValidationGroup="SaveValidation" />
              
            </td> 
        </tr>
    </table>

</asp:Content>
