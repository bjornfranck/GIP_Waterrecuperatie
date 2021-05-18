using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Diagnostics;


namespace GIP_Waterrecuperatie
{
    public class Logs
    {
        /*
         * Alle logs van actie's uitgevoerd op de website zullen geregistreerd worden hier en opgeslagen voor
         * het gedrag van de gebruikers te registreren en verbeteren voor in de toekomst.
         */

        static private StreamWriter writer;
        static private string filePath = Variables.filePath;

        static public void LoginSucces(string username)
        {
            try
            {
                writer = new StreamWriter(filePath + "Login.txt", true);

                writer.WriteLine("{0} | {1} logged in.", DateTime.Now, username);
            }
            catch (Exception melding)
            {
                Debug.Write(melding.Message);
            }
            finally
            {
                writer.Close();
            }
        }

        static public void LoginFail(string username)
        {
            try
            {
                writer = new StreamWriter(filePath + "Login.txt", true);

                writer.WriteLine("{0} | {1} tried to log in.", DateTime.Now, username);
            }
            catch (Exception melding)
            {
                Debug.Write(melding.Message);
            }
            finally
            {
                writer.Close();
            }
        }

        static public void NextPage(string page)
        {
            try
            {
                writer = new StreamWriter(filePath + "Pages.txt", true);

                writer.WriteLine("{0} | The user has been redirected to {1} page.", DateTime.Now, page);
            }
            catch (Exception melding)
            {
                Debug.Write(melding.Message);
            }
            finally
            {
                writer.Close();
            }
        }

        static public void DataWrite()
        {
            try
            {
                writer = new StreamWriter(filePath + "Data.txt", true);

                writer.WriteLine("{0} | Data has been received an put into the database.", DateTime.Now);
            }
            catch (Exception melding)
            {
                Debug.Write(melding.Message);
            }
            finally
            {
                writer.Close();
            }
        }

        static public void DataRead()
        {
            try
            {
                writer = new StreamWriter(filePath + "Data.txt", true);

                writer.WriteLine("{0} | Data has been read out of the database.", DateTime.Now);
            }
            catch (Exception melding)
            {
                Debug.Write(melding.Message);
            }
            finally
            {
                writer.Close();
            }
        }
    }
    
}