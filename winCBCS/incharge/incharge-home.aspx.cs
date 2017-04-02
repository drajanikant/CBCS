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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CheckCookies();
            if(!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadProgram();
            }
        }

        public void display()
        {


            try
            {
                data_cources.DataSource = DBConnection.GetDataTable("SELECT timetable_faculty.faculty_name,sum(timetable_subject.subject_credit) as totalcredit FROM faculty_choice, timetable_subject, timetable_faculty where timetable_subject.subject_id=faculty_choice.subject_id and timetable_faculty.faculty_id=faculty_choice.faculty_id group by timetable_faculty.faculty_name");
                data_cources.DataBind();
            }
            catch (Exception)
            {

            }

        }
        private void LoadProgram()
        {
            drpprogram.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course ");
            drpprogram.DataTextField = "course_name";
            drpprogram.DataValueField = "course_name";
            drpprogram.DataBind();
            drpprogram.Items.Insert(0, "");
        }
        protected void drpprogram_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpYear.DataSource = DBConnection.GetDataTable("select distinct course_academic_year from timetable_course where course_name='" + drpprogram.SelectedItem.ToString() + "'");
            drpYear.DataTextField = "course_academic_year";
            drpYear.DataValueField = "course_academic_year";
            drpYear.DataBind();
            drpYear.Items.Insert(0, "");
        }

        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            display();
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

        protected void btnStud_Click(object sender, EventArgs e)
        {
            display1();
        }

        public void display1()
        {


            try
            {
                datastud.DataSource = DBConnection.GetDataTable("SELECT timetable_student.student_name,sum(timetable_subject.subject_credit),sum(timetable_subject.lacture_credit),sum(timetable_subject.practical_credit),sum(timetable_subject.tutorial_credit) FROM timetable_subject,timetable_choice, timetable_student where timetable_subject.subject_id=timetable_choice.choice_subjectid and timetable_student.student_id=timetable_choice.choice_studid and (timetable_subject.subject_type=1 or timetable_subject.subject_type=2 or timetable_subject.subject_type=3) group by timetable_student.student_name");
                datastud.DataBind();
            }
            catch (Exception)
            {

            }

        }
    }
}