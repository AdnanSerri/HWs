using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlPanel
{
    public partial class Home : System.Web.UI.Page
    {
        static string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            id = Session["id"].ToString();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select * From users Where id=@id", connection);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                User.Text = reader["user_name"].ToString();
            }
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageState.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("reg2.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Add("id", id);
            Response.Redirect("reg3.aspx?id=" + id);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("reg4.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("cityX.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["email"] = null;

            Response.Redirect("login.aspx");
        }
    }
}