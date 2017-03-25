using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using winCBCS.utility;
using System.Configuration;

namespace winCBCS.student
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadData();
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

        protected void btnEdit_Click1(object sender, EventArgs e)
        {
        }
        private void LoadData()
        {
            try
            {
                DataRow dr = DBConnection.GetDataRow("select * from timetable_student where (student_id='" + studentId + "')");
                txtName.Text = dr["student_name"].ToString();
                txtRoll.Text = dr["student_rollno"].ToString();
                txtEmail.Text = dr["student_email"].ToString();
                
            }
            catch (Exception e)
            {

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            if (btnEdit.Text.Equals("Edit"))
            {
                txtName.ReadOnly = false;
                txtRoll.ReadOnly = false;
                txtEmail.ReadOnly = false;
                btnEdit.Text = "Update";
            }
            else if (btnEdit.Text.Equals("Update"))
            {

                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_student set student_name='" + txtName.Text + "',student_rollno='" + txtRoll.Text + "',student_email='" + txtEmail.Text + "' where (student_id='" + studentId + "')", con);
                int id = Int32.Parse(studentId);
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
                btnEdit.Text = "Edit";
                txtName.ReadOnly = true;
                txtRoll.ReadOnly = true;
                txtEmail.ReadOnly = true;

            }
        }

      

    }
}