using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP_Waterrecuperatie
{
    public partial class networkcamera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null && (bool)Session["Login"] != true)
            {
                Response.Redirect("Login.aspx");
            }

            Logs.NextPage("Networkcamera");
        }

        protected void btnCamera_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://192.168.1.8/videostream.cgi?user=admin&pwd=");
        }
    }
}