using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using winCBCS.utility;

namespace winCBCS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert_error.Visible = false;
              
                CheckCookies();
            }
        }

        private void CheckCookies()
        {
            HttpCookie myCookie = Request.Cookies["StudentCookie"];
            if (myCookie != null)
            {
                Response.Redirect("student/student-home.aspx");
            }
            myCookie = Request.Cookies["FacultyCookie"];
            if (myCookie != null)
            {
                Response.Redirect("faculty/faculty-home.aspx");
            }
            myCookie = Request.Cookies["InchargeCookie"];
            if (myCookie != null)
            {
                Response.Redirect("incharge/incharge-home.aspx");
            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (drdRole.Text.Equals("Student"))
            {
                try
                {
                    DataRow dr = DBConnection.GetDataRow("select * from timetable_student where (student_email='" + txtEmail.Text + "' and student_password='"+txtNewPass.Text+"') ");
                    if (dr != null)
                    {
                        String studentId = dr["student_id"].ToString();
                        String studentRoll = dr["student_rollno"].ToString();
                        String studentName = dr["student_name"].ToString();
                        String studentEmail = dr["student_email"].ToString();
                        HttpCookie myCookie = new HttpCookie("StudentCookie");

                        myCookie.Values.Add("studentId", studentId);
                        myCookie.Values.Add("studentRoll", studentRoll);
                        myCookie.Values.Add("studentName", studentName);
                        myCookie.Values.Add("studentEmail", studentEmail);

                        if (chbRemember.Checked)
                        {
                            myCookie.Expires = DateTime.Now.AddHours(3);
                        }
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("student/student-home.aspx");
                    }
                    else 
                    {
                        alert_error.Visible = true;    
                        error_msg.InnerHtml="Email or password is invalid";
                    }
                }
                catch (Exception ee)
                {
                    alert_error.Visible = true;
                    error_msg.InnerHtml = "" + ee.Message;
                }
            }
            else if(drdRole.Text.Equals("Faculty"))
            {
                try
                { 
                    DataRow dr = DBConnection.GetDataRow("select * from timetable_faculty where (faculty_email='" + txtEmail.Text + "' and faculty_password='"+txtNewPass.Text+"')");
                    if (dr != null)
                    {
                        String facultyId = dr["faculty_id"].ToString();
                        String facultyEmpid = dr["faculty_empid"].ToString();
                        String facultyName = dr["faculty_name"].ToString();
                        String facultyEmail = dr["faculty_email"].ToString();
                        HttpCookie myCookie = new HttpCookie("FacultyCookie");

                        myCookie.Values.Add("facultyId", facultyId);
                        myCookie.Values.Add("facultyEmpid", facultyEmpid);
                        myCookie.Values.Add("facultyName", facultyName);
                        myCookie.Values.Add("facultyEmail", facultyEmail);

                        if (chbRemember.Checked)
                        {
                            myCookie.Expires = DateTime.Now.AddHours(3);
                        }
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("faculty/faculty-home.aspx");
                    }
                    else
                    {
                        alert_error.Visible = true;
                        error_msg.InnerHtml = "Email or password is invalid";
                    }
                }
                catch (Exception ee)
                {
                    alert_error.Visible = true;
                    error_msg.InnerHtml = "" + ee.Message;
                }
            }
            else if (drdRole.Text.Equals("Incharge"))
            {
                try
                {
                    DataRow dr = DBConnection.GetDataRow("select * from timetable_incharge where (incharge_email='" + txtEmail.Text + "' and incharge_password='" + txtNewPass.Text + "')");
                    if (dr != null)
                    {
                        String inchargeId = dr["incharge_id"].ToString();
                        String inchargeName = dr["incharge_name"].ToString();
                        String inchargeEmail = dr["incharge_email"].ToString();
                        HttpCookie myCookie = new HttpCookie("InchargeCookie");

                        myCookie.Values.Add("inchargeId", inchargeId);
                        myCookie.Values.Add("inchargeName", inchargeName);
                        myCookie.Values.Add("inchargeEmail", inchargeEmail);


                        if (chbRemember.Checked)
                        {
                            myCookie.Expires = DateTime.Now.AddHours(3);
                        }
                        Response.Cookies.Add(myCookie);
                        Response.Redirect("incharge/incharge-home.aspx");
                    }
                    else
                    {
                        alert_error.Visible = true;
                        error_msg.InnerHtml = "Email or password is invalid";
                    }
                }
                catch (Exception ee)
                {
                        alert_error.Visible = true;
                    error_msg.InnerHtml = ""+ee.Message;
                }
            }
           
        }
    }
}