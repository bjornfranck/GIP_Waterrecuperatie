using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Waterrecuperatie
{
    public partial class temperatuurmeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null && (bool)Session["Login"] != true)
            {
                Response.Redirect("Login.aspx");
            }

            Logs.NextPage("Temperature");
        }
    }
}