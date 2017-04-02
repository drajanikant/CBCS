using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using winCBCS.utility;

namespace winCBCS.student
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string faculty_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadList();
        }

        private void LoadList()
        {
            try
            {
                timetable.DataSource = DBConnection.GetDataTable("SELECT * FROM faculty_choice natural join timetable_subject where (faculty_id='" + faculty_id + "')");
                timetable.DataBind();
            }
            catch (Exception)
            {
            }
        }
    }
}