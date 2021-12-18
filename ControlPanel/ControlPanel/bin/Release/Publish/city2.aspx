<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="city2.aspx.cs" Inherits="ControlPanel.city2" %>

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
                 &nbsp;City</h1>
            &nbsp;name
                <asp:TextBox ID="name" runat="server"></asp:TextBox>

            Country
            <asp:DropDownList ID="countries" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="countries_SelectedIndexChanged">
            </asp:DropDownList>

        </div>
        <p>
            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Save" />
        </p>
    </form>
</body>
</html>
