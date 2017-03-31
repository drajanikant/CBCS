<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="subject-choices.aspx.cs" Inherits="winCBCS.student.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
        <li class=""><a href="student-home.aspx">Home</a></li>
    <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class=""><a href="choose-subject.aspx" >Choose Course</a></li>
     <li class="active"><a href="subject-choices.aspx" >Course Choices</a></li>
  
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="student_name" runat="server">Student Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="edit-student.aspx">Profile</a></li>
            <li><a href="change-pass-student.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Log Out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:DataList ID="dataChoiceStudent" runat="server" CssClass="table table-striped">

         <HeaderTemplate>

                <th>Course Name</th>
                <th>Course Credits</th>
                <th>Theory Credits</th>
                <th>Practical Credits</th>
                <th>Tutorial Credits</th>


                <th>Semester</th>
                
            </HeaderTemplate>
            <ItemTemplate>
                <td><%# Eval("subject_name") %></td>
                <td><%# Eval("subject_credit") %></td>
                 <td><%# Eval("lacture_credit") %></td>
                 <td><%# Eval("practical_credit") %></td>
                 <td><%# Eval("tutorial_credit") %></td>
                <td><%# Eval("choice_sem") %></td>
                
            </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
