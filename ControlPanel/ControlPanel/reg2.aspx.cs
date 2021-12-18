using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ControlPanel.VerifyHelper;


namespace ControlPanel
{
    public partial class reg2 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;
        SqlDataReader reader;

        public void FillState()
        {
            state.Items.Clear();
            state.DataSource = DataSoruceHelper.FillState();
            state.DataValueField = "id";
            state.DataTextField = "name";
            state.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            FillState();

            if (Session["id"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "document.getElementById('home_button').classList.add('d-block')", true);
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

        private string CreateNewCity(string city_name, string country_id)
        {
            string id = "";

            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT id FROM cities WHERE name=@name AND country_id=@country_id;");
            cmd.Parameters.AddWithValue("@name", city_name);
            cmd.Parameters.AddWithValue("@country_id", country_id);
            cmd.Connection = connection;

            reader = cmd.ExecuteReader();

            if (reader.Read())
                id = reader["id"].ToString();

            connection.Close();

            if (id.Trim() == "")
            {
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();
                cmd = new SqlCommand(@"INSERT INTO cities (name, country_id) VALUES (@name, @country_id);");
                cmd.Parameters.AddWithValue("@name", city_name);
                cmd.Parameters.AddWithValue("@country_id", country_id);
                cmd.Connection = connection;

                cmd.ExecuteNonQuery();

                connection.Close();

                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                cmd = new SqlCommand(@"SELECT id FROM cities WHERE country_id=@country_id AND name=@name;");
                cmd.Parameters.AddWithValue("@country_id", country_id);
                cmd.Parameters.AddWithValue("@name", city_name);
                cmd.Connection = connection;

                reader = cmd.ExecuteReader();

                if (reader.Read())
                    id = reader["id"].ToString();

                connection.Close();
            }

            return id;
        }

        private string GetUserId(string email, string password)
        {
            string id = "";

            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            cmd = new SqlCommand("SELECT id FROM users WHERE email = @email And password = @password Or user_name=@email And password=@password", connection);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Connection = connection;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                id = reader["id"].ToString();
            }

            return id;
        }

        private void CreateNewUser(string fname, string lname, string m_init, string email, string password, string username, string comments, string zip, string country, string state, string city)
        {

            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            SqlCommand cmd = new SqlCommand(@"Insert Into users 
                        (first_name,last_name,midil_initial,email,password,user_name,comments,zip_code,country_id,state_id,city_id,email_token)
                        Values (@fname,@lname,@m_initial,@email,@password,@username,@comments,@zip,@country,@state,@city,@token)", connection);
            cmd.Parameters.AddWithValue("@token", VerifyHelper.GenerateToken(10));
            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@m_initial", m_init);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@comments", comments);
            cmd.Parameters.AddWithValue("@zip", zip);
            cmd.Parameters.AddWithValue("@country", country);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            if (connection.State == System.Data.ConnectionState.Open)
                connection.Close();
        }

        private void SendEmail(string email, string code)
        {
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;

            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("serri.adnan.47@gmail.com", "thewanted.net");
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("serri.adnan.47@gmail.com");
            msg.To.Add(new MailAddress(email));
            msg.Subject = "Email Verification Code";
            msg.IsBodyHtml = true;
            msg.Body = string.Format("<html lang='en'>" +
                                            "<head>" +
                                                "<title> Email Verification Message </title>" +
                                                "<meta charset='UTF-8'>" +
                                            "</head>" +
                                            "<body>" +
                                            "<div style='margin: 50px'>" +
                                                "<div style='background-color: #c8dffc; padding: 30px; border-radius: 10px; text-align: center'>" +
                                                        "<h3 style='font-family: sans-serif, Roboto; color: #958236; font-weight: 700;text-align: center'>" +
                                                            "Welcome to ASP.NET HomeWork" +
                                                        "</h3>" +
                                                    "<div style='display: flex;justify-content: center'>" +
                                                        "<br />" +
                                                    "</div>" +
                                                    "<hr />" +
                                                    "<p style='font-family: sans-serif, Roboto; color: #005A82; font-weight: 800'>" +
                                                        "Your verification code is: <code style='font-size: 15pt;font-weight: lighter; color: #958236'> " + code + " </code>" +
                                                    "</p>" +
                                                    "<br/>" +
                                                    "<p style='font-family: sans-serif, Roboto; color: #005A82; font-weight: 800'>" +
                                                        "Please verify your email in order to get access to the website." +
                                                    "</p>" +
                                                    "<br />" +
                                                    "<p style='font-family: sans-serif, Roboto; color: #005A82; font-weight: 800'>" +
                                                        "Thank you ever so much." +
                                                    "</p>" +
                                                "</div>" +
                                            "</div>" +
                                        "</body>" +
                                        "</htm>");
            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                string errorMsg = ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('SMTP Error occurred while sending email')", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = "";
            string code = GenerateEmailVerificationCode(8);

            string city_id = CreateNewCity(city.Text, country.SelectedValue);

            CreateNewUser(first_name.Text, last_name.Text, middle_initial.Text, email.Text, password.Text, username.Text, comments.Text, zip.Text, country.SelectedValue, state.SelectedValue, city_id);

            id = GetUserId(email.Text, password.Text);

            if (id.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('User Not Found')", true);
                return;
            }

            SendEmail(email.Text, code);

            UpdateUser(id, code);

            Session["id"] = id;
            Response.Redirect("confirm.aspx");
        }

        private void UpdateUser(string id, string code)
        {
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            cmd = new SqlCommand("UPDATE users SET email_token = @token WHERE id=@id", connection);
            cmd.Parameters.AddWithValue("@token", code);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}