using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace LeaveMangaement
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = GetData();
            Repeater.DataSource = ds;
            Repeater.DataBind();

        }
       
        public DataSet GetData()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("select uname,email,from_date,to_date,type_of_leave,stat,descrip,leaveId from EmpInfo, EmpLeave where EmpInfo.id=EmpLeave.id", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
        }
        protected void approveLeave_changeStatus(string leaveIdApprove)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE EmpLeave SET stat='Approved' where leaveId='" + leaveIdApprove + "'", con);
                cmd.ExecuteNonQuery();
            }
        }
        protected void denyLeave_changeStatus(string leaveIdDeny)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE EmpLeave SET stat='Denied' where leaveId='" + leaveIdDeny + "'", con);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select id from EmpLeave where leaveId='" + leaveIdDeny + "'";
                string id = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "select daysOfLeave from EmpLeave where leaveId='" + leaveIdDeny + "'";
                int daysOfLeave = Convert.ToInt32(cmd.ExecuteScalar());
                Response.Write("id:"+id+" , " +daysOfLeave+"");
                cmd.CommandText = "Update EmpInfo set leftLeaves=leftLeaves + '"+daysOfLeave+"' where id='" + id + "'";
                cmd.ExecuteNonQuery();

            }
        }
        protected void action_Approve_Deny_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            switch (btn.CommandName)
            {
                case "approveLeave":
                   string leaveIdApprove=btn.CommandArgument.ToString();
                    approveLeave_changeStatus(leaveIdApprove);
                    Response.Redirect("leaves-list-admin.aspx");
                    break;
                case "denyLeave":
                    string leaveIdDeny=btn.CommandArgument.ToString();
                    denyLeave_changeStatus(leaveIdDeny);
                    Response.Redirect("leaves-list-admin.aspx");
                    break;
            }
        }
       
    }
}


