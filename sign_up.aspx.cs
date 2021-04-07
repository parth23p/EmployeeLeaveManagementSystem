using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace Project
{
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DOBCompare.ValueToCompare = DateTime.Now.AddYears(-2).ToString("dd/MM/yyyy");

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string id = Guid.NewGuid().ToString("N");
            int leftLeaves = 24;
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select  count(*) from EmpInfo where email='" + Email.Text + "'", con);
                con.Open();
                object userExist = cmd.ExecuteScalar();
         
                if (Convert.ToInt32(userExist) > 0 )
                {
                    Response.Write("User Exists");
                }
                else
                {
                    cmd.CommandText = "insert into EmpInfo values(@id,@email,@pass,@uname,@dob,@gender,@number,@leftLeaves)";
                    cmd.Parameters.AddWithValue("@uname", Full_Name.Text);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@email", Email.Text);
                    cmd.Parameters.AddWithValue("@pass", password.Text);
                    cmd.Parameters.AddWithValue("@dob", DOB.Text);
                    cmd.Parameters.AddWithValue("@number", Mobile.Text);
                    cmd.Parameters.AddWithValue("@gender", Gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@leftLeaves", leftLeaves);
                    cmd.ExecuteNonQuery();

                    HttpCookie cookie = new HttpCookie("empinfo");
                    cookie["id"] = id;
                    Response.Cookies.Add(cookie);
                    cookie.Expires = DateTime.Now.AddYears(1);
                    Full_Name.Text = "";
                    DOB.Text = "";
                    password.Text = "";
                    Email.Text = "";
                    Mobile.Text = "";
                    Gender.Text = "";
                    Response.Redirect("login.aspx");
                }
            }
           
        }

    }
}