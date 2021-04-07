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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from EmpInfo where name like 'he%'", con);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("ID");
                    dt.Columns.Add("Name");
                    dt.Columns.Add("Value");
                    dt.Columns.Add("Value1");
                    dt.Columns.Add("Value2");
                    dt.Columns.Add("Value3");
                    dt.Columns.Add("Value4");
                    dt.Columns.Add("Value5");

                    while (rdr.Read())
                    {
                        DataRow dr = dt.NewRow();
                        dr["ID"] = rdr["id"];
                        dr["Name"] = rdr["name"];
                        dr["Value"] = "static";
                        dr["Value1"] = "static1rgegtrgs";
                        dr["Value2"] = "static2";
                        dr["Value3"] = "static2ewd";
                        dr["Value4"] = "static2vrv";
                        dr["Value5"] = "static2rgtr";



                        dt.Rows.Add(dr);

                    }
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                


            }



        }
    }
}