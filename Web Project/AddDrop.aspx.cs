using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class AddDrop : System.Web.UI.Page
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
                LoadCourses();
                LoadHistory();
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

        // 🔹 Button click (Add / Drop)
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string action = "";

                // 🔸 ADD COURSE
                if (rbAdd.Checked)
                {
                    action = "Add";

                    string insert = "INSERT INTO Enrollments (StudentID, CourseID, Date) VALUES (@sid, @cid, GETDATE())";

                    SqlCommand cmd1 = new SqlCommand(insert, con);
                    cmd1.Parameters.AddWithValue("@sid", Session["StudentID"]);
                    cmd1.Parameters.AddWithValue("@cid", ddlCourse.SelectedValue);

                    cmd1.ExecuteNonQuery();
                }

                // 🔸 DROP COURSE
                else if (rbDrop.Checked)
                {
                    action = "Drop";

                    string delete = "DELETE FROM Enrollments WHERE StudentID=@sid AND CourseID=@cid";

                    SqlCommand cmd2 = new SqlCommand(delete, con);
                    cmd2.Parameters.AddWithValue("@sid", Session["StudentID"]);
                    cmd2.Parameters.AddWithValue("@cid", ddlCourse.SelectedValue);

                    cmd2.ExecuteNonQuery();
                }

                else
                {
                    lblMsg.Text = "Please select Add or Drop option";
                    return;
                }

                // 🔸 SAVE HISTORY
                string history = "INSERT INTO AddDropHistory (StudentID, CourseID, Action, Date) VALUES (@sid, @cid, @act, GETDATE())";

                SqlCommand cmd3 = new SqlCommand(history, con);
                cmd3.Parameters.AddWithValue("@sid", Session["StudentID"]);
                cmd3.Parameters.AddWithValue("@cid", ddlCourse.SelectedValue);
                cmd3.Parameters.AddWithValue("@act", action);

                cmd3.ExecuteNonQuery();

                lblMsg.Text = "Action Completed Successfully";

                LoadHistory();
            }
        }

        // 🔹 Load history into GridView
        void LoadHistory()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT c.CourseName, h.Action, h.Date
                                 FROM AddDropHistory h
                                 JOIN Courses c ON h.CourseID = c.CourseID
                                 WHERE h.StudentID = @sid";

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