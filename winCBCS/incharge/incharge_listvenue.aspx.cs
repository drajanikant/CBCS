using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace winCBCS.incharge
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                display();
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


        public void display()
        {


            try
            {
                data_cources.DataSource = DBConnection.GetDataTable("select * from timetable_venue");
                data_cources.DataBind();
            }
            catch (Exception)
            {

            }

        }


        protected void data_cources_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "data_delete")
            {
                DeleteCourse(e.CommandArgument.ToString());
            }
        }

        private void DeleteCourse(string venue_id)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("delete from timetable_venue where venue_id='" + venue_id + "'", con);

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();
                if (res > 0)
                {
                    alert_success.Visible = true;
                }
                else
                {
                    alert_error.Visible = true;
                }
            }
            catch (Exception ee)
            {
                alert_error.Visible = true;
                error_msg.InnerHtml = ee.Message;
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }
            display();
        }

        protected void data_cources_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
    }
}