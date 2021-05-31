using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;

namespace GIP_Waterrecuperatie
{
    public partial class debietmeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null && (bool)Session["Login"] != true)
            {
                Response.Redirect("Login.aspx");
            }

            Logs.NextPage("Consumption");
        }
    }
}