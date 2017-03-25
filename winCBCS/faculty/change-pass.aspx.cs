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

namespace winCBCS.faculty
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false ;
                
            }
        }
        String email,facultyId;
        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["FacultyCookie"];
            if (ck != null)
            {
                faculty_name.InnerHtml = ck["facultyName"].ToString();
                email = ck["facultyEmpid"].ToString();
                facultyId = ck["facultyId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }
        

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text.Equals(txtConfirmPass.Text))
            { 
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_faculty set faculty_password=?faculty_password where (faculty_id=?faculty_id and faculty_password='"+txtCurrentPass.Text+"')", con);

                cmd.Parameters.AddWithValue("?faculty_password", txtConfirmPass.Text);

                int id = Int32.Parse(facultyId);
                cmd.Parameters.AddWithValue("?faculty_id", id);
                
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

        protected void txtCurrentPass_TextChanged(object sender, EventArgs e)
        {

        }
    }
}