using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Include this namespaces
using System.IO;
using System.Xml;
using System.Net;
using Newtonsoft.Json;

namespace AddressFetchUsingIPAddress
{
    public partial class Index : System.Web.UI.Page
    {
        private string myIP = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string hostName = Dns.GetHostName();
            //myIP = IPRequestHelper("http://ipinfo.io/ip");
            //lblIPAddresss.Text = "Your Public IP Address is : " + myIP;
            //lblCountry.Text = GetCountrybyIP();

            foreach (KeyValuePair<string, string> address in GetAdressUsingIP())
            {
               Response.Write(String.Format("{0} : {1} <br/>", address.Key, address.Value));
            }
        }
        private string IPRequestHelper(string url)
        {
            HttpWebRequest objrequest = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse objresponse = (HttpWebResponse)objrequest.GetResponse();
            StreamReader responsereader = new StreamReader(objresponse.GetResponseStream());
            string responseread = responsereader.ReadToEnd();
            responsereader.Close();
            responsereader.Dispose();
            return responseread;
        }
        private string GetCountrybyIP()
        {
            string ipResponse = IPRequestHelper("http://ip-api.com/xml/" + myIP);
            XmlDocument ipInfixml = new XmlDocument();
            ipInfixml.LoadXml(ipResponse);
            XmlNodeList responseXML = ipInfixml.GetElementsByTagName("query");
            string returnvalue = responseXML.Item(0).ChildNodes[1].InnerText.ToString();
            return returnvalue;
        }

        private Dictionary<string, string> GetAdressUsingIP()
        {
            string IPAddress = IPRequestHelper("http://ipinfo.io/ip");
            string json = IPRequestHelper("http://ipinfo.io/" + IPAddress);
            var values = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
            return values;
        }
    }
}