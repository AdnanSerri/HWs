<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="ControlPanel.confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <script src="assets/js/script.js"></script>

    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">

        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

            <div id="errorAlert" class="alert alert-danger alert-heading w-50 d-none text-center">Email or password isn't correct, try again.</div>
            <div id="infoAlert" class="alert alert-info alert-heading w-50 d-none text-center">Confirmation email has been sent, please check your inbox.</div>

            <form id="form1" runat="server">
                <div class="card shadow-lg mx-5 py-2 px-5" style="border-radius: 0.8rem">
                    <div class="card-body  mx-5">
                        <h3 class="text-center text-muted  mb-5">Confirmation Email</h3>
                        <div class="row justify-content-center mb-4">
                            <div class="col-md-10">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <label class="text-muted mr-1 font-weight-bold w-100">Enter Validation Key</label>
                                        <asp:TextBox ID="validation" CssClass="form-control shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-info font-weight-bolder rounded-pill shadow btn-block w-50" Text="Validate" OnClick="Button1_Click" />
                        </div>
                        <div class="row justify-content-center">
                            <a href="reg2.aspx" class="text-info font-weight-bold" style="text-decoration: underline">Create new account</a>
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
