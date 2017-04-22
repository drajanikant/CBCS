using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
namespace winCBCS.incharge
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProgram();
                LoadClass();
            }
        }

        private void LoadProgram()
        {
            try
            {
                drpCurriculum.DataSource = DBConnection.GetDataTable("select distinct program_curriculum from timetable_course ");
                drpCurriculum.DataTextField = "program_curriculum";
                drpCurriculum.DataValueField = "program_curriculum";
                drpCurriculum.DataBind();
                drpCurriculum.Items.Insert(0, "");
            }
            catch (Exception)
            {
               
            }
           
        }

        private void LoadClass()
        {
            try
            {
                DropDownList1.DataSource = DBConnection.GetDataTable("select distinct venue_name from timetable_venue ");
                DropDownList1.DataTextField = "venue_name";
                DropDownList1.DataValueField = "venue_name";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "");
            }
            catch (Exception)
            {
               
            }
           
        }
        protected void drpCurriculum_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpprogram.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "' ");
            drpprogram.DataTextField = "course_name";
            drpprogram.DataValueField = "course_name";
            drpprogram.DataBind();
            drpprogram.Items.Insert(0, "");
        }

        protected void drpprogram_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpYear.DataSource = DBConnection.GetDataTable("select distinct course_academic_year from timetable_course where program_curriculum='" + drpCurriculum.SelectedItem.ToString() + "'and course_name='" + drpprogram.SelectedItem.ToString() + "' ");
            drpYear.DataTextField = "course_academic_year";
            drpYear.DataValueField = "course_academic_year";
            drpYear.DataBind();
            drpYear.Items.Insert(0, "");
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            timetable.DataSource = DBConnection.GetDataTable("SELECT * FROM timetable_dept where  semester like '" + drpsem.SelectedItem + "' and class_room like '"+DropDownList1.SelectedItem+"'");
            timetable.DataBind();
        }
    }
}