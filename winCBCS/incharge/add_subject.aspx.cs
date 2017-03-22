using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace winCBCS.incharge
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                               LoadAcademicYear();
                           }
            CheckCookies();
        }

        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["InchargeCookie"];
            if (ck != null)
            {
                incharge_name.InnerHtml = ck["inchargeName"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }


        private void LoadCourse()
        {
            drpCourse.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where course_academic_year ");
            drpCourse.DataTextField = "course_name";
            drpCourse.DataValueField = "course_name";
            drpCourse.DataBind();
            drpCourse.Items.Insert(0,"");
        }

        private void LoadAcademicSem()
        {
            drpAcademicsemester.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course");
            drpAcademicsemester.DataTextField = "course_academic_sem";
            drpAcademicsemester.DataValueField = "course_academic_sem";
            drpAcademicsemester.DataBind();
            drpAcademicsemester.Items.Insert(0, "");
        }

        private void LoadAcademicYear() {
            try
            {
                drpAcademicyear.DataSource = DBConnection.GetDataTable("Select distinct course_academic_year from timetable_course ");
                drpAcademicyear.DataTextField = "course_academic_year";
                drpAcademicyear.DataValueField = "course_academic_year";
                drpAcademicyear.DataBind();
                drpAcademicyear.Items.Insert(0, "");
            }
            catch (Exception)
            {
                
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
        }

        protected void txtMinstudent_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cboxLecture_CheckedChanged(object sender, EventArgs e)
        {
            if (cboxLecture.Checked == true)
            {
                txtLecturecredit.ReadOnly = false;
            }
            else
            {
                txtLecturecredit.ReadOnly = true;
            }
            
        }

        protected void cboxPractical_CheckedChanged(object sender, EventArgs e)
        {
            if (cboxPractical.Checked == true)
            {
                txtpracticalcredit.ReadOnly = false;
            }
            else
            {
                txtpracticalcredit.ReadOnly = true;
            }
        }

        protected void cboxTutorial_CheckedChanged(object sender, EventArgs e)
        {
            if (cboxTutorial.Checked == true)
            {
                txtTutorialcredit.ReadOnly = false; ;
            }
            else
            {
                txtTutorialcredit.ReadOnly = true;
            }
        }

        protected void drpAcademicyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpCourse.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where (course_academic_year='" + drpAcademicyear.SelectedItem.ToString() + "' )");
                drpCourse.DataTextField = "course_name";
                drpCourse.DataValueField = "course_name";
                drpCourse.DataBind();
                drpCourse.Items.Insert(0, "");
            }
            catch (Exception)
            {
                
               
            }
           
        }

        protected void drpCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpAcademicsemester.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course where (course_name='"+drpCourse.SelectedItem.ToString()+"')");
                drpAcademicsemester.DataTextField = "course_academic_sem";
                drpAcademicsemester.DataValueField = "course_academic_sem";
                drpAcademicsemester.DataBind();
                drpAcademicsemester.Items.Insert(0, "");
            }
            catch (Exception)
            {
                
           
            }
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("insert into timetable_subject (subject_name, subject_semester, subject_maxstudent, subject_minstudent, subject_credit, academic_year, course_name, lacture_credit, practical_credit, tutorial_credit,subject_code) values( ?subject_name, ?subject_semester, ?subject_maxstudent, ?subject_minstudent, ?subject_credit, ?academic_year, ?course_name, ?lacture_credit, ?practical_credit, ?tutorial_credit,?subject_code)", con);
            cmd.Parameters.AddWithValue("?subject_name", txtSubject.Text);
            cmd.Parameters.AddWithValue("?subject_semester", drpAcademicsemester.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?subject_maxstudent", txtMaxstudent.Text);
            cmd.Parameters.AddWithValue("?subject_minstudent", txtMinstudent.Text);
            cmd.Parameters.AddWithValue("?subject_credit", txtCredit.Text);
            cmd.Parameters.AddWithValue("?academic_year", drpAcademicyear.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?course_name", drpCourse.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?lacture_credit", txtLecturecredit.Text);
            cmd.Parameters.AddWithValue("?practical_credit", txtpracticalcredit.Text);
            cmd.Parameters.AddWithValue("?tutorial_credit", txtTutorialcredit.Text);
            cmd.Parameters.AddWithValue("?subject_code", txtSubjectCode.Text);

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
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }
        
        }
    }
}