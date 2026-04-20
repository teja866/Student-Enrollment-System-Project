using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class Profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔹 Check login session
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        // 🔹 Load user profile
        void LoadProfile()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "SELECT Name, BankDetails FROM Students WHERE StudentID=@sid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtBank.Text = dr["BankDetails"].ToString();
                }
            }
        }

        // 🔹 Update profile
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "UPDATE Students SET Name=@name, BankDetails=@bank WHERE StudentID=@sid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@bank", txtBank.Text);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                cmd.ExecuteNonQuery();

                lblMsg.Text = "Profile Updated Successfully";
            }
        }

        // 🔹 Change password
        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "UPDATE Students SET Password=@pass WHERE StudentID=@sid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@pass", txtNewPass.Text);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                cmd.ExecuteNonQuery();

                lblMsg.Text = "Password Changed Successfully";
            }
        }
    }
}