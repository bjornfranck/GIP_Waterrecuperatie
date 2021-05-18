using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Threading;
using System.IO;
using System.Data;
using System.Data.OleDb;

namespace GIP_Waterrecuperatie
{
    public class Login
    {
        /*
         * Alle instructie's die de login en logout moeten ondergaan zullen hier in staan.
         */

        public string username_webpage;
        public string password_webpage;
        HashCode hc = new HashCode();

        public string queryGebruiker;
        public string resultaatGebruiker;
        public string queryPaswoord;
        public string resultaatPaswoord;

        public Login(string username_webpage, string password_webpage)
        {
            this.username_webpage = username_webpage;
            this.password_webpage = password_webpage;
        }

        public int Instruction ()
        {
            int result = 0;

            string connString = Variables.connString;

            queryGebruiker = "SELECT gebruikersnaam FROM gebruikersprofielen WHERE gebruikersnaam='" + this.username_webpage + "' AND paswoord='" + hc.PassHash(this.password_webpage) + "';";
            resultaatGebruiker = DisplayData(connString, queryGebruiker);

            queryPaswoord = "SELECT paswoord FROM gebruikersprofielen WHERE paswoord='" + hc.PassHash(this.password_webpage) + "';";
            resultaatPaswoord = DisplayData(connString, queryPaswoord);


            if ((this.username_webpage == resultaatGebruiker) && (hc.PassHash(this.password_webpage) == resultaatPaswoord))
            {
                result = 1;
            }

            return result;
        }

        static string DisplayData(string connString, string query)
        {
            OleDbDataReader reader = null;
            OleDbConnection connection = new OleDbConnection();

            connection.ConnectionString = connString;

            string data = string.Empty;

            try
            {

                connection.Open();

                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = query;

                reader = command.ExecuteReader();

                if (reader.Read() == true)
                {
                    data = Convert.ToString(reader[0]);
                }
            }
            catch (OleDbException error)
            {
                Console.WriteLine(error.Message);
            }
            finally
            {
                connection.Close();

            }
            return data;

        }
    }
}