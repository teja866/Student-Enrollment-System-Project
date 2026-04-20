using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class Enrollment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCourses();
                LoadEnrollments();
            }
        }

        // 🔹 Load courses into dropdown
        void LoadCourses()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Courses", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCourse.DataSource = dt;
                ddlCourse.DataTextField = "CourseName";
                ddlCourse.DataValueField = "CourseID";
                ddlCourse.DataBind();
            }
        }

        // 🔹 Enroll button click
        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "INSERT INTO Enrollments (StudentID, CourseID, Date) VALUES (@sid, @cid, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);
                cmd.Parameters.AddWithValue("@cid", ddlCourse.SelectedValue);

                cmd.ExecuteNonQuery();

                lblMsg.Text = "Enrollment Successful";

                LoadEnrollments();
            }
        }

        // 🔹 Load enrolled courses into GridView
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

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}