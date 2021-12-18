<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="state2.aspx.cs" Inherits="ControlPanel.state2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <h1>
                <asp:Label ID="LabelType" runat="server" Text="Label"></asp:Label> 
                 &nbsp;State</h1>
            &nbsp;name
                <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Save" />
        </p>
    </form>
</body>
</html>
