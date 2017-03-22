using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace winCBCS.incharge
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                txtEmailincharge.Text = ck["inchargeEmail"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
             MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("update timetable_incharge set incharge_password='" + txtPassword.Text + "' where incharge_email='"+txtEmailincharge.Text+"'",con);
            
            try{
                con.Open();
                int res=cmd.ExecuteNonQuery();
                con.Close();
                if(res>0)
                {
                    alert_success.Visible=true;

                }
                else{
                    alert_error.Visible=true;

                }
            }
            catch(Exception ee)
            {
                alert_error.Visible=true;
                error_msg.InnerHtml=ee.Message;
            }
            finally{
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
            txtPassword.Text = "";
            txtConfirmpassword.Text = "";
        }
    }
}