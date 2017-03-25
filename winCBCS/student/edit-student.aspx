<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="edit-student.aspx.cs" Inherits="winCBCS.student.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
        <li class=""><a href="student-home.aspx">Home</a></li>
    <!--<li class="active"><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class=""><a href="choose-subject.aspx" >Choose Subject</a></li>
     <li class=""><a href="subject-choices.aspx" >Subject Choices</a></li>
  
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
    <div class="col-md-6"></div>
  <div class="col-md-6">
         <div class="panel panel-default " >
  <div class="panel-heading ">Edit Profile</div>
  <div class="panel-body ">
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Roll No"></asp:Label>
        <asp:TextBox ID="txtRoll" runat="server" class="form-control" placeholder="Enter Your Roll No"></asp:TextBox>
    </div>
      <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter Your Name"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email" ></asp:TextBox>
    </div>
      <div>
      <asp:Button ID="btnSubmit" Text="Submit" runat="server" />
          </div>
   </div>
</div>
  </div>
    <div class="col-md-6">
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
