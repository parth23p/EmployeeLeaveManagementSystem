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
    public partial class denied_list : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select count(*) from EmpLeave where  stat='Denied'", con);
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
                    SqlDataAdapter sda = new SqlDataAdapter("select uname,email, from_date,to_date,type_of_leave,stat,descrip,leaveId from EmpInfo, EmpLeave  where EmpInfo.id=EmpLeave.id and stat='Denied'", con);
                    // cmd.CommandText = "select uname,email,cast(from_date as date) as from_da,cast(to_date as date) as to_da,type_of_leave,stat,descrip from EmpInfo, EmpLeave where EmpInfo.id ='" + id + "' and EmpLeave.id ='" + id + "'";
                    //SqlDataReader dr = cmd.ExecuteReader();
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;
                }

            }
        }
        //(<%#Eval('uid' %>)
        protected void approveLeave_changeStatus(string leaveIdApprove)
        {
            string cs = ConfigurationManager.ConnectionStrings["login"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE EmpLeave SET stat='Approved' where leaveId='" + leaveIdApprove + "'", con);
                cmd.ExecuteNonQuery();
            }
        }
        protected void denyLeave_changeStatus(string leaveIdDeny)
        {
            string cs = ConfigurationManager.ConnectionStrings["login"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE EmpLeave SET stat='Denied' where leaveId='" + leaveIdDeny + "'", con);
                cmd.ExecuteNonQuery();
            }
        }
        protected void action_Approve_Deny_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            switch (btn.CommandName)
            {
                case "approveLeave":
                    string leaveIdApprove = btn.CommandArgument.ToString();
                    approveLeave_changeStatus(leaveIdApprove);
                    Response.Redirect("leaves-list-admin.aspx");
                    break;
                case "denyLeave":
                    string leaveIdDeny = btn.CommandArgument.ToString();
                    denyLeave_changeStatus(leaveIdDeny);
                    Response.Redirect("leaves-list-admin.aspx");
                    break;
            }
        }
    }
}