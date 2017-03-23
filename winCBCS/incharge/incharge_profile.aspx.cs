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

namespace winCBCS.incharge
{
    public partial class WebForm6 : System.Web.UI.Page
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
        String inchargeId;
        private void CheckCookies()
        {

            HttpCookie ck = Request.Cookies["InchargeCookie"];
            if (ck != null)
            {
                incharge_name.InnerHtml = ck["inchargeName"].ToString();
                inchargeId = ck["inchargeId"].ToString();
            }
            else
            {
                Response.Redirect("../logout.aspx");
            }
        }

        private void LoadData()
        {
            try
            {
                DataRow dr = DBConnection.GetDataRow("select * from timetable_incharge where (incharge_id='" + inchargeId + "')");
                txtName.Text = dr["incharge_name"].ToString();
                txtEmailincharge.Text = dr["incharge_email"].ToString();
                drdDesignation.Text = dr["incharge_designation"].ToString();
            }
            catch (Exception e)
            {

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text.Equals("Edit"))
            {
                txtName.ReadOnly = false;
                txtEmailincharge.ReadOnly = false;
                drdDesignation.Enabled = true;
                btnEdit.Text = "Update";
            }
            else if (btnEdit.Text.Equals("Update"))
            {

                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["cbcs_connection"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand("update timetable_incharge set incharge_name=?incharge_name,incharge_email=?incharge_email,incharge_designation=?incharge_designation where (incharge_id=?incharge_id)", con);

                cmd.Parameters.AddWithValue("?incharge_name", txtName.Text);
                cmd.Parameters.AddWithValue("?incharge_email", txtEmailincharge.Text);
                cmd.Parameters.AddWithValue("?incharge_designation", drdDesignation.Text);
                int id = Int32.Parse(inchargeId);
                cmd.Parameters.AddWithValue("?incharge_id", id);
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
                txtName.ReadOnly = true;
                txtEmailincharge.ReadOnly = true;
                drdDesignation.Enabled = false;
            }
        }
    }
}