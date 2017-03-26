using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using winCBCS.utility;

namespace winCBCS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
           
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("INSERT INTO timetable_incharge( incharge_name, incharge_email, incharge_designation, incharge_password) values ( ?incharge_name, ?incharge_email, ?incharge_designation, ?incharge_password)", con);

            cmd.Parameters.AddWithValue("?incharge_name", txtName.Text);
            cmd.Parameters.AddWithValue("?incharge_email", txtEmail.Text);
            cmd.Parameters.AddWithValue("?incharge_designation", drdDesignation.Text);
            cmd.Parameters.AddWithValue("?incharge_password", txtNewPass.Text);
           

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    alert_success.Visible = true;
                }
                else
                {
                    alert_error.Visible = true;
                }
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ee)
            {
                alert_error.Visible = true;
                error_msg.InnerHtml = "" + ee.Message;

            }

        }
    }
}