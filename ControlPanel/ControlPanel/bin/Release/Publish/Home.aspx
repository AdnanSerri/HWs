<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ControlPanel.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welecome             <asp:Label ID="User" runat="server" Text="Label"></asp:Label>
                </h1>
            <asp:Button ID="Button1" runat="server" Text="Managment State" OnClick="Button1_Click" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Managment Country" OnClick="Button2_Click" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Managment City" OnClick="Button3_Click" />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Registeration" OnClick="Button4_Click" />
        </div>
    </form>
</body>
</html>
