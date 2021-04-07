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
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    SqlDataAdapter da = new SqlDataAdapter("select * from  EmpInfo where  id='" + id + "'", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    r1.DataSource = ds;
                    r1.DataBind();
                }
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Response.Redirect("update.aspx");
        }
    }
}