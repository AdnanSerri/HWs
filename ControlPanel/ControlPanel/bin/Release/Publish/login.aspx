<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ControlPanel.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login</h1>

email:<asp:TextBox ID="email" runat="server"></asp:TextBox><br />
password:<asp:TextBox ID="password" runat="server"></asp:TextBox>


            <br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />



        </div>
    </form>
</body>
</html>
