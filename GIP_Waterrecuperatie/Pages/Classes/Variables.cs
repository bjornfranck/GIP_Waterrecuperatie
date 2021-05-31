using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Configuration;

namespace GIP_Waterrecuperatie
{
    public class Variables
    {
        /*
         * Elke variabele die aangepast moet worden wanneer
         * het programma op een andere computer opgestard wordt
         * bevind zich hier centraal.
         */

        static public string connString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\franc_au7kam8\Desktop\GIP_Waterrecuperatie\GIP_Waterrecuperatie\Sources\database_waterrecuperatie.accdb; Jet OLEDB:Database Password = Water;";
        static public string filePath = @"C:\Users\franc_au7kam8\Desktop\GIP_Waterrecuperatie\GIP_Waterrecuperatie\Logs\";
    }
}