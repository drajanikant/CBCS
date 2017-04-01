using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
namespace winCBCS.student
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                status.Visible = true;
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadCurriculum();
                
                
            }
            CheckCookies();
        }
        static String studentId;
        static int foundation_course_credit = 0;
        static int core_credits = 0;
        static int programe_elective_credits = 0;
        static int institute_course_elective_credits = 0;
        static int total_credits_per_semester = 0;
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
                drdYear.DataSource = DBConnection.GetDataTable("Select distinct course_academic_year from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' and course_name='"+drdCourse.SelectedItem.ToString()+"'");
                drdYear.DataTextField = "course_academic_year";
                drdYear.DataValueField = "course_academic_year";
                drdYear.DataBind();
                drdYear.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        private void LoadCurriculum()
        {
            try
            {
                drpCurriculum.DataSource = DBConnection.GetDataTable("Select distinct program_curriculum from timetable_course ");
                drpCurriculum.DataTextField = "program_curriculum";
                drpCurriculum.DataValueField = "program_curriculum";
                drpCurriculum.DataBind();
                drpCurriculum.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        protected void drdYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drdSem.DataSource = DBConnection.GetDataTable("select  course_academic_sem from timetable_course where course_academic_year='" + drdYear.SelectedItem.ToString() + "' and program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "'");
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
            

            String SubjectType = "1";
            try
            {
                cbFoundation.DataSource = DBConnection.GetDataTable("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name  from timetable_subject where subject_type='" + SubjectType + "' and course_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' and course_name='" + drdCourse.SelectedItem.ToString() + "'  and academic_year='" + drdYear.SelectedItem.ToString() + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' ");
                cbFoundation.DataTextField = "name";
                cbFoundation.DataValueField = "subject_id";
                cbFoundation.DataBind();
               
                //con.Close();
            }
            catch (Exception)
            {
            }


            SubjectType = "2";
            try
            {
                lbCore.DataSource = DBConnection.GetDataTable("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name  from timetable_subject where subject_type='" + SubjectType + "' and course_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' and course_name='" + drdCourse.SelectedItem.ToString() + "' and academic_year='"+drdYear.SelectedItem.ToString()+"' and subject_semester='"+ drdSem.SelectedItem.ToString()+ "' ");
                lbCore.DataTextField = "name";
                lbCore.DataValueField = "subject_id";
                lbCore.DataBind();
               }
            catch (Exception)
            {
            }

            SubjectType = "3";
            try
            {
                cboxprogramcourse.DataSource = DBConnection.GetDataTable("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name  from timetable_subject where subject_type='" + SubjectType + "' and course_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' and course_name='" + drdCourse.SelectedItem.ToString() + "'  and academic_year='" + drdYear.SelectedItem.ToString() + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' ");
                cboxprogramcourse.DataTextField = "name";
                cboxprogramcourse.DataValueField = "subject_id";
                cboxprogramcourse.DataBind();
            }
            catch (Exception)
            {
            }

            SubjectType = "4";
            try
            {
                cbOpen.DataSource = DBConnection.GetDataTable("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name  from timetable_subject where subject_type='" + SubjectType + "' and course_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' and  academic_year='" + drdYear.SelectedItem.ToString() + "' and  subject_semester='" + drdSem.SelectedItem.ToString() + "' ");
                cbOpen.DataTextField = "name";
                cbOpen.DataValueField = "subject_id";
                cbOpen.DataBind();
            }
            catch (Exception)
            {
            }

            core_credits = 0;
            
            foreach (ListItem item in lbCore.Items)
            {
                string input = item.ToString();
                string pattern = ": ";            // Split on hyphens

                string[] substrings = Regex.Split(input, pattern);
                core_credits+= Int32.Parse(substrings[1].Substring(0, 1));

            }
            total_credit.InnerHtml= ""+core_credits;
        }

        private void LoadPrograme()
        {
            try
            {
                drdCourse.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' ");
                drdCourse.DataTextField = "course_name";
                drdCourse.DataValueField = "course_name";
                drdCourse.DataBind();
                drdCourse.Items.Insert(0, "");
            }
            catch (Exception) { }
        }

        protected void drdCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAcademicYear();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Int32.Parse(total_credit.InnerHtml) > 30)
            {
                alert_error.Visible = true;
                error_msg.InnerHtml = "Credit limit not exccides than 30 credits";
            }
            else if (Int32.Parse(total_credit.InnerHtml) < 20)
            {
                alert_error.Visible = true;
                error_msg.InnerHtml = "Credit limit not less than 20 credits";
            }
            else
            {
                foreach (ListItem item in cbOpen.Items)
                {

                    if (item.Selected)
                    {
                        string input = item.ToString();
                        string pattern = ": ";            // Split on hyphens

                        string[] substrings = Regex.Split(input, pattern);
                        int credits = Int32.Parse(substrings[1].Substring(0, 1));
                        AddSubjectChoice(credits, Int32.Parse(item.Value));
                    }


                }

                foreach (ListItem item in lbCore.Items)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    int credits = Int32.Parse(substrings[1].Substring(0, 1));
                    AddSubjectChoice(credits, Int32.Parse(item.Value));
                }

                foreach (ListItem item in cbFoundation.Items)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    int credits = Int32.Parse(substrings[1].Substring(0, 1));
                    AddSubjectChoice(credits, Int32.Parse(item.Value));
                }
                foreach (ListItem item in cboxprogramcourse.Items)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    int credits = Int32.Parse(substrings[1].Substring(0, 1));
                    AddSubjectChoice(credits, Int32.Parse(item.Value));
                }
            }
        }

        private void AddSubjectChoice(int credits, int subject_id) { 
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("insert into timetable_choice (choice_studid,choice_subjectid,choice_credit,choice_sem) values(?choice_studid,?choice_subjectid,?choice_credit,?choice_sem)", con);
            cmd.Parameters.AddWithValue("?choice_studid", studentId);
            cmd.Parameters.AddWithValue("?choice_subjectid",subject_id );
            cmd.Parameters.AddWithValue("?choice_credit", credits);
            cmd.Parameters.AddWithValue("?choice_sem", drdSem.SelectedItem.ToString());
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
        protected void cbElective_SelectedIndexChanged(object sender, EventArgs e)
        {
            institute_course_elective_credits = 0;
            foreach (ListItem item in cbOpen.Items)
            {
                
                if (item.Selected)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    institute_course_elective_credits += Int32.Parse(substrings[1].Substring(0, 1));
                }

              
            }
            total_credits_per_semester = foundation_course_credit + core_credits + programe_elective_credits + institute_course_elective_credits;
            total_credit.InnerHtml = "" + (total_credits_per_semester);
        }

        protected void drpCurriculum_(object sender, EventArgs e)
        {

        }

        protected void drpCurriculum_SelectedIndex(object sender, EventArgs e)
        {

        }

        protected void drpCurriculum_SelectedIndexChanged(object sender, EventArgs e)
        {

            LoadPrograme();
        }

        protected void cbFoundation_SelectedIndexChanged(object sender, EventArgs e)
        {
            foundation_course_credit = 0;
            foreach (ListItem item in cbFoundation.Items)
            {

                if (item.Selected)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    foundation_course_credit += Int32.Parse(substrings[1].Substring(0, 1));
                }


            }
            total_credits_per_semester = foundation_course_credit+core_credits+programe_elective_credits+institute_course_elective_credits;
            total_credit.InnerHtml = "" + total_credits_per_semester;
        }

        protected void cboxprogramcourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            programe_elective_credits = 0;
            foreach (ListItem item in cboxprogramcourse.Items)
            {

                if (item.Selected)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                     programe_elective_credits+= Int32.Parse(substrings[1].Substring(0, 1));
                }


            }
            total_credits_per_semester = foundation_course_credit + core_credits + programe_elective_credits + institute_course_elective_credits;
            total_credit.InnerHtml = "" + total_credits_per_semester;
        }

       

    }
}