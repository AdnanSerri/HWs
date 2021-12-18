using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ControlPanel
{
    public static class DataSoruceHelper
    {


        public static DataTable FillCountry()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

            SqlDataAdapter adapter = new SqlDataAdapter("select * from countries", connection);
            adapter.Fill(dt);

            return dt;
        }
        public static DataTable FillCountryWithState()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

            SqlDataAdapter adapter = new SqlDataAdapter(@"
                            SELECT countries.id, countries.name, states.name AS State
                            FROM  states INNER JOIN
                         countries ON states.id = countries.state_id", connection);
            adapter.Fill(dt);

            return dt;
        }
        public static DataTable FillCityWithCountry()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

            SqlDataAdapter adapter = new SqlDataAdapter(@"
                            SELECT cities.id, cities.name, countries.name AS Country
                            FROM  countries INNER JOIN
                         cities ON countries.id = cities.country_id", connection);
            adapter.Fill(dt);

            return dt;
        }
        public static DataTable FillCity()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from cities", connection);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }
        public static DataTable FillState()
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from states", connection);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }
        public static DataTable FillCityByCountry(string id)
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from cities where country_id='" + id + "'", connection);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }
        public static DataTable FillCountryByState(string id)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter("select * from countries where state_id='" + id + "'", connection);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }
        public static string GetStateById(string id)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("select name from states where id=@id ", connection);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return reader["name"].ToString();
            }
            return null;

        }

        public static string GetCityByName(string name)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("select id from cities where name=@name;", connection);
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return reader["id"].ToString();
            }
            return null;

        }

        public static string GetCountryByName(string name)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("select id from countries where name=@name;", connection);
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return reader["id"].ToString();
            }
            return null;
        }

        public static string GetStateByName(string name)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("select id from states where name=@name;", connection);
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return reader["id"].ToString();
            }
            return null;

        }
        public static DataTable FillUser(string id)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(
                String.Format(@"SELECT users.id, users.first_name, users.midil_initial, users.last_name, users.zip_code, users.email, users.password, users.comments, states.name AS State, cities.name AS City, countries.name AS Country
                         FROM users 
                         INNER JOIN
                         states ON users.state_id = states.id INNER JOIN
                         countries ON users.country_id = countries.id INNER JOIN
                         cities ON users.city_id = cities.id AND countries.id = cities.country_id
                         WHERE users.id != {0}"
                , id), connection);
            adapter.Fill(dt);
            connection.Close();

            return dt;
        }

    }
}