using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: clear session when opening login page
            Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "SELECT COUNT(*) FROM Students WHERE StudentID=@id AND Password=@pass";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", txtStudentID.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    // ✅ Login success
                    Session["StudentID"] = txtStudentID.Text;

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    // ❌ Login failed
                    lblMessage.Text = "Invalid Student ID or Password";
                }
            }
        }
    }
}