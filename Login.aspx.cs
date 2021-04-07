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
    public partial class login : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
          
      
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("sign_up.aspx");

        }

        protected void Login_Click(object sender, EventArgs e)
        {
   
                HttpCookie cookie = Request.Cookies["empinfo"];
               string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                if(Email.Text=="Admin@gmail.com" && Password.Text=="Admin@123")
                {
                    Response.Redirect("DashBoard-Admin.aspx");
                }
                    SqlCommand cmd = new SqlCommand("select  count(*) from EmpInfo where email='" + Email.Text + "' and pass='" + Password.Text + "'", con);
                    con.Open();
                    object userExist = cmd.ExecuteScalar();
                    if (Convert.ToInt32(userExist) > 0)
                    {
                    cmd.CommandText = "select id from EmpInfo where email='" + Email.Text+"'";
                    string id = (string)cmd.ExecuteScalar();
                    cookie["id"] = id;
                        Session["user"] = cookie["id"];
                        Response.Redirect("~/profile.aspx");

                    }
                    else
                        Response.Write("Unauth");


                }
            }
        }
    }
