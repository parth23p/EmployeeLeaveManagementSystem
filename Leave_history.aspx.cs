using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project
{
    public partial class Leave_history : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Write("Expired");
                Response.Redirect("login.aspx");
            }
            else
            {
                string id = Session["user"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("select count(*) from EmpLeave where id ='" + id + "'" , con);
                    con.Open();
                    if (Convert.ToInt32(cmd.ExecuteScalar()) < 1)
                    {
                        p1.Visible = true;
                        Panel1.Visible = false;
                    }
                    else
                    {
                        p1.Visible = false;
                        Panel1.Visible = true;
                        cmd.CommandText = "select uname,email,cast(from_date as date) as from_da,cast(to_date as date) as to_da,type_of_leave,stat,descrip from EmpInfo, EmpLeave where EmpInfo.id ='" + id + "' and EmpLeave.id ='" + id + "'";
                        SqlDataReader dr = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        r1.DataSource = dt;
                        r1.DataBind();

                    }
                    
                }
            }
        }
    }
}