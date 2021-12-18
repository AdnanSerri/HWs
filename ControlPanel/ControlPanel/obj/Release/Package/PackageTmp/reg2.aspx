<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg2.aspx.cs" Inherits="ControlPanel.reg4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        label {
    width: 120px;
    display: inline-flex;
    padding: 10px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div>
            <label>First Name :</label>
            <asp:TextBox ID="first_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="first_name"></asp:RequiredFieldValidator>
            </div>
          

            <div>
            <label>Middle Initial:</label>
            <asp:TextBox ID="middle_initial" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Middle Initial Required" ControlToValidate="middle_initial"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" onservervalidate="MidilValidate_ServerValidate" runat="server" ErrorMessage=" Allow One Character " ControlToValidate="middle_initial"></asp:CustomValidator>
            </div>
            <div>
            <label>Last Name:</label>
            <asp:TextBox ID="last_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name Required" ControlToValidate="last_name"></asp:RequiredFieldValidator>
            </div>

            <div>
            <label>City:</label>
            <asp:TextBox ID="city" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City Required" ControlToValidate="city"></asp:RequiredFieldValidator>
            </div>

             <div>
            <label>State:</label>
                 <asp:DropDownList ID="state" runat="server">
                 </asp:DropDownList>
            </div>
            <div>
            <label>Country:</label><asp:RadioButtonList ID="country" runat="server">
                    <asp:ListItem>United State</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Country Required" ControlToValidate="country"></asp:RequiredFieldValidator>
            </div>
            <div>
                            <label>Zip:</label>
                            <asp:TextBox ID="zip" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator3" onservervalidate="ZipValidate_ServerValidate" runat="server" ErrorMessage=" Allow 5-10 Character " ControlToValidate="zip"></asp:CustomValidator>
            </div>
            <div>
                            <label>Email:</label>
                            <asp:TextBox ID="email" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="EmailValidator" onservervalidate="EmailValidate_ServerValidate" runat="server" ErrorMessage="Email Validation" ControlToValidate="email"></asp:CustomValidator>
            </div>
            <div>
                            <label>Username:</label>
                            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            </div>
            <div>
                            <label>Password:</label>
                            <asp:TextBox ID="password"  runat="server" TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Required" ControlToValidate="password"></asp:RequiredFieldValidator>

            </div>
             <div>
                            <label>Repeate Password:</label>
                             <asp:TextBox ID="c_password" runat="server" TextMode="Password"></asp:TextBox>

                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="c_password" ControlToValidate="password" ErrorMessage="Password And Repeate Not Matches !!"></asp:CompareValidator>

            </div>
              <div>
                            <label>Comments<asp:TextBox ID="comments" runat="server" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
                            </label>
                  &nbsp;<asp:RegularExpressionValidator ValidationExpression = "^[\s\S]{0,10}$" ID="RegularExpressionValidator1" runat="server" ControlToValidate="comments" ErrorMessage="Must 100 Character At Max"></asp:RegularExpressionValidator>
                            <label>
                            <br />
                            <asp:CheckBox ID="terms" runat="server" Text="I Agree To The Site Terms" />
                            <asp:CustomValidator onservervalidate="TermsValidate_ServerValidate" ID="CustomValidator1" runat="server" ErrorMessage="Must Agree Terms"></asp:CustomValidator>
                            </label>
            </div>


        </div>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
        <asp:Button ID="Button2" runat="server" Text="Reset"  />
    </form>
</body>
</html>
