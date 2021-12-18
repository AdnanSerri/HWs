<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="reg4.aspx.cs" Inherits="ControlPanel.reg4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>User Managment</h1>
            <h1>
                <asp:Button ID="Button2" runat="server"  Text="Register New" />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
               
                    <asp:HyperLinkField HeaderText="Edit" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
               
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </h1>
        </div>
    </form>
</body>
</html>
