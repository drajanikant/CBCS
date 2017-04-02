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
                data_cources.Visible = false;
                datastud.Visible = false;
                LoadProgram();

              
                
            }
        }

        public void display()//faculty
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
       data_cources.Visible = true;
       datastud.Visible = false;
            
            
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
            datastud.Visible = true;
            data_cources.Visible = false;
            
        }

        public void display1()//student
        {


            try
            {
                datastud.DataSource = DBConnection.GetDataTable("SELECT timetable_student.student_name,sum(timetable_subject.subject_credit) as credits FROM timetable_subject,timetable_choice, timetable_student where timetable_subject.subject_id=timetable_choice.choice_subjectid and timetable_student.student_id=timetable_choice.choice_studid group by timetable_student.student_name");
                datastud.DataBind();
            }
            catch (Exception)
            {

            }
            

        }
    }
}