using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace winCBCS.incharge
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}