<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ControlPanel.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | ASP.NET HW</title>
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
                    <div class="card-body">
                        <h2 class="text-center mb-5 text-muted ">Sign In</h2>
                        <div class="row justify-content-center">
                            <div class="col-md-10">
                                <div class="form-row">
                                    <div class="col-md-2 d-flex-column align-self-center mb-2 text-center">
                                        <label class="text-muted mr-1 font-weight-bold">Email</label>
                                    </div>
                                    <div class="col-md-10 d-flex-column">
                                        <asp:TextBox ID="email" CssClass="form-control shadow-sm rounded-lg" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>

                            </div>-
                            <div class="col-md-10">
                                <div class="form-row">
                                    <div class="col-md-2 d-flex-column align-self-center mt-2 text-center">
                                        <label class="text-muted mr-1 font-weight-bold">Password</label>
                                    </div>
                                    <div class="col-md-10 d-flex-column">
                                        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control shadow-sm rounded-lg"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row justify-content-center mb-4">
                            <asp:Button ID="Button1" CssClass="btn btn-info font-weight-bolder rounded-pill shadow btn-block w-25" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
                        <div class="row justify-content-center">
                            <a href="reg2.aspx" class="text-info font-weight-bold mx-3" style="text-decoration: underline">Create new account</a>
                            <a href="specifyEmail.aspx" class="text-info font-weight-bold mx-3" style="text-decoration: underline">Reset Password</a>
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
