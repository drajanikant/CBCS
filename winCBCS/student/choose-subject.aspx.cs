using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace winCBCS.student
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadAcademicYear();
                LoadCourse();
            }
            CheckCookies();
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

        private void LoadAcademicYear()
        {
            try
            {
                drdYear.DataSource = DBConnection.GetDataTable("Select distinct course_academic_year from timetable_course ");
                drdYear.DataTextField = "course_academic_year";
                drdYear.DataValueField = "course_academic_year";
                drdYear.DataBind();
                drdYear.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        protected void drdYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drdSem.DataSource = DBConnection.GetDataTable("select  course_academic_sem from timetable_course where course_academic_year='" + drdYear.SelectedItem.ToString() + "'");
                drdSem.DataTextField = "course_academic_sem";
                drdSem.DataValueField = "course_academic_sem";
                drdSem.DataBind();
                drdSem.Items.Insert(0, "");
            }
            catch (Exception)
            { 
            }
        }

        protected void drdSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            

            String SubjectType = "elective subject";
            try
            {
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("select  * from timetable_subject where subject_type='" + SubjectType + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' ", con);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();

                cbElective.DataTextField = "subject_name";
                cbElective.DataValueField = "subject_name";
                cbElective.DataSource = dr;
                cbElective.DataBind();

               /* while (dr.Read())
                {
                    ListItem item = new ListItem();
                    item.Text = dr["subject_name"].ToString();
                    item.Value = dr["subject_name"].ToString();

                    item.Selected = Convert.ToBoolean(dr["IsSelected"]);
                    cbElective.Items.Add(item);
                }*/
                con.Close();
            }
            catch (Exception)
            {
            }

        }

        private void LoadCourse()
        {
            try
            {
                drdCourse.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course ");
                drdCourse.DataTextField = "course_name";
                drdCourse.DataValueField = "course_name";
                drdCourse.DataBind();
                drdCourse.Items.Insert(0, "");
            }
            catch (Exception) { }
        }

        protected void drdCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            String type = "core subject";
            try
            {
                lbCore.DataSource = DBConnection.GetDataTable("select  subject_name from timetable_subject where subject_type='" + type + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' and course_name='" + drdCourse.SelectedItem.ToString() + "'");
                lbCore.DataTextField = "subject_name";
                lbCore.DataValueField = "subject_name";
                lbCore.DataBind();
                // lbCore.Items.Insert(0, "");
            }
            catch (Exception)
            {
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("insert into timetable_choice (choice_studid,choice_subjectid,) values(?choice_studid,?choice_subjectid)", con);
           /* cmd.Parameters.AddWithValue("?subject_name", txtSubject.Text);
            cmd.Parameters.AddWithValue("?subject_semester", drpAcademicsemester.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?subject_maxstudent", txtMaxstudent.Text);
            cmd.Parameters.AddWithValue("?subject_minstudent", txtMinstudent.Text);*/
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