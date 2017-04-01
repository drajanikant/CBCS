using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using winCBCS.utility;

namespace winCBCS.faculty
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if(!IsPostBack)
            {
                
                
                    alert_error.Visible = false;
                    alert_success.Visible = false;
                    LoadCourse();
                    
                
            }
        }

       



        private void LoadCourse()
        {
            drpprogram.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course ");
            drpprogram.DataTextField = "course_name";
            drpprogram.DataValueField = "course_name";
            drpprogram.DataBind();
            drpprogram.Items.Insert(0, "");
        }

        private void LoadAcademicSem()
        {
            drpsem.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course where course_name='"+drpprogram.SelectedItem.ToString()+"'");
            drpsem.DataTextField = "course_academic_sem";
            drpsem.DataValueField = "course_academic_sem";
            drpsem.DataBind();
            drpsem.Items.Insert(0, "");
        }


        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["FacultyCookie"];
            if (ck != null)
            {
                faculty_name.InnerHtml = ck["facultyName"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("faculty_timetable.aspx");
        }

        protected void drpprogram_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpsem.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course where course_name='" + drpprogram.SelectedItem.ToString() + "'");
            drpsem.DataTextField = "course_academic_sem";
            drpsem.DataValueField = "course_academic_sem";
            drpsem.DataBind();
            drpsem.Items.Insert(0, "");
        }
    }
}