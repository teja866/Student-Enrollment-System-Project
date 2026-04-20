using System;
using System.Web;
using System.Web.UI;

namespace Web_Project
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔹 Show logged-in user
            if (Session["StudentID"] != null)
            {
                lblUser.Text = "Welcome, " + Session["StudentID"].ToString();
            }
            else
            {
                lblUser.Text = "";
            }
        }

        // 🔹 LOGOUT BUTTON CLICK (THIS IS IMPORTANT)
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}