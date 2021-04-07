using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project
{
    public partial class RemoveEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet ds = GetData();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        public DataSet GetData()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from EmpInfo", con);
                if (Convert.ToInt32(cmd.ExecuteScalar()) < 1)
                {
                    p1.Visible = true;
                    Panel1.Visible = false;
                    return null;
                }
                else
                {

                    p1.Visible = false;
                    Panel1.Visible = true;
                    SqlDataAdapter sda = new SqlDataAdapter("select * from EmpInfo ", con);
                   
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;
                }

            }
        }
        protected void removeEmployee(string empId)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from EmpLeave where id='" + empId + "'", con);
                cmd.ExecuteNonQuery();
                cmd.CommandText= "Delete from EmpInfo where id = '" + empId + "'";
                cmd.ExecuteNonQuery();
            }
        }
        protected void remove_employee_on_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            switch (btn.CommandName)
            {
                case "removeEmployee":
                    string empId = btn.CommandArgument.ToString();
                    removeEmployee(empId);
                    Response.Redirect("DashBoard-Admin.aspx");
                    break;
               
            }
        }
    }
}