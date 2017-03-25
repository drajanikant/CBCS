using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace winCBCS.faculty
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string faculty_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadAcademicYear();
                LoadList();
            }
        }
        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["FacultyCookie"];
            if (ck != null)
            {
                faculty_name.InnerHtml = ck["facultyName"].ToString();
                faculty_id = ck["facultyId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }
        private void LoadList()
        {
            try
            {
                dataSubjectChoice.DataSource = DBConnection.GetDataTable("SELECT * FROM faculty_choice natural join timetable_subject where (faculty_id='"+faculty_id+"')");
                dataSubjectChoice.DataBind();
            }
            catch (Exception)
            {
            }
        }
        private void LoadAcademicYear()
        {
            try
            {
                drdAcademicYear.DataSource = DBConnection.GetDataTable("Select distinct course_academic_year from timetable_course ");
                drdAcademicYear.DataTextField = "course_academic_year";
                drdAcademicYear.DataValueField = "course_academic_year";
                drdAcademicYear.DataBind();
                drdAcademicYear.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        protected void drdAcademicYear_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                    drdCourseName.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course where course_academic_year ");
                    drdCourseName.DataTextField = "course_name";
                    drdCourseName.DataValueField = "course_name";
                    drdCourseName.DataBind();
                    drdCourseName.Items.Insert(0, "");
            }
            catch (Exception)
            {
                
               
            } 
        }

        protected void drdCourseName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drdSemester.DataSource = DBConnection.GetDataTable("select distinct course_academic_sem from timetable_course");
                drdSemester.DataTextField = "course_academic_sem";
                drdSemester.DataValueField = "course_academic_sem";
                drdSemester.DataBind();
                drdSemester.Items.Insert(0, "");
            }
            catch (Exception)
            {
                
            }
           
        }

        protected void drdSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drdSubjetName.DataSource = DBConnection.GetDataTable("select * from timetable_subject where (academic_year='" + drdAcademicYear.SelectedItem + "' and course_name ='" + drdCourseName.SelectedItem + "' and subject_semester='"+drdSemester.SelectedItem+"')");
                drdSubjetName.DataTextField = "subject_name";
                drdSubjetName.DataValueField = "subject_id";
                drdSubjetName.DataBind();
                drdSubjetName.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("insert into faculty_choice ( faculty_id, subject_id, priority, exprience) values( ?faculty_id, ?subject_id, ?priority, ?exprience)", con);
            cmd.Parameters.AddWithValue("?faculty_id", faculty_id);
            cmd.Parameters.AddWithValue("?subject_id", drdSubjetName.SelectedValue);
            cmd.Parameters.AddWithValue("?priority", drdProirity.Text);
            cmd.Parameters.AddWithValue("?exprience", txtSubExperiance.Text);
            
            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    alert_success.Visible = true;
                    success_msg.InnerHtml = "Choice inserted Successful";
                    LoadList();
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

        protected void dataSubjectChoice_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "data_delete")
            {
                DeleteChoice(e.CommandArgument.ToString());
            }
        }

        private void DeleteChoice(string p)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("delete from faculty_choice where choice_id='" + p + "'", con);

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();
                if (res > 0)
                {
                    alert_success.Visible = true;
                    success_msg.InnerHtml = "Choice deleted Successful";
                }
                else
                {
                    alert_error.Visible = true;
                }
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
            LoadList();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSubExperiance.Text = "";
            drdAcademicYear.SelectedIndex = -1;
            drdCourseName.SelectedIndex = -1;
            drdSemester.SelectedIndex = -1;
            drdProirity.SelectedIndex = -1;
            drdSubjetName.SelectedIndex = -1;

        }
    }
}