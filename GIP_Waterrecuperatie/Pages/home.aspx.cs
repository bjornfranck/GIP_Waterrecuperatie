using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Collections;

namespace GIP_Waterrecuperatie
{
    public partial class home : System.Web.UI.Page
    {
        static private string timeCompressorStart = "--:--";
        static private string timeCompressorStop = "--:--";
        static private string state = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null && (bool)Session["Login"] != true)
            {
                Response.Redirect("Login.aspx");
            }

            Logs.NextPage("Home");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Login"] = false;

            Response.Redirect("login.aspx");
        }

        [System.Web.Services.WebMethod()]
        public static string LoadData(string name = "progressBars")
        {
            string percentRainwater, percentTapwater, percentBath, valueTemperature, valueConsumption, valueCompressor, lblRainValue, lblTapValue, lblBathValue;
            Database progressValues = new Database();

            percentRainwater = progressValues.LevelRainwater();
            percentTapwater = progressValues.LevelTapWater();
            percentBath = progressValues.LevelBath();
            valueTemperature = progressValues.Temperature();
            valueConsumption = progressValues.Consumption();
            valueCompressor = progressValues.Compressor();
            lblRainValue = progressValues.lblRainValue();
            lblTapValue = progressValues.lblTapValue();
            lblBathValue = progressValues.lblBathValue();

            if (valueCompressor == "Ingeschakeld" && state == "0")
            {
                timeCompressorStart = DateTime.Now.ToString("HH:mm");
                timeCompressorStop = "--:--";
                state = "1";
            }
            if (valueCompressor == "Uitgeschakeld" && state == "1")
            {
                timeCompressorStop = DateTime.Now.ToString("HH:mm");
                state = "0";
            }

            return percentRainwater + "#"
                + percentTapwater + "#"
                + percentBath + "#"
                + valueTemperature + "#"
                + valueConsumption + "#"
                + valueCompressor + "#"
                + lblRainValue + "#"
                + lblTapValue + "#"
                + lblBathValue + "#"
                + timeCompressorStart + "#"
                + timeCompressorStop + "#";
        }
    }
}