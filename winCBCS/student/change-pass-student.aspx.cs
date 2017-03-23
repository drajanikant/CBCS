using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using winCBCS.utility;

namespace winCBCS.student
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;

            }
        }
        String studentId;
        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["StudentCookie"];
            if (ck != null)
            {
                student_name.InnerHtml = ck["studentName"].ToString();
                studentId = ck["studentId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text.Equals(txtCnfPass.Text))
            {
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_student set student_password=?student_password where (student_id=?student_id and student_password='" + txtCurrentPass.Text + "')", con);

                cmd.Parameters.AddWithValue("?student_password", txtCnfPass.Text);

                int id = Int32.Parse(studentId);
                cmd.Parameters.AddWithValue("?student_id", id);

                try
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        alert_success.Visible = true;
                        alert_error.Visible = false;
                    }
                    else
                    {
                        alert_error.Visible = true;
                        alert_success.Visible = false;
                    }
                    con.Close();
                }
                catch (Exception ee)
                {
                    alert_error.Visible = true;
                    error_msg.InnerHtml = "" + ee.Message;
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                        con.Dispose();
                    }
                    if (cmd != null)
                    {
                        cmd.Dispose();
                    }
                }
            }
        }
        
    }
}