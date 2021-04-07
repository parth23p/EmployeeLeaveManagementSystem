using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Project
{
    public partial class user_master_page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        
        public  void i1_Click(object sender, EventArgs e)
        {
            Response.Write("Hello");
            Session.Remove("user");
            Response.Redirect("Login.aspx");
        }

        protected void i1_Click1(object sender, EventArgs e)
        {
            
        }
    }
}