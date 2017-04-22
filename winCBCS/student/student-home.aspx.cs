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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if(!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
            LoadCurriculum();
            }
        }

        private void CheckCookies() {
            HttpCookie ck = Request.Cookies["StudentCookie"];
            if (ck != null)
            {
                student_name.InnerHtml = ck["studentName"].ToString();
            }
            else {
                Response.Redirect("../logout.aspx");
            }
        }

        private void LoadCurriculum()
        {
            drpCurriculum.DataSource = DBConnection.GetDataTable("select distinct program_curriculum from timetable_course ");
            drpCurriculum.DataTextField = "program_curriculum";
            drpCurriculum.DataValueField = "program_curriculum";
            drpCurriculum.DataBind();
            drpCurriculum.Items.Insert(0, "");
        }

        protected void drpprogram_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpYear.DataSource = DBConnection.GetDataTable("select distinct course_academic_year from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "'and course_name='"+drpprogram.SelectedItem.ToString()+"' ");
            drpYear.DataTextField = "course_academic_year";
            drpYear.DataValueField = "course_academic_year";
            drpYear.DataBind();
            drpYear.Items.Insert(0, "");
        }

        protected void drpCurriculum_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpprogram.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where program_curriculum='"+drpCurriculum.SelectedItem.ToString()+"' ");
            drpprogram.DataTextField = "course_name";
            drpprogram.DataValueField = "course_name";
            drpprogram.DataBind();
            drpprogram.Items.Insert(0, "");
        }

       



        protected void drpSem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            timetable.DataSource = DBConnection.GetDataTable("SELECT * FROM timetable_dept where  semester like '" + drpsem.SelectedItem + "' order by `day` ");
            timetable.DataBind();
           
        }

        protected void drpYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpsem.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "'and course_name='" + drpprogram.SelectedItem.ToString() + "' and course_academic_year='" + drpYear.SelectedItem.ToString() + "' ");
            drpsem.DataTextField = "course_academic_sem";
            drpsem.DataValueField = "course_academic_sem";
            drpsem.DataBind();
            drpsem.Items.Insert(0, "");
        }

        protected void drpsem_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}