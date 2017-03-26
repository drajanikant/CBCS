<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="change-pass-student.aspx.cs" Inherits="winCBCS.student.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
        <li class=""><a href="student-home.aspx">Home</a></li>
    <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class=""><a href="choose-subject.aspx" >Choose Subject</a></li>
     <li class=""><a href="subject-choices.aspx" >Subject Choices</a></li>
  
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="student_name" runat="server"> Student Name </span><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="student-profile.aspx">Profile</a></li>
            <li><a href="change-pass-student.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Log Out</a></li>
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
            <strong>Success!</strong> Faculty registration successful.
        </div>
    </div>
     <div class="col-md-offset-6 col-md-6">
         <div class="panel panel-default " >
  <div class="panel-heading ">Change Password</div>
  <div class="panel-body ">
    <div class="form-group">
        <asp:Label ID="currentPassword" runat="server" Text="Current Password"></asp:Label>
        <asp:TextBox ID="txtCurrentPass" runat="server" class="form-control" placeholder="Enter Your Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldCurrentPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Current Password !!!" ControlToValidate="txtCurrentPass" Display="Dynamic"></asp:RequiredFieldValidator>

    
    </div>
      <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
        <asp:TextBox ID="txtNewPass" runat="server" class="form-control" placeholder="Enter Your Password"></asp:TextBox>
    
       <asp:RequiredFieldValidator ID="RequiredFieldNewPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter New Password !!!" ControlToValidate="txtNewPass" Display="Dynamic"></asp:RequiredFieldValidator>

      
      </div>
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
        <asp:TextBox ID="txtCnfPass" runat="server" class="form-control" placeholder="Enter Your Password" ></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both passwords not match" ControlToCompare="txtNewPass" ControlToValidate="txtCnfPass" CssClass="text-danger"></asp:CompareValidator>
     <asp:RequiredFieldValidator ID="RequiredFieldCPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Confirm Password !!!" ControlToValidate="txtCnfPass" Display="Dynamic"></asp:RequiredFieldValidator>

    
    </div>
      <div>
      <asp:Button ID="btnUpdate" Text="Update" runat="server" OnClick="btnUpdate_Click" />
          </div>
      

   </div>
</div>
  </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
