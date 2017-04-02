<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="incharge_listsubject.aspx.cs" Inherits="winCBCS.incharge.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">


    
    <li><a href="incharge-home.aspx" class="active">Home</a></li>
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
            <li><a href="facultytimetable.aspx">For Faculty</a></li>
            <li><a href="studenttimetable.aspx">For Student</a></li>
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


    
     <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Fail!</strong>
        <label id="error_msg" runat="server">Course Not Deleted .</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Course Deleted.
    </div>

       
    <div class="col-md-12">
        <asp:DataList ID="data_cources" runat="server" CssClass="table table-striped" OnItemCommand="data_cources_ItemCommand" >
            <HeaderTemplate>

               
                <th>Academic Year</th>
                <th>Program Name</th>
                <th>Semester</th>
                <th>Course Name</th>
                <th>Course Type</th>
                <th>Course Code</th>
                <th>Maximum Student</th>
                <th>Minimum Student</th>
                <th>Course Credit</th>
                <th>Operations</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td><%# Eval("academic_year") %></td>
                <td><%# Eval("course_name") %></td>
                <td><%# Eval("subject_semester") %></td>
                <td><%# Eval("subject_name") %></td>
                <td><%# Eval("subject_type") %></td>
                <td><%# Eval("subject_code") %></td>
                <td><%# Eval("subject_maxstudent") %></td>
                <td><%# Eval("subject_minstudent") %></td>
                <td><%# Eval("subject_credit") %></td>
               
                <td>
                    <asp:Button ID="btnDelete" runat="server" CommandName="data_delete" CommandArgument='<%# Eval("subject_id") %>' Text="Delete" CssClass="btn btn-danger" />
                </td>
            </ItemTemplate>
        </asp:DataList>


    </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
