using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlPanel
{
    public partial class reg3 : System.Web.UI.Page
    {

        static bool IsUpdate = false;
        static string id;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                connection.Open();

                //Fill ComboBox
                FillState();
                FillCountry(state.SelectedValue);
                FillCity(country.SelectedValue);

                // Check If Id
                id = Request.QueryString["id"];
                IsUpdate = false;

                if (!string.IsNullOrEmpty(id))
                {
                    Submit.Text = "Save Change";

                    IsUpdate = true;

                    LabelType.Text = "Update";

                    cmd = new SqlCommand("Select * from users where id = @id ", connection);

                    cmd.Parameters.AddWithValue("@id", id);

                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        first_name.Text = reader["first_name"].ToString();
                        last_name.Text = reader["last_name"].ToString();
                        middle_initial.Text = reader["midil_initial"].ToString();
                        zip.Text = reader["zip_code"].ToString();
                        email.Text = reader["email"].ToString();
                        password.Text = reader["password"].ToString();
                        comments.Text = reader["comments"].ToString();
                        username.Text = reader["user_name"].ToString();


                        string state_id = reader["state_id"].ToString();
                        string country_id = reader["country_id"].ToString();
                        string city_id = reader["city_id"].ToString();

                        FillState();
                        FillCountry(state_id);
                        FillCity(country_id);



                        terms.Checked = true;

                        //state.ClearSelection();
                        //state.Items.FindByValue(state_id).Selected = true;

                        //country.ClearSelection();
                        //country.Items.FindByValue(country_id).Selected = true;

                        //city.ClearSelection();
                        //city.Items.FindByValue(city_id).Selected = true;
                    }
                }
                else
                {
                    LabelType.Text = "Create New";
                    Submit.Text = "Create";
                }
            }
        }

        protected void TermsValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = terms.Checked;
        }
        protected void MidilValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = middle_initial.Text.Length == 1;
        }
        protected void ZipValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = zip.Text.Length >= 5 && zip.Text.Length <= 10;
        }
        protected void EmailValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (email.Text.Length < 6)
            {
                EmailValidator.ErrorMessage = "Email Must 6 Character At Least";
                args.IsValid = false;
            }
            else if (!email.Text.Contains("@"))
            {
                EmailValidator.ErrorMessage = "Email Must Contains @ Symbol";
                args.IsValid = false;
            }
            else if (email.Text.IndexOf('.', email.Text.IndexOf("@")) == -1)
            {
                EmailValidator.ErrorMessage = "Email Must Contains Dot After @ Symbol";
                args.IsValid = false;
            }
            else
                args.IsValid = true;
        }

        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCountry(state.SelectedValue);
        }
        protected void country_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCity(country.SelectedValue);
        }
        public void FillState()
        {
            state.Items.Clear();
            state.DataSource = DataSoruceHelper.FillState();
            state.DataValueField = "id";
            state.DataTextField = "name";
            state.DataBind();
        }
        public void FillCountry(string id)
        {
            country.Items.Clear();
            country.DataSource = DataSoruceHelper.FillCountryByState(id);
            country.DataValueField = "id";
            country.DataTextField = "name";
            country.DataBind();
        }
        public void FillCity(string id)
        {
            city.Items.Clear();
            city.DataSource = DataSoruceHelper.FillCityByCountry(id);
            city.DataValueField = "id";
            city.DataTextField = "name";
            city.DataBind();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (!IsUpdate)
            {
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();
                SqlCommand cmd = new SqlCommand(@"Insert Into users 
                        (first_name,last_name,midil_initial,email,password,user_name,comments,zip_code,country_id,state_id,city_id,email_token)
                        Values (@fname,@lname,@m_initial,@email,@password,@username,@comments,@zip,@country,@state,@city,@token)", connection);
                cmd.Parameters.AddWithValue("@token", VerifyHelper.GenerateToken(8));
                cmd.Parameters.AddWithValue("@fname", first_name.Text);
                cmd.Parameters.AddWithValue("@lname", last_name.Text);
                cmd.Parameters.AddWithValue("@m_initial", middle_initial.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                cmd.Parameters.AddWithValue("@username", username.Text);
                cmd.Parameters.AddWithValue("@comments", comments.Text);
                cmd.Parameters.AddWithValue("@zip", zip.Text);
                cmd.Parameters.AddWithValue("@country", country.SelectedValue);
                cmd.Parameters.AddWithValue("@state", state.SelectedValue);
                cmd.Parameters.AddWithValue("@city", city.SelectedValue);

                cmd.ExecuteNonQuery();
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('User created successfully!', 'd-block')", true);
                Response.Redirect("reg4.aspx");
            }
            else
            {
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();
                SqlCommand cmd = new SqlCommand(@"Update users 
                        Set first_name=@fname,last_name=@lname,midil_initial=@m_initial,email=@email,password=@password,user_name=@username,comments=@comments,zip_code=@zip,country_id=@country,state_id=@state,city_id=@city WHERE id=@id;", connection);
                cmd.Parameters.AddWithValue("@fname", first_name.Text);
                cmd.Parameters.AddWithValue("@lname", last_name.Text);
                cmd.Parameters.AddWithValue("@m_initial", middle_initial.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                cmd.Parameters.AddWithValue("@username", username.Text);
                cmd.Parameters.AddWithValue("@comments", comments.Text);
                cmd.Parameters.AddWithValue("@zip", zip.Text);
                cmd.Parameters.AddWithValue("@country", country.SelectedValue);
                cmd.Parameters.AddWithValue("@state", state.SelectedValue);
                cmd.Parameters.AddWithValue("@city", city.SelectedValue);
                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteNonQuery();
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('User inforamtion updated successfully!', 'd-block')", true);
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }

}