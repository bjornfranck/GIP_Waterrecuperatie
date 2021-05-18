using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Collections;
using System.Diagnostics;

namespace GIP_Waterrecuperatie
{
    public class Database
    {
        /*
         * De connectie met de database zal hier gedaan worden. Ook de instructie's voor het 
         * opvragen en wegschrijven van gegevens zal hier gebeuren.
         */

        private string connString = Variables.connString;
        private string query;
        public string value;

        public string LevelRainwater ()
        {
            query = "SELECT Niveau FROM niveaumetingen_regenwater WHERE id=(SELECT max(id) FROM niveaumetingen_regenwater); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string LevelTapWater()
        {
            query = "SELECT Niveau FROM niveaumetingen_leidingwater WHERE id=(SELECT max(id) FROM niveaumetingen_leidingwater); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string LevelBath()
        {
            query = "SELECT Niveau FROM niveaumeting_bad WHERE id=(SELECT max(id) FROM niveaumeting_bad); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string Temperature()
        {
            query = "SELECT Temperatuur FROM temperatuurmeting WHERE id=(SELECT max(id) FROM temperatuurmeting); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string Consumption()
        {
            query = "SELECT Verbruik FROM debietmeting WHERE id=(SELECT max(id) FROM debietmeting); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string Compressor()
        {
            string state;

            query = "SELECT SSR_state FROM status_compressor WHERE id=(SELECT max(id) FROM status_compressor); ";
            value = DisplayData(connString, query);

            if(value == "1")
            {
                state = "Ingeschakeld";
            }
            else
            {
                state = "Uitgeschakeld";
            }

            return state;
        }

        public string lblRainValue()
        {
            query = "SELECT Volume FROM niveaumetingen_regenwater WHERE id=(SELECT max(id) FROM niveaumetingen_regenwater); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string lblTapValue()
        {
            query = "SELECT Volume FROM niveaumetingen_leidingwater WHERE id=(SELECT max(id) FROM niveaumetingen_leidingwater); ";
            value = DisplayData(connString, query);

            return value;
        }

        public string lblBathValue()
        {
            query = "SELECT Volume FROM niveaumeting_bad WHERE id=(SELECT max(id) FROM niveaumeting_bad); ";
            value = DisplayData(connString, query);

            return value;
        }

        static string DisplayData(string connString, string query)
        {
            OleDbDataReader reader = null;
            OleDbConnection connection = new OleDbConnection();
            string result = string.Empty;

            connection.ConnectionString = connString;

            try
            {
                connection.Open();

                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = query;

                reader = command.ExecuteReader();

                if (reader.Read() == true)
                {
                    result = Convert.ToString(reader[0]);
                }
            }
            catch (OleDbException error)
            {
                Console.WriteLine(error.Message);
            }
            finally
            {
                Logs.DataRead();
                connection.Close();
            }

            return result;
        }
    }
}