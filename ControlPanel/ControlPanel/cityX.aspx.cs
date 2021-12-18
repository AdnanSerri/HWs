using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlPanel
{
    public partial class cityX : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            FillState(linking_state);
            FillCountry(linking_country);
            FillCity(linking_city);

            if (!IsPostBack)
            {
                FillState(country_state_id);
                FillState(city_state_id);
                FillCountryListById(city_country_id, city_state_id.SelectedValue);

            }
        }

        public void FillCountryListById(DropDownList country, string id)
        {
            country.Items.Clear();
            country.DataSource = DataSoruceHelper.FillCountryByState(id);
            country.DataValueField = "id";
            country.DataTextField = "name";
            country.DataBind();
        }

        public void FillState(DropDownList state)
        {
            state.Items.Clear();
            state.DataSource = DataSoruceHelper.FillState();
            state.DataValueField = "id";
            state.DataTextField = "name";
            state.DataBind();
        }

        public void FillCountry(DropDownList country)
        {
            country.Items.Clear();
            country.DataSource = DataSoruceHelper.FillCountry();
            country.DataValueField = "id";
            country.DataTextField = "name";
            country.DataBind();
        }
        public void FillCity(DropDownList city)
        {
            city.Items.Clear();
            city.DataSource = DataSoruceHelper.FillCity();
            city.DataValueField = "id";
            city.DataTextField = "name";
            city.DataBind();
        }

        public void FillCountryById(DropDownList country, string id)
        {
            country.Items.Clear();
            country.DataSource = DataSoruceHelper.FillCountryByState(id);
            country.DataValueField = "id";
            country.DataTextField = "name";
            country.DataBind();
        }
        public void FillCityById(DropDownList city, string id)
        {
            city.Items.Clear();
            city.DataSource = DataSoruceHelper.FillCityByCountry(id);
            city.DataValueField = "id";
            city.DataTextField = "name";
            city.DataBind();
        }

        protected void linking_state_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void linking_country_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Link_Locations_Click(object sender, EventArgs e)
        {
            string stateId = linking_state.SelectedValue;
            string countryId = linking_country.SelectedValue;
            string cityId = linking_city.SelectedValue;

            try
            {

                ReLinkCountry(stateId, countryId);

                ReLinkCity(countryId, cityId);

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('Linked successfully!', 'd-block');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showErrorMessage('', 'd-none');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showInfoMessage('', 'd-none');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showErrorMessage('" + ex.Message + "', 'd-block');", true);
            }
        }
        private void ReLinkCountry(string state_id, string country_id)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"UPDATE countries SET state_id = @state_id WHERE id=@id;";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@state_id", state_id);
            cmd.Parameters.AddWithValue("@id", country_id);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        private void ReLinkCity(string country_id, string city_id)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"UPDATE cities SET country_id = @country_id WHERE id=@id;";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@country_id", country_id);
            cmd.Parameters.AddWithValue("@id", city_id);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        protected void add_state_Click(object sender, EventArgs e)
        {
            string existed_state_id = DataSoruceHelper.GetStateByName(state_name.Text.Trim());

            if (existed_state_id != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('', 'd-none');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('State name is already taken', 'd-block');", true);
            }
            else
            {
                CreateNewState(state_name.Text.Trim());
                state_name.Text = "";

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('State created successfully!', 'd-block');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('', 'd-none');", true);
            }
        }

        private void CreateNewState(string name)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"INSERT INTO states (name) VALUES (@name);";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        private void CreateNewCountry(string name, string state_id)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"INSERT INTO countries (name, state_id) VALUES (@name, @state_id);";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@state_id", state_id);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        protected void add_country_Click(object sender, EventArgs e)
        {
            string exsisted_country_name = DataSoruceHelper.GetCountryByName(country_name.Text.Trim());

            if (exsisted_country_name != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('', 'd-none');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('Country name is already taken', 'd-block');", true);
                return;
            }

            CreateNewCountry(country_name.Text.Trim(), country_state_id.SelectedValue);
            country_name.Text = "";

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('Country created successfully!', 'd-block');", true);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('', 'd-none');", true);
        }

        private void CreateNewCity(string name, string country_id)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();

            string commandText = @"INSERT INTO cities (name, country_id) VALUES (@name, @country_id);";

            cmd = new SqlCommand(commandText, connection);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@country_id", country_id);
            cmd.Connection = connection;

            cmd.ExecuteNonQuery();

            connection.Close();
        }

        protected void add_city_Click(object sender, EventArgs e)
        {
            string exsisted_city_name = DataSoruceHelper.GetCityByName(city_name.Text.Trim());

            if (exsisted_city_name != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('', 'd-none');", true);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('City name is already taken', 'd-block');", true);
                return;
            }

            CreateNewCity(city_name.Text.Trim(), city_country_id.SelectedValue);
            city_name.Text = "";

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "infoMessage", "showInfoMessage('City created successfully!', 'd-block');", true);
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "showErrorMessage('', 'd-none');", true);
        }

        protected void city_state_id_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCountryListById(city_country_id, city_state_id.SelectedValue);
        }
    }
}