using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using winCBCS.utility;
using System.Configuration;

namespace winCBCS.faculty
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                LoadData();
            }
        }
        
        String facultyId;
        private void CheckCookies()
        {

            HttpCookie ck = Request.Cookies["FacultyCookie"];
            if (ck != null)
            {
                faculty_name.InnerHtml = ck["facultyName"].ToString();
                facultyId = ck["facultyId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int hour = 0;
            if (btnEdit.Text.Equals("Edit"))
            {
                txtEmployeeId.ReadOnly = false;
                txtEmail.ReadOnly = false;
                drdDesignation.Enabled = true;
                txtExperiance.ReadOnly = false;
                txtQualification.ReadOnly = false;
                //txtName.ReadOnly = false;
                btnEdit.Text = "Update";
            }
            else if (btnEdit.Text.Equals("Update"))
            {

                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_faculty set faculty_empid=?faculty_empid,faculty_email=?faculty_email, faculty_designation=?faculty_designation, faculty_experience=?faculty_experience, faculty_qualification=?faculty_qualification where (faculty_id=?faculty_id)", con);

                cmd.Parameters.AddWithValue("?faculty_empid", txtEmployeeId.Text);

                
                cmd.Parameters.AddWithValue("?faculty_email", txtEmail.Text);
                cmd.Parameters.AddWithValue("?faculty_designation", drdDesignation.Text);
                cmd.Parameters.AddWithValue("?faculty_experience", txtExperiance.Text);
                cmd.Parameters.AddWithValue("?faculty_qualification", txtQualification.Text);
                int id = Int32.Parse(facultyId);
                cmd.Parameters.AddWithValue("?faculty_id", id);
                if (drdDesignation.Text.Equals("H.O.D."))
                {
                    hour = 10;
                }
                else if (drdDesignation.Text.Equals("Professor"))
                {
                    hour = 12;
                }
                else if (drdDesignation.Text.Equals("Associate Professor"))
                {
                    hour = 14;
                }
                else if (drdDesignation.Text.Equals("Senior Assistant Professor"))
                {
                    hour = 16;
                }
                else if (drdDesignation.Text.Equals("Assistant Professor"))
                {
                    hour = 18;
                }
                cmd.Parameters.AddWithValue("?faculty_workinghour", hour);
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
                    error_msg.InnerHtml = "" + ee.Message;
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                        con.Dispose();
                    }
                    if (cmd != null)
                    {
                        cmd.Dispose();
                    }
                }
                btnEdit.Text = "Edit";
                txtEmployeeId.ReadOnly = true;
                txtEmail.ReadOnly = true;
                drdDesignation.Enabled = false;
                txtExperiance.ReadOnly = true;
                txtQualification.ReadOnly = true;
               
            }
        }
        private void LoadData()
        {
            try
            {
                DataRow dr = DBConnection.GetDataRow("select * from timetable_faculty where (faculty_id='" + facultyId + "')");
                txtEmployeeId.Text = dr["faculty_empid"].ToString();
                txtEmail.Text = dr["faculty_email"].ToString();
               
                drdDesignation.SelectedValue = dr["faculty_designation"].ToString();
                txtExperiance.Text = dr["faculty_experience"].ToString();
                txtQualification.Text = dr["faculty_qualification"].ToString();

            }
            catch (Exception e)
            {

            }
        }
    }
}