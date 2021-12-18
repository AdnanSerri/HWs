<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="ControlPanel.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Password | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <script src="assets/js/script.js"></script>

    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">

        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

            <div id="errorAlert" class="alert alert-danger alert-heading w-50 d-none text-center"></div>
            <div id="infoAlert" class="alert alert-info alert-heading w-50 d-none text-center"></div>

            <form id="form1" runat="server">
                <div class="card shadow-lg mx-5 py-2 px-5" style="border-radius: 0.8rem">
                    <div class="card-body  mx-5">
                        <h3 class="text-center text-muted  mb-5">Reset Password</h3>
                        <div class="row justify-content-center mb-4">
                            <div class="col-md-10">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <label class="text-muted mr-1 font-weight-bold">Code</label>
                                        <asp:TextBox ID="code" placeholder="Enter the code from the inbox" CssClass="form-control shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Secret Code is required" ControlToValidate="code"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-12 text-center">
                                        <label class="text-muted mr-1 font-weight-bold">Password</label>
                                        <asp:TextBox ID="password" AutoCompleteType="None" TextMode="Password" placeholder="Enter your new password" CssClass="form-control shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password in required" ControlToValidate="password"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-12 text-center">
                                        <label class="text-muted mr-1 font-weight-bold">Confirm Pasword</label>
                                        <asp:TextBox ID="confirm_password" AutoCompleteType="None" TextMode="Password" placeholder="Enter password confirmation" CssClass="form-control shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="confirm_password" ControlToValidate="password" ErrorMessage="Password And Repeate Not Matches !!"></asp:CompareValidator>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <asp:Button ID="ResetPassword" runat="server" CssClass="btn btn-info font-weight-bolder rounded-pill shadow btn-block w-50" Text="Verify" OnClick="Button1_Click" />
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
