using System;
using System.Data.OleDb;
using System.Diagnostics;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;


namespace GIP_Waterrecuperatie
{
    public class Worker
    {
        public void StartProcessing(CancellationToken cancellationToken = default(CancellationToken))
        {
            const int PORT_NO = 5320;

            string connString = Variables.connString;
            string query;

            DateTime vorigRequest = DateTime.Now;
            DateTime currentTime = DateTime.Now;

            TcpListener listener = new TcpListener(IPAddress.Any, PORT_NO);
            listener.Start();
            while (true)
            {
                Debug.WriteLine("Waiting...");

                TcpClient client = listener.AcceptTcpClient();

                Debug.WriteLine("Client connected");

                NetworkStream nwStream = client.GetStream();
                byte[] buffer = new byte[client.ReceiveBufferSize];

                int bytesRead = nwStream.Read(buffer, 0, client.ReceiveBufferSize);

                string dataReceived = Encoding.ASCII.GetString(buffer, 0, bytesRead);
                Debug.WriteLine("Received : " + dataReceived);

                currentTime = DateTime.Now;

                if (currentTime.Ticks >= vorigRequest.AddSeconds(60).Ticks)
                {
                    try
                    {
                        string percentRain = Convert.ToString(dataReceived.Split(';')[0]);
                        string percentTap = Convert.ToString(dataReceived.Split(';')[1]);
                        string percentBath = Convert.ToString(dataReceived.Split(';')[2]);
                        string stateSSR = Convert.ToString(dataReceived.Split(';')[3]);
                        string valueTemp = Convert.ToString(dataReceived.Split(';')[4]);
                        string valueConsumption = Convert.ToString(dataReceived.Split(';')[5]);
                        string valueRain = Convert.ToString(dataReceived.Split(';')[6]);
                        string valueTap = Convert.ToString(dataReceived.Split(';')[7]);
                        string valueBath = Convert.ToString(dataReceived.Split(';')[8]);

                        query = "INSERT INTO niveaumetingen_regenwater (Tijd, Dag, Maand, Jaar, Niveau, Volume) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + percentRain + "', '" + valueRain + "');";
                        UitvoerenQuery(connString, query);

                        query = "INSERT INTO niveaumetingen_leidingwater (Tijd, Dag, Maand, Jaar, Niveau, Volume) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + percentTap + "', '" + valueTap + "');";
                        UitvoerenQuery(connString, query);

                        query = "INSERT INTO niveaumeting_bad (Tijd, Dag, Maand, Jaar, Niveau, Volume) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + percentBath + "', '" + valueBath + "');";
                        UitvoerenQuery(connString, query);

                        query = "INSERT INTO status_compressor (Tijd, Dag, Maand, Jaar, SSR_state) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + stateSSR + "');";
                        UitvoerenQuery(connString, query);

                        query = "INSERT INTO temperatuurmeting (Tijd, Dag, Maand, Jaar, Temperatuur) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + valueTemp + "');";
                        UitvoerenQuery(connString, query);

                        query = "INSERT INTO debietmeting (Tijd, Dag, Maand, Jaar, Verbruik) VALUES ('" + DateTime.Now.ToString("HH:mm") + "', '" + currentTime.Day + "', '" + currentTime.Month + "', '" + currentTime.Year + "', '" + valueConsumption + "');";
                        UitvoerenQuery(connString, query);

                        Debug.WriteLine("Data has been placed into the database");
                    }
                    catch
                    {
                        Debug.WriteLine("Wrong format!");
                    }
                    finally
                    {
                        vorigRequest = currentTime;
                    }
                }

                client.Close();
            }
            listener.Stop();
        }
        private void ProcessCancellation()
        {
            Debug.WriteLine("Arduino has stopped");
            Thread.Sleep(10000);
        }

        static void UitvoerenQuery(string connString, string query)
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = connString;

            try
            {
                connection.Open();

                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = query;

                command.ExecuteNonQuery();
            }

            catch (OleDbException error)
            {
                Debug.WriteLine(error.Message);
            }

            finally
            {
                Logs.DataWrite();
                connection.Close();
            }


        }
    }
}