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
    public partial class login : System.Web.UI.Page
    {
        static string id;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From users Where email = @email And password = @password Or user_name=@email And password=@password", connection);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                id = reader["id"].ToString();
                Session.Add("id", id);
                string email_verified = reader["email_verified"].ToString();
                if (string.IsNullOrEmpty(email_verified))
                {
                    SendEmail(reader["email"].ToString(), reader["email_token"].ToString());
                    Response.Redirect("confirm.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "document.getElementById('errorAlert').classList.add('d-block');", true);
            }
        }

        public void SendEmail(string email, string token)
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
            msg.To.Add(new MailAddress("sarah.77.mhd@gmail.com"));
            //msg.From = new MailAddress("sarah.77.mhd@gmail.com");
            //msg.To.Add(new MailAddress("serri.adnan.47@gmail.com"));
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
                string str = ex.Message;
            }
        }
    }
}