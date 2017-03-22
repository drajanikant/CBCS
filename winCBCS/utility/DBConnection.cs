using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace winCBCS.utility
{
    public class DBConnection
    {
        // return Set of Records
        public static DataTable GetDataTable(String SelectQuery)
        {
            DataTable resultDT = new DataTable();
            string ConnectString = ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString;
            MySqlConnection con = new MySqlConnection(ConnectString);
            MySqlCommand cmd = new MySqlCommand(SelectQuery, con);

            con.Open();

            resultDT.Load(cmd.ExecuteReader());

            con.Close();

            return resultDT;
        }


        // return a Single Record
        public static DataRow GetDataRow(String SelectQuery)
        {
            DataTable resultDT = GetDataTable(SelectQuery);

            DataRow resultDR = null;

            if (resultDT.Rows.Count > 0)
                resultDR = resultDT.Rows[0];
            else
                resultDR = null;

            return resultDR;

        }

    }
}