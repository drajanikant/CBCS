using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace winCBCS
{
    public partial class WebForm4 : System.Web.UI.Page
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
            MySqlCommand cmd = new MySqlCommand("Insert into timetable_student ( student_name, student_rollno, student_email, student_password) values ( ?student_name, ?student_rollno, ?student_email, ?student_password)", con);
            cmd.Parameters.AddWithValue("?student_name", txtName.Text);
            cmd.Parameters.AddWithValue("?student_rollno", txtRoll.Text);
            cmd.Parameters.AddWithValue("?student_email", txtEmail.Text);
            cmd.Parameters.AddWithValue("?student_password", txtNewPass.Text);

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
                con.Close();
            }
            catch (Exception ee)
            {
                alert_error.Visible = true;
                error_msg.InnerHtml = ee.Message;
            }
            finally {
                if (con!=null)
                {
                    con.Close();
                }
                if (cmd!=null)
                {
                    cmd.Dispose();
                }
            }


        }
    }
}