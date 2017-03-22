using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}