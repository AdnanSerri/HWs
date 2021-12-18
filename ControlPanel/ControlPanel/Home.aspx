<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ControlPanel.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <script src="assets/js/script.js"></script>

    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">
        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
            <form id="form1" runat="server">
                <div class="card shadow-lg" style="border-radius: 0.8rem">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 50vh !important">
                                    <h3 class="text-center ">Welecome
                                <asp:Label ID="User" runat="server" Text="Label"></asp:Label></h3>
                                    <h6 class="text-center text-muted">SVU S21 ASP.NET HW</h6>
                                    <h6 class="text-center mb-5" style="color: #a1a4a7">Home Page</h6>
                                </div>
                            </div>
                            <div class="col-6 text-center">
                                <img class="img-fluid" src="assets/images/logo.jpg" alt="Alternate Text" />
                            </div>
                        </div>
                        <hr />
                        <div class="row justify-content-center px-4">
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-lg mx-1" style="background-color: #005A82; border-radius: 0.9rem">
                                    <div class="card-header h5 text-white font-weight-bold text-center">Reg 2 ASP</div>
                                    <div class="card-body">
                                        <asp:Button ID="Button2" CssClass="btn btn-block rounded-pill shadow-lg font-weight-bold text-white" Style="background-color: #b79d32" runat="server" Text="View" OnClick="Button2_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-lg mx-1" style="background-color: #005A82; border-radius: 0.9rem">
                                    <div class="card-header h5 text-white font-weight-bold text-center">Reg 3 ASP</div>
                                    <div class="card-body">
                                        <asp:Button ID="Button1" CssClass="btn btn-block rounded-pill shadow-lg font-weight-bold text-white" Style="background-color: #b79d32" runat="server" Text="View" OnClick="Button3_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-lg mx-1" style="background-color: #005A82; border-radius: 0.9rem">
                                    <div class="card-header h5 text-white font-weight-bold text-center">Reg 4 ASP</div>
                                    <div class="card-body">
                                        <asp:Button ID="Button3" CssClass="btn btn-block rounded-pill shadow-lg font-weight-bold text-white" Style="background-color: #b79d32" runat="server" Text="View" OnClick="Button4_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card shadow-lg mx-1" style="background-color: #005A82; border-radius: 0.9rem">
                                    <div class="card-header h5 text-white font-weight-bold text-center">City X</div>
                                    <div class="card-body">
                                        <asp:Button ID="Button5" CssClass="btn btn-block rounded-pill shadow-lg font-weight-bold text-white" Style="background-color: #b79d32" runat="server" Text="View" OnClick="Button5_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center my-4">
                            <asp:Button ID="logout" CssClass="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2" runat="server" Text="Logout" OnClick="logout_Click" />
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
