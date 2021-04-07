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
    public partial class update : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            DOBCompare.ValueToCompare = DateTime.Now.AddYears(-23).ToString("dd/MM/yyyy");
      
                //your code here...

                if (Session["user"] == null)
                {
                    Response.Redirect("login.aspx");
                }
            else
            {
                string id = Session["user"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select uname from EmpInfo where id='" + id + "'", con);
                    string name = cmd.ExecuteScalar().ToString();
                    cmd.CommandText = "select number from EmpInfo where id='" + id + "'";
                    string number = cmd.ExecuteScalar().ToString();
                    cmd.CommandText = "select dob from EmpInfo where id='" + id + "'";
                    string dob = DateTime.Parse(cmd.ExecuteScalar().ToString()).ToString("yyyy-MM-dd");
                    if (!Page.IsPostBack)
                    {
                        Full_Name.Text = name;
                        Mobile.Text = number;
                        DOB.Text = dob;
                    }
                }
                }
            }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string id = Session["user"].ToString();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update EmpInfo set uname='" + Full_Name.Text + "',number='"+Mobile.Text+"',dob='"+DOB.Text+"' where id='"+id+"'", con);
                cmd.ExecuteNonQuery();
                Label_Status.Text = "Updated Successfully";
            }
        }


    }
}