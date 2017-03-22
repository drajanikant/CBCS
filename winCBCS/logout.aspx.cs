using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace winCBCS
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentCookie"] != null)
            {
                Response.Cookies["StudentCookie"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["FacultyCookie"] != null)
            {
                Response.Cookies["FacultyCookie"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["InchargeCookie"] != null)
            {
                Response.Cookies["InchargeCookie"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("login.aspx");
        }
    }
}