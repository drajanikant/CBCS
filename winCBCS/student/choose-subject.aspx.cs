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
                drdSem.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course");
                drdSem.DataTextField = "course_academic_sem";
                drdSem.DataValueField = "course_academic_sem";
                drdSem.DataBind();
                drdSem.Items.Insert(0, "");
            }
            catch (Exception)
            { 
            }
        }
    }
}