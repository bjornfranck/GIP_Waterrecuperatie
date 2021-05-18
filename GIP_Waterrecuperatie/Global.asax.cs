using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using System.ComponentModel;
using System.Web.Hosting;

namespace GIP_Waterrecuperatie
{
    public class Global : HttpApplication
    {
        public static BackgroundWorker worker = new BackgroundWorker();
        public static Dictionary<string, double> value = new Dictionary<string, double>();
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            HostingEnvironment.QueueBackgroundWorkItem(cancellationToken => new Worker().StartProcessing(cancellationToken));
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            /*
            worker.DoWork += new DoWorkEventHandler(ArduinoCommunication);
            worker.WorkerReportsProgress = true;
            worker.WorkerSupportsCancellation = true;
            // Calling the DoWork Method Asynchronously
            worker.RunWorkerAsync();*/
        }
        /*
        void ArduinoCommunication(object sender, DoWorkEventArgs e) {
            while (true)
            {
                
              //  System.Diagnostics.Debug.WriteLine("test");
                List<double> waarden = new List<double>();
                value["rainwater"] = 60;
            }
        }*/
    }
}