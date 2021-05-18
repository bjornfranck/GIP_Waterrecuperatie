using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace GIP_Waterrecuperatie
{
    public class HashCode
    {
        public string PassHash(string data)
        {
            SHA1 sha = SHA1.Create();
            byte[] hashdata = sha.ComputeHash(Encoding.Default.GetBytes(data));
            StringBuilder returnvalue = new StringBuilder();

            for (int i = 0; i < hashdata.Length; i++)
            {
                returnvalue.Append(hashdata[i].ToString());
            }

            return returnvalue.ToString();
        }
    }
}