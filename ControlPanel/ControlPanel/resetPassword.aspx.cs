using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlPanel
{
    public partial class resetPassword : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null || Session["email"] == null)
            {
                Response.Redirect("Home.aspx");
                return;
            }

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('Secret Code has been sent to you inbox', 'd-block');", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool validated = ValidateCode(Session["email"].ToString(), code.Text.Trim());

            if (validated)
            {
                UpdateUserPassword(Session["email"].ToString(), password.Text.Trim());

                Response.Redirect("login.aspx");
                return;
            }

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('Secret Code is not valid', 'd-block');", true);
        }

        private void UpdateUserPassword(string email, string new_password)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"UPDATE users SET password = @password WHERE email=@email;";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", new_password);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();
            connection.Close();
        }

        private bool ValidateCode(string email, string code)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"SELECT email_token FROM users WHERE email=@email;";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Connection = connection;

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader["email_token"].ToString() == code)
                    return true;
            }
            connection.Close();
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('Secret Code is not valid', 'd-block')", true);
            return false;
        }
    }
}