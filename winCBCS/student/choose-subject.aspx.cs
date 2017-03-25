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
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadAcademicYear();
                LoadCourse();
            }
            CheckCookies();
        }
        static String studentId;
        static int core_credits = 0;
        int elective_credits = 0;
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
            

            String SubjectType = "2";
            try
            {
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name  from timetable_subject where subject_type='" + SubjectType + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' ", con);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();

                cbElective.DataTextField = "name";
                cbElective.DataValueField = "subject_id";
                cbElective.DataSource = dr;
                cbElective.DataBind();
                con.Close();
            }
            catch (Exception)
            {
            }


            String type = "1";
            try
            {
                lbCore.DataSource = DBConnection.GetDataTable("select subject_id, CONCAT(subject_name,' [ credits : ', subject_credit,' ]') as name from timetable_subject where subject_type='" + type + "' and subject_semester='" + drdSem.SelectedItem.ToString() + "' and course_name='" + drdCourse.SelectedItem.ToString() + "'");
                lbCore.DataTextField = "name";
                lbCore.DataValueField = "subject_id";
                lbCore.DataBind();
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
                foreach (ListItem item in cbElective.Items)
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
            foreach (ListItem item in cbElective.Items)
            {
                
                if (item.Selected)
                {
                    string input = item.ToString();
                    string pattern = ": ";            // Split on hyphens

                    string[] substrings = Regex.Split(input, pattern);
                    elective_credits += Int32.Parse(substrings[1].Substring(0, 1));
                }

              
            }
            total_credit.InnerHtml = "" + (core_credits + elective_credits);
        }

    }
}