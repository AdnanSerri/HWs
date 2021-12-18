using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ControlPanel.VerifyHelper;

namespace ControlPanel
{
    public partial class confirm : System.Web.UI.Page
    {
        static string id;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('d-block')", true);

            id = Session["id"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From users Where id=@id", connection);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Response.Write(validation.Text);
                Response.Write(reader["email_token"].ToString());
                if (validation.Text == reader["email_token"].ToString())
                {
                    cmd = new SqlCommand("update users set email_verified=1 where id=@id", connection);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("login.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('Token Is Invalid')", true);
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('d-none')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('User Not Found')", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('d-none')", true);
            }
        }
    }
}