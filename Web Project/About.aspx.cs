using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class About : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentCount();
            }
        }

        void LoadStudentCount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT COUNT(*) FROM Students";
                    SqlCommand cmd = new SqlCommand(query, con);

                    int count = (int)cmd.ExecuteScalar();

                    lblStudentCount.Text = count.ToString();
                }
            }
            catch
            {
                lblStudentCount.Text = "0";
            }
        }
    }
}