using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace ControlPanel
{
    public class VerifyHelper
    {
        public static string GenerateToken(int length)
        {

            // creating a StringBuilder object()
            StringBuilder str_build = new StringBuilder();
            Random random = new Random();

            char letter;

            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                str_build.Append(letter);
            }
            return str_build.ToString();
        }

        public static string GenerateEmailVerificationCode(int length)
        {

            // creating a StringBuilder object()
            StringBuilder str_build = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < length; i++)
                str_build.Append(random.Next(0, 10));
            return str_build.ToString();
        }
        public static bool EmailIsVerify(string id)
        {



            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand("Select email_verified from users where id=@id", connection);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return string.IsNullOrEmpty(reader["email_verified"].ToString());
            }
            return false;
        }
    }
}