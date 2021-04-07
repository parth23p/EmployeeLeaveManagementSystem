using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LeaveMangaement
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select count(*) from EmpInfo", con);
                con.Open();
                object totalEmp = cmd.ExecuteScalar();
                Int32 totalEmployee = Convert.ToInt32(totalEmp);
                totalEmployees.InnerHtml = "Total Registered Employees  :  " + totalEmployee;

                cmd.CommandText = "select count(*) from EmpLeave where stat='Pending For Approval'";
                object Pending = cmd.ExecuteScalar();
                Int32 totalPending = Convert.ToInt32(Pending);
                totalPendings.InnerHtml = "Total Pending Leaves  :  " + totalPending;

            }

        }
    }
}