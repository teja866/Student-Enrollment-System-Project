using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Project
{
    public partial class Payment : System.Web.UI.Page
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
                LoadPayments();
            }
        }

        // 🔹 PAY BUTTON CLICK (this was missing → caused your error)
        protected void btnPay_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string query = "INSERT INTO Payments (StudentID, Amount, PaymentDate, Status) VALUES (@sid, @amt, GETDATE(), 'Paid')";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);
                cmd.Parameters.AddWithValue("@amt", txtAmount.Text);

                cmd.ExecuteNonQuery();

                lblMsg.Text = "Payment Successful";

                LoadPayments();
            }
        }

        // 🔹 LOAD PAYMENT HISTORY
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

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}