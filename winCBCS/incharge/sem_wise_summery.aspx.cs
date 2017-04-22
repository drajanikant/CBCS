using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using winCBCS.utility;
using System.Data;

namespace winCBCS.incharge
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           /* string[] day={"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
            string[] slots = { "9:00 TO 10:00", "10:00 TO 11:00", "11:00 to 12:00", "12:00 to 13:00", "14:00 to 15:00", "15:00 to 16:00", "16:00 to 17:00" };

            string[,] values=new string[7,6];

            for (int i = 0; i < 7; i++)
			{
			     for (int j = 0; j < 6; j++)
			    {
			        DataRow dr=DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - I' and day='"+day[j]+"' and time_slot='"+slots[i]+"'");
                     if (dr!=null)
	{
		 values[i,j]=dr["course_name"].ToString()+" "+dr["class_room"].ToString();
	}
                     else{
                     values[i,j]="Free";
                     }
			    }
			}






            for (int i = 0; i < 7; i++)
            {
                for (int j = 0; j < 6; j++)
                {
                    
                      Label1.Text+= values[i, j]+"-------";
                   
                }
                Label1.Text += "<br>";
            }*/
        }
    }
}