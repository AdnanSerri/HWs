<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" CodeBehind="ManageCity.aspx.cs" Inherits="ControlPanel.ManageCity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
        <div>
            <h1>City Managment</h1>
            <h1>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New" />
            &nbsp;<asp:GridView ID="GridView1" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:HyperLinkField HeaderText="Edit" />
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Height="38px" OnClick="Button2_Click" Text="Delete" Width="109px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
             
            </h1>
            <h1>
                &nbsp;</h1>
        </div>
        
    </form>
</body>
</html>
