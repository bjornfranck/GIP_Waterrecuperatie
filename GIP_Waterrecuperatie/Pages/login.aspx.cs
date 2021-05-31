using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Web.Hosting;
using System.Configuration;
using System.Web.Configuration;

namespace GIP_Waterrecuperatie
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Login"] = false;

            Logs.NextPage("Login");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string filePath = Variables.filePath;
            string username_webpage = tbUsername.Text;
            string password_webpage = tbPassword.Text;
            int resultaat;

            Login signUp = new Login(username_webpage, password_webpage);

            resultaat = signUp.Instruction();

            if (resultaat > 0)
            {
                tbUsername.Text = "";
                tbPassword.Text = "";

                Session["LoginPerm"] = true;
                Session["Login"] = true;

                Logs.LoginSucces(username_webpage);
            }
            else
            {
                tbUsername.Text = "";
                tbPassword.Text = "";
                lblResponse.Text = "Foutieve gegevens!";

                Session["LoginPerm"] = false;

                Logs.LoginFail(username_webpage);
            }

            if (Session["Login"] != null && Session["LoginPerm"] != null)
            {
                if ((bool)Session["LoginPerm"] == true && (bool)Session["Login"] == true)
                {
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                Session["Login"] = false;
            }

        }
    }
}