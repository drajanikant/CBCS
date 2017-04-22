<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="student_timetable.aspx.cs" Inherits="winCBCS.student.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

     <li class="active"><a href="student-home.aspx">Home</a></li>
    <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class=""><a href="choose-subject.aspx" >Choose Course</a></li>
     <li class=""><a href="subject-choices.aspx" >Course choices</a></li>
  
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" >Hi...<label id="student_name" runat="server">Student Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="student-profile.aspx">Profile</a></li>
            <li><a href="change-pass-student.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Log Out</a></li>
        </ul>
    </li>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    
        <asp:Panel ID="panel_list" runat="server" class="col-md-12">
           
            <asp:DataList ID="timetable" runat="server" CssClass="table table-striped"  >
                <HeaderTemplate>
                     
                    <th>class_room</th>
                    <th>day</th>
                    <th>time_slot</th>
                    <th>course_name</th>
                    <th>faculty_name</th>
                    
                  <th>Sunday</th>
                    
                        
                </HeaderTemplate>

                <ItemTemplate>
                     <th><%# Eval("class_room") %></th>
                    <th><%# Eval("day") %></th>
                    <th><%# Eval("time_slot") %></th>
                    <th><%# Eval("course_name") %></th>
                    <th><%# Eval("faculty_name") %></th>
                </ItemTemplate>

            </asp:DataList>
        </asp:Panel>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
