<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="reg4.aspx.cs" Inherits="ControlPanel.reg4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reg 3 | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <script src="assets/js/script.js"></script>

    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">
        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

            <div id="errorAlert" class="alert alert-danger alert-heading w-50 d-none">Email or password isn't correct, try again.</div>

            <form id="form1" runat="server">
                <div class="card shadow-lg" style="border-radius: 0.8rem">
                    <div class="card-body mx-3">
                        <h2 class="text-center text-muted  mb-5">Users Management</h2>
                        <a href="reg3.aspx" id="Button2" class="btn btn-success rounded-sm actions-success-shadow my-3">Create New</a>
                        <div class="row justify-content-center">
                            <asp:GridView ID="GridView1" runat="server" class="table table-condensed table-responsive table-hover rounded-lg" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" CssClass="btn btn-danger btn-sm rounded-sm actions-danger-shadow my-1 w-100" runat="server" OnClick="Button1_Click1" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#17A2B8" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <a href="Home.aspx" class="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2">Home</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="assets/js/jquery.slim.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
