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
    public partial class reg4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            RefreshData();
        }
        public void RefreshData()
        {
            GridView1.DataSource = DataSoruceHelper.FillUser(Session["id"].ToString());
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                string id = e.Row.Cells[1].Text;
                var EditCell = e.Row.Cells[0];
                var DeleteCell = e.Row.Cells[0];
                EditCell.Controls.Add(new HyperLink
                {
                    NavigateUrl = "reg3.aspx?id=" + id,
                    Text = "Edit",
                    CssClass = "btn btn-warning btn-sm rounded-sm my-1 w-100 actions-warning-shadow",
                }) ;

                var Button = e.Row.FindControl("Button1") as Button;
                Button.ToolTip = id;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         
        }
        public void DeleteRow(string id)
        {
            
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Delete From users Where id =@id", connection);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            connection.Close();
            RefreshData();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            var button = sender as Button;
            DeleteRow(button.ToolTip);
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("reg3.aspx");
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}