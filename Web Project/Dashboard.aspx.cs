using System;

namespace Web_Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔹 Check if user is logged in
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                // 🔹 Display welcome message
                lblWelcome.Text = "Welcome, " + Session["StudentID"].ToString();
            }
        }
    }
}