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
              if (btnEdit.Text.Equals("Edit"))
            {
                txtStudentName.ReadOnly = false;
                txtStudentRollno.ReadOnly = false;
                txtEmail1.Enabled = true;
                btnEdit.Text = "Update";
            }
            else if (btnEdit.Text.Equals("Update"))
            {

                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_student set student_name='"+txtStudentName.Text+"',student_rollno='"+txtStudentRollno.Text+"',student_email='"+txtEmail1.Text+"' where (student_id='"+studentId+"')", con);
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
                txtStudentName.ReadOnly = true;
                txtStudentRollno.ReadOnly = true;
                txtEmail1.ReadOnly = true;
                            
            }
        }
        private void LoadData()
        {
            try
            {
                DataRow dr = DBConnection.GetDataRow("select * from timetable_student where (student_id='" + studentId + "')");
                txtStudentName.Text = dr["student_name"].ToString();
                txtStudentRollno.Text = dr["student_rollno"].ToString();
                txtEmail1.Text = dr["student_email"].ToString();
                txtStudentName.ReadOnly = true;
                txtStudentRollno.ReadOnly = true;
                txtEmail1.ReadOnly = true;
            }
            catch (Exception e)
            {

            }
        }

      

    }
}