using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using winCBCS.utility;

namespace winCBCS.incharge
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                
            }
            CheckCookies();
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("insert into timetable_course (course_name, program_curriculum,course_academic_year, course_academic_sem,sem_max_credits,sem_min_credits) values(?course_name, ?program_curriculum,?course_academic_year, ?course_academic_sem,?sem_max_credits,?sem_min_credits)", con);
            cmd.Parameters.AddWithValue("?course_name",drpCoursename.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?program_curriculum", txtCurriculum.Text);
            cmd.Parameters.AddWithValue("?course_academic_year",txtAcademicyear.Text);
            cmd.Parameters.AddWithValue("?course_academic_sem",drpAcademicsemester.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?sem_max_credits", txtMaxcredits.Text);
            cmd.Parameters.AddWithValue("?sem_min_credits", txtMinCredits.Text);
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
                if(con!=null)
                {
                    con.Close();
                }
                if(cmd!=null)
                {
                    cmd.Dispose();
                }
            }
        
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            drpCoursename.SelectedIndex = -1;
            txtAcademicyear.Text = "";
            drpAcademicsemester.SelectedIndex = -1;

        }
        

        
       
    }
}