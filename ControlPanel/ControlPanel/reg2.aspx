<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg2.aspx.cs" Inherits="ControlPanel.reg2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reg 2 | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
    <style>
        label {
            width: 120px;
            display: inline-flex;
            padding: 10px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">
            <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

                <div id="errorAlert" class="alert alert-danger alert-heading w-50 d-none"></div>
                <div id="infoAlert" class="alert alert-info alert-heading w-50 d-none"></div>

                <div class="card shadow-lg mb-3" style="border-radius: 0.8rem">
                    <div class="card-body text-dark">
                        <h2 class="text-center text-muted mb-5">Registration Form</h2>
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="font-weight-bold">First Name</label>
                                    <asp:TextBox ID="first_name" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="first_name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="font-weight-bold w-100">Middle Initial</label>
                                    <asp:TextBox ID="middle_initial" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Middle Initial Required" ControlToValidate="middle_initial"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator2" OnServerValidate="MidilValidate_ServerValidate" runat="server" ErrorMessage=" Allow One Character " ControlToValidate="middle_initial"></asp:CustomValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="font-weight-bold">Last Name</label>
                                    <asp:TextBox ID="last_name" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name Required" ControlToValidate="last_name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row mx-2 justify-content-center">

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">City</label>
                                    <asp:TextBox ID="city" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City Required" ControlToValidate="city"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">State</label>
                                    <asp:DropDownList ID="state" runat="server" CssClass="custom-select form-control-sm">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group form-check">
                                    <label class="font-weight-bold">Country</label>
                                    <asp:RadioButtonList ID="country" runat="server" RepeatDirection="Horizontal" CssClass="d-flex justify-content-center">
                                        <asp:ListItem Value="1022" class="mx-2 custom-radio">United State</asp:ListItem>
                                        <asp:ListItem class="mx-2 custom-radio">Canada</asp:ListItem>
                                        <asp:ListItem class="mx-2 custom-radio">Other</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Country Required" ControlToValidate="country"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">Zip</label>
                                    <asp:TextBox ID="zip" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator3" OnServerValidate="ZipValidate_ServerValidate" runat="server" ErrorMessage=" Allow 5-10 Character " ControlToValidate="zip"></asp:CustomValidator>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">Email</label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                    <asp:CustomValidator ID="EmailValidator" OnServerValidate="EmailValidate_ServerValidate" runat="server" ErrorMessage="Email Validation" ControlToValidate="email"></asp:CustomValidator>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">Username</label>
                                    <asp:TextBox ID="username" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold">Password</label>
                                    <asp:TextBox ID="password" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Required" ControlToValidate="password"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="font-weight-bold w-100">Repeat Password</label>
                                    <asp:TextBox ID="c_password" runat="server" TextMode="Password" CssClass="form-control form-control-sm"></asp:TextBox>

                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="c_password" ControlToValidate="password" ErrorMessage="Password And Repeate Not Matches !!"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row justify-content-center">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label class="font-weight-bold">
                                        Comments
                                    </label>
                                    <asp:TextBox ID="comments" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control form-control-sm"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ValidationExpression="^[\s\S]{0,10}$" ID="RegularExpressionValidator1" runat="server" ControlToValidate="comments" ErrorMessage="Must 100 Character At Max"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <label class="font-weight-bold w-100 px-0">
                                    <asp:CheckBox ID="terms" runat="server" CssClass="form-check mx-2" />
                                    I Agree To The Site Terms
                                </label>
                                <asp:CustomValidator OnServerValidate="TermsValidate_ServerValidate" ID="CustomValidator1" runat="server" ErrorMessage="Must Agree Terms"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <asp:Button ID="Button1" CssClass="btn btn-info font-weight-bolder rounded-pill actions-info-shadow col-md-2 mx-2" runat="server" Text="Submit" OnClick="Button1_Click" />
                            <input type="reset" class="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2" value="Reset" />
                        </div>
                        <div class="row justify-content-center">
                            <a href="login.aspx" class="text-info font-weight-bold" style="text-decoration: underline">Have an account, Sign in</a>
                        </div>
                        <div class="row justify-content-center my-4">
                            <a href="Home.aspx" id="home_button" class="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="assets/js/jquery.slim.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
