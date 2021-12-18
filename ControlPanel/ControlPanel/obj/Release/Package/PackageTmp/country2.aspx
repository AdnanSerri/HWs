<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="country2.aspx.cs" Inherits="ControlPanel.country2" %>

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
                 &nbsp;Country</h1>
            &nbsp;name
                <asp:TextBox ID="name" runat="server"></asp:TextBox>

            State
            <asp:DropDownList ID="states" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="states_SelectedIndexChanged">
            </asp:DropDownList>

        </div>
        <p>
            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Save" />
        </p>
    </form>
</body>
</html>
