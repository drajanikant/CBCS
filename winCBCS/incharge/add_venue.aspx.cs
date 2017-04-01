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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                alert_error.Visible = false;
                alert_success.Visible = false;
                Loaddata();
            }
            CheckCookies();
        }

        private void Loaddata()
        {

            drpDepartment.DataSource = DBConnection.GetDataTable("select distinct course_name from timetable_course");
            drpDepartment.DataTextField = "course_name";
            drpDepartment.DataValueField = "course_name";
            drpDepartment.DataBind();
            drpDepartment.Items.Insert(0, "");
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
            MySqlCommand cmd = new MySqlCommand("insert into timetable_venue (venue_name, venue_type,venue_location,venue_capacity) values (?venue_name, ?venue_type,?venue_location,?venue_capacity)", con);
            cmd.Parameters.AddWithValue("?venue_name",txtVenuename.Text);
            cmd.Parameters.AddWithValue("?venue_type",drpVenuetype.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?venue_location", drpDepartment.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("?venue_capacity",txtCapacity.Text);


            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();

                if(res>0)
                {
                    alert_success.Visible=true;
                }
                else
                {
                    alert_error.Visible = true;

                }

            }
            catch(Exception ee)
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
            txtVenuename.Text = "";
            drpVenuetype.SelectedIndex = -1;
        }
    }
}