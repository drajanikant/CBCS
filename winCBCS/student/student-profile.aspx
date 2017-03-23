<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="student-profile.aspx.cs" Inherits="winCBCS.student.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
     <li class=""><a href="faculty-home.aspx">Home</a></li>
    <li class=""><a href="subject-choice.aspx">Subject Choice</a></li>
    <li class="active"><a href="faculty_profile.aspx">Profile</a></li>
   
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="student_name" runat="server"> Student Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Change Password</a></li>
            <li><a href="../logout.aspx">Logout</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
        <div class="col-md-offset-6">
        <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Fail!</strong>
            <label id="error_msg" runat="server">Registration Failed.</label>.
        </div>
        <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success! </strong>Student registration successful.
        </div>
    </div>
    <div class="col-md-offset-6">
    <div class=" panel panel-success ">
        <div class="panel-body">
               <div class="form-group">
                <label for="email">Name:</label>
                <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>
            <div class="form-group">
                <label for="email">Roll number:</label>
                <asp:TextBox ID="txtStudentRollno" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" ></asp:TextBox>
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info" OnClick="btnEdit_Click1" />
               </div>
    </div>
        </div>
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
