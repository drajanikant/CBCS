using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
namespace winCBCS.student
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string student_id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData() {
            try
            {
                dataChoiceStudent.DataSource = DBConnection.GetDataTable("SELECT * FROM timetable_choice natural join timetable_subject where timetable_choice.choice_subjectid= timetable_subject.subject_id and (timetable_choice.choice_studid='" + student_id + "')");
                dataChoiceStudent.DataBind();
            }
            catch (Exception)
            {
            }
        
        }
        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["StudentCookie"];
            if (ck != null)
            {
                student_name.InnerHtml = ck["studentName"].ToString();
                student_id = ck["studentId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }

        }
    }
}