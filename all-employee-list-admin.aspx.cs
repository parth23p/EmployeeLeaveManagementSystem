using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace LeaveMangaement
{
    public partial class all_employee_list_admin : System.Web.UI.Page
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
                SqlDataAdapter sda = new SqlDataAdapter("select * from EmpInfo", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
        }
    }
}