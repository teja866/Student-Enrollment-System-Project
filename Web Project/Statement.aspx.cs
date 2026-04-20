using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class Statement : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔹 Check login
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadEnrollments();
                LoadPayments();
            }
        }

        // 🔹 Load enrolled courses
        void LoadEnrollments()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT c.CourseName, e.Date 
                                 FROM Enrollments e 
                                 JOIN Courses c ON e.CourseID = c.CourseID 
                                 WHERE e.StudentID = @sid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEnrollments.DataSource = dt;
                gvEnrollments.DataBind();
            }
        }

        // 🔹 Load payment history
        void LoadPayments()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Amount, PaymentDate, Status FROM Payments WHERE StudentID=@sid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPayments.DataSource = dt;
                gvPayments.DataBind();
            }
        }
    }
}