<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cityX.aspx.cs" Inherits="ControlPanel.cityX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Country & State & City | ASP.NET HW</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <script src="assets/js/script.js"></script>
    <div class="card-img-overlay position-relative" style="background-color: #e9e9e966">
        <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

            <div id="errorAlert" class="alert alert-danger alert-heading w-75 d-none"></div>
            <div id="infoAlert" class="alert alert-info alert-heading w-75 d-none"></div>


            <form id="form1" class="w-75 mb-2" runat="server">
                <div class="card shadow-lg" style="border-radius: 0.8rem">
                    <div class="card-body">
                        <h2 class="text-center text-muted mb-5">Countries & States & Cities Manage</h2>
                        <hr />

                        <div class="row ml-5">
                            <div class="col-md-3 mx-2">
                                <div class="form-group row">
                                    <label class="col-form-label text-muted mr-2 font-weight-bold" for="linking_state">State</label>
                                    <asp:DropDownList ID="linking_state" runat="server" CssClass="form-control shadow-sm rounded-lg" OnSelectedIndexChanged="linking_state_SelectedIndexChanged">
                                        <asp:ListItem Value="null" Text="Please choose..." />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mx-2">
                                <div class="form-group row">
                                    <label class="col-form-label text-muted mr-2 font-weight-bold" for="linking_country">Country</label>
                                    <asp:DropDownList ID="linking_country" runat="server" CssClass="form-control shadow-sm rounded-lg" OnSelectedIndexChanged="linking_country_SelectedIndexChanged">
                                        <asp:ListItem Value="null" Text="Please choose..." />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 mx-2">
                                <div class="form-group row">
                                    <label class="col-form-label text-muted mr-2 font-weight-bold" for="linking_city">City</label>
                                    <asp:DropDownList ID="linking_city" runat="server" CssClass="form-control shadow-sm rounded-lg">
                                        <asp:ListItem Value="null" Text="Please choose..." />

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-2 d-flex flex-column align-self-end">
                                <div class="form-group row justify-content-center">
                                    <asp:Button ID="Link_Locations" runat="server" AutoPostBack="True" CssClass="btn btn-info rounded-pill w-75 actions-info-shadow font-weight-bold" Text="Link" OnClick="Link_Locations_Click" CausesValidation="False" />
                                </div>
                            </div>
                        </div>
                        <hr />
                        <h3 class="text-muted my-4 text-center">Create State</h3>
                        <div class="row my-4">
                            <div class="col-md-3 text-right">
                                <label class="text-muted font-weight-bold">Name</label>
                            </div>
                            <div class="col-md-5">
                                <asp:TextBox ID="state_name" CssClass="form-control shadow-sm rounded-lg" placeholder="State Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="StateCreation" ErrorMessage="State name is required" ControlToValidate="state_name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="add_state" runat="server" AutoPostBack="True" ValidationGroup="StateCreation" CssClass="btn btn-info rounded-pill w-75 actions-info-shadow font-weight-bold" Text="Create" OnClick="add_state_Click" />
                            </div>
                        </div>
                        <hr />
                        <h3 class="text-muted my-4 text-center">Create Country</h3>
                        <div class="row my-4">
                            <div class="col-md-3 text-right mt-1 mb-4">
                                <label class="text-muted font-weight-bold">State</label>
                            </div>
                            <div class="col-md-5">
                                <asp:DropDownList ID="country_state_id" runat="server" AutoPostBack="True" CssClass="form-control shadow-sm rounded-lg">
                                    <asp:ListItem Value="null" Text="Please choose..." />

                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                                <label class="text-muted font-weight-bold">Name</label>
                            </div>
                            <div class="col-md-5 mb-4">
                                <asp:TextBox ID="country_name" CssClass="form-control shadow-sm rounded-lg" placeholder="Country Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="CountryCreation" runat="server" ErrorMessage="Country name is required" ControlToValidate="country_name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3 mb-4">
                                <asp:Button ID="add_country" runat="server" ValidationGroup="CountryCreation" AutoPostBack="True" CssClass="btn btn-info rounded-pill w-75 actions-info-shadow font-weight-bold" Text="Create" OnClick="add_country_Click" />
                            </div>
                        </div>
                        <hr />

                        <h3 class="text-muted my-4 text-center">Create City</h3>
                        <div class="row my-4">
                            <div class="col-md-3 text-right mt-1 mb-4">
                                <label class="text-muted font-weight-bold">State</label>
                            </div>
                            <div class="col-md-5">
                                <asp:DropDownList ID="city_state_id" runat="server" AutoPostBack="True" CssClass="form-control shadow-sm rounded-lg" OnSelectedIndexChanged="city_state_id_SelectedIndexChanged">
                                    <asp:ListItem Value="null" Text="Please choose..." />

                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                                <label class="text-muted font-weight-bold">Country</label>
                            </div>
                            <div class="col-md-5">
                                <asp:DropDownList ID="city_country_id" runat="server" AutoPostBack="True" CssClass="form-control shadow-sm rounded-lg">
                                    <asp:ListItem Value="null" Text="Please choose..." />

                                </asp:DropDownList>

                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                            </div>
                            <div class="col-md-3 text-right mt-1 mb-4">
                                <label class="text-muted font-weight-bold">Name</label>
                            </div>
                            <div class="col-md-5 mb-4">
                                <asp:TextBox ID="city_name" CssClass="form-control shadow-sm rounded-lg" placeholder="City Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="CityCreation" runat="server" ErrorMessage="City name is required" ControlToValidate="city_name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3 mb-4">
                                <asp:Button ID="add_city" runat="server" ValidationGroup="CityCreation" AutoPostBack="True" CssClass="btn btn-info rounded-pill w-75 actions-info-shadow font-weight-bold" Text="Create" OnClick="add_city_Click" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row justify-content-center mb-4">
                        <a href="Home.aspx" class="btn btn-secondary font-weight-bolder rounded-pill actions-secondary-shadow col-md-2 mx-2">Home</a>
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
