<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="sem_wise_summery.aspx.cs" Inherits="winCBCS.incharge.WebForm13" %>
<%@ Import Namespace="winCBCS.utility" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    <li class="active"><a href="incharge-home.aspx">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Program <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx">Add Program</a></li>
            <li><a href="incharge_listcourse.aspx">List Program</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_subject.aspx">Add Course</a></li>
            <li><a href="incharge_listsubject.aspx">List Course</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Venue <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_venue.aspx">Add Venue</a></li>
            <li><a href="incharge_listvenue.aspx">List Venue</a></li>
        </ul>
    </li>
    
    
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View Time Table <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="incharge-home.aspx">For Semester</a></li>

            <li><a href="facultytimetable.aspx">For Class Room</a></li>
            <li><a href="studenttimetable.aspx">For Faculty</a></li>
            <li><a href="course_wise.aspx">For Course</a></li>
              <li><a href="sem_wise_summery.aspx">Sem Wise Summery</a></li>

        </ul>
    </li>

  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="incharge_name" runat="server">Incharge Name</label> <span class="caret"></span></a>
        <ul class="dropdown-menu">
             <li><a href="incharge_profile.aspx">Profile</a></li>
            <li><a href="incharge_changepassword.aspx">Forgot Password</a></li>
                         <li><a href="../logout.aspx">Logout</a></li>


           
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    Sem I
    
    <%
        string[] day = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
        string[] slots = { "9:00 TO 10:00", "10:00 TO 11:00", "11:00 to 12:00", "12:00 to 13:00", "14:00 to 15:00", "15:00 to 16:00", "16:00 to 17:00" };
        int l = 0;
        string[,] values = new string[7, 6];

        for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - I' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
       
        <tr>
            <th>Slots</th>
            <%for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
         <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
            <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />
    Sem II

     <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - II' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
             <th>Slots</th>
            <%
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
            <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />
    Sem III
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - III' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
            <th>Slots</th>
            <%
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
             <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />
    Sem IV
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - IV' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
             <th>Slots</th>
            <% l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
            <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />

    Sem V
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - V' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
            <th>Slots</th>
            <% 
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr><td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />
    Sem VI
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - VI' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
               <th>Slots</th>
            <%
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
            <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>

    <br />
    Sem VII
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - VII' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
            <th>Slots</th>
            <%
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr> <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>
    <br />
    Sem VIII
    <%
      
         for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 6; j++)
            {
                DataRow dr = DBConnection.GetDataRow("Select course_name,class_room from timetable_dept where semester='Sem - VIII' and day='" + day[j] + "' and time_slot='" + slots[i] + "'");
                if (dr != null)
                {
                    values[i, j] = dr["course_name"].ToString() + " " + dr["class_room"].ToString();
                }
                else
                {
                    values[i, j] = "Free";
                }
            }
        }
        
         %>
    <table class="table table-bordered">
        <tr>
           <th>Slots</th>
            <%
                l = 0;
                for (int k = 0; k < 6; k++)
              { %>
                <th><%= day[k] %></th>  
            <%  }
                 %>

        </tr>
        <% for (int i = 0; i < 7; i++)
           {%>
        <tr>
            <td><%= slots[l++] %></td>
        <% for (int j = 0; j < 6; j++)
           { %>
               <td><%= values[i, j] %></td>
          <% } %>

            </tr>   
        <%   } %>
        
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
