using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace winCBCS.student
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckCookies();
        }

        private void CheckCookies()
        {
            HttpCookie ck = Request.Cookies["StudentCookie"];
            if (ck != null)
            {
                student_name.InnerHtml = ck["studentName"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }
    }
}