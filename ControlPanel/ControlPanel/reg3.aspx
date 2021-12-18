<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg3.aspx.cs" Inherits="ControlPanel.reg3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reg 3 | ASP.NET HW</title>
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
    <script src="assets/js/script.js"></script>
    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">

        <div id="errorAlert" class="alert alert-danger alert-heading w-50 d-none"></div>
        <div id="infoAlert" class="alert alert-info alert-heading w-50 d-none"></div>

        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
            <div class="card shadow-lg mb-3" style="border-radius: 0.8rem">
                <div class="card-body">
                    <form id="form1" runat="server">
                        <h2 class="text-center text-muted mb-5">
                            <asp:Label ID="LabelType" runat="server" Text="Label"></asp:Label>
                            &nbsp;User</h2>
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>First Name </label>
                                    <asp:TextBox ID="first_name" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="first_name"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Middle Initial</label>
                                    <asp:TextBox ID="middle_initial" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Middle Initial Required" ControlToValidate="middle_initial"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator2" OnServerValidate="MidilValidate_ServerValidate" runat="server" ErrorMessage=" Allow One Character " ControlToValidate="middle_initial"></asp:CustomValidator>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <asp:TextBox ID="last_name" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name Required" ControlToValidate="last_name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <hr />

                        <div class="row justify-content-center">

                            <div class="col-md-5">
                                <div class="form-inline">
                                    <div class="form-group w-100">
                                        <label>State</label>
                                        <asp:DropDownList ID="state" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged" Style="width: 58%">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-inline">
                                    <div class="form-group w-100">
                                        <label>Country</label>
                                        <asp:DropDownList ID="country" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="country_SelectedIndexChanged" Style="width: 58%">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Country Required" ControlToValidate="country"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="form-inline">
                                    <div class="form-group w-100">
                                        <label>City</label>
                                        <asp:DropDownList ID="city" runat="server" AutoPostBack="True" CssClass="form-control form-control-sm shadow-sm rounded-lg" Style="width: 58%">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City Required" ControlToValidate="city"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-inline">
                                    <div class="form-group w-100">
                                        <label>Zip</label>
                                        <asp:TextBox ID="zip" CssClass="form-control form-control-sm shadow-sm rounded-lg" runat="server" Style="width: 58%"></asp:TextBox>
                                        <asp:CustomValidator ID="CustomValidator3" OnServerValidate="ZipValidate_ServerValidate" runat="server" ErrorMessage=" Allow 5-10 Character " ControlToValidate="zip"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <hr />
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-sm shadow-sm rounded-lg"></asp:TextBox>
                                    <asp:CustomValidator ID="EmailValidator" OnServerValidate="EmailValidate_ServerValidate" runat="server" ErrorMessage="Email Validation" ControlToValidate="email"></asp:CustomValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Username</label>
                                    <asp:TextBox ID="username" runat="server" CssClass="form-control form-control-sm shadow-sm rounded-lg"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control form-control-sm shadow-sm rounded-lg"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Required" ControlToValidate="password"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="w-100">Repeate Password</label>
                                    <asp:TextBox ID="c_password" runat="server" TextMode="Password" CssClass="form-control form-control-sm shadow-sm rounded-lg"></asp:TextBox>

                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="c_password" ControlToValidate="password" ErrorMessage="Password And Repeate Not Matches !!"></asp:CompareValidator>

                                </div>
                            </div>
                        </div>
                        <hr />

                        <div class="row justify-content-center">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <label>Comments</label>
                                    <asp:TextBox ID="comments" runat="server" TextMode="multiline" CssClass="form-control form-control-sm shadow-sm rounded-lg" Columns="50" Rows="5"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ValidationExpression="^[\s\S]{0,10}$" ID="RegularExpressionValidator1" runat="server" ControlToValidate="comments" ErrorMessage="Must 100 Character At Max"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <label class="w-100 px-0">
                                    <asp:CheckBox ID="terms" runat="server" CssClass="form-check mx-2" />
                                    I Agree To The Site Terms
                                </label>
                                <asp:CustomValidator OnServerValidate="TermsValidate_ServerValidate" ID="CustomValidator1" runat="server" ErrorMessage="Must Agree Terms"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <asp:Button ID="Submit" CssClass="btn btn-info font-weight-bolder rounded-pill actions-info-shadow col-md-2 mx-2" runat="server" Text="Submit" OnClick="Submit_Click" />
                            <asp:Button runat="server" CssClass="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2" Text="Reset" />
                            <a href="reg4.aspx" class="btn btn-danger font-weight-bolder rounded-pill actions-danger-shadow col-md-2 mx-2">Cancel</a>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <a href="Home.aspx" class="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2">Home</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.slim.min.js"></script>
    <script src="assets/js/boostrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
