<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="ControlPanel.confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Confirmation Email</h1>
            Enter Validation Key :<asp:TextBox ID="validation" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Validate" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
