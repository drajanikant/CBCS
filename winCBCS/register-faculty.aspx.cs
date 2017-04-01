using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using winCBCS.utility;

namespace winCBCS
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadProgramme();
            }
            
        }
        private void LoadProgramme()
        {
            try
            {
                drdProgramme.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course");
                drdProgramme.DataTextField = "course_name";
                drdProgramme.DataValueField = "course_name";
                drdProgramme.DataBind();
                drdProgramme.Items.Insert(0, "");
            }
            catch (Exception)
            {

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int hour=0;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("INSERT INTO timetable_faculty( faculty_empid,faculty_name,faculty_label,faculty_programme, faculty_designation, faculty_experience, faculty_qualification, faculty_workinghour, faculty_email, faculty_password) values ( ?faculty_empid,?faculty_name, ?faculty_label,?faculty_programme, ?faculty_designation, ?faculty_experience, ?faculty_qualification, ?faculty_workinghour, ?faculty_email, ?faculty_password)", con);

            cmd.Parameters.AddWithValue("?faculty_empid",txtEmpId.Text);
            cmd.Parameters.AddWithValue("?faculty_designation",drdDesignation.Text);
            cmd.Parameters.AddWithValue("?faculty_experience",txtExperiance.Text);
            cmd.Parameters.AddWithValue("?faculty_qualification",txtQualification.Text);

            cmd.Parameters.AddWithValue("?faculty_label",txtLabel.Text);
            cmd.Parameters.AddWithValue("?faculty_programme",drdProgramme.Text);
                        if(drdDesignation.Text.Equals("H.O.D."))
                        {
                            hour=10;
                        }
                        else if(drdDesignation.Text.Equals("Professor"))
                        {
                            hour=12;
                        }
                        else if(drdDesignation.Text.Equals("Associate Professor"))
                        {
                            hour=14;
                        }
                        else if(drdDesignation.Text.Equals("Senior Assistant Professor"))
                        {
                            hour=16;
                        }
                        else if(drdDesignation.Text.Equals("Assistant Professor"))
                        {
                            hour=18;
                        }
            cmd.Parameters.AddWithValue("?faculty_workinghour",hour);
            cmd.Parameters.AddWithValue("?faculty_email",txtEmail.Text);
            cmd.Parameters.AddWithValue("?faculty_password",txtConfirm.Text);
            cmd.Parameters.AddWithValue("?faculty_name", txtName.Text);



            try
            {
                con.Open();
                int res=cmd.ExecuteNonQuery();
                if(res>0)
                {
                    alert_success.Visible=true;
                }
                else
                {
                    alert_error.Visible=true;
                }
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ee)
            {
                alert_error.Visible=true;
                error_msg.InnerHtml=""+ee.Message;
                
            }

        }
    }
}