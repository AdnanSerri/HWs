using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlPanel
{
    public partial class specifyEmail : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void CheckEmail_Click(object sender, EventArgs e)
        {
            string id = FindEmail(email.Text);

            if (id == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('Email is not valid', 'd-block')", true);
                return;
            }

            string token = VerifyHelper.GenerateEmailVerificationCode(8);
            UpdateUserToken(id, token);
            SendPasswordResetRequest(email.Text, token);
            Session["email"] = email.Text;
            Response.Redirect("resetPassword.aspx");
        }

        private string FindEmail(string email)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"SELECT id FROM users WHERE email=@email;";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Connection = connection;

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return reader["id"].ToString();
            }
            connection.Close();
            return null;
        }

        private void UpdateUserToken(string id, string code)
        {
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            cmd = new SqlCommand("UPDATE users SET email_token = @token WHERE id=@id", connection);
            cmd.Parameters.AddWithValue("@token", code);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        private void SendPasswordResetRequest(string email, string token)
        {
            SmtpClient client = new SmtpClient
            {
                DeliveryMethod = SmtpDeliveryMethod.Network,
                EnableSsl = true,
                Host = "smtp.gmail.com",
                Port = 587
            };

            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("serri.adnan.47@gmail.com", "thewanted.net");
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("serri.adnan.47@gmail.com");
            msg.To.Add(new MailAddress(email));
            string code = token;
            msg.Subject = email;
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
            "Your password reset code is: <code style='font-size: 15pt;font-weight: lighter; color: #958236'> " + code + " </code>" +
        "</p>" +
        "<br/>" +
        "<p style='font-family: sans-serif, Roboto; color: #005A82; font-weight: 800'>" +
            "Please verify use the code with your new password in order to get access to the website." +
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
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showErrorMessage('" + ex.Message + "', 'd-block')", true);
            }
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
    }
}