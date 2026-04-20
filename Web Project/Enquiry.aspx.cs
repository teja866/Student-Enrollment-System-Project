using System;

namespace Web_Project
{
    public partial class Enquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: you can check login if needed
             if (Session["StudentID"] == null)
             {
                 Response.Redirect("Login.aspx");
             }
        }

        // 🔹 Button click event (this is IMPORTANT)
        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Simple confirmation message
            lblMsg.Text = "Your enquiry has been sent successfully!";

            // Clear textbox after sending
            txtMessage.Text = "";
        }
    }
}