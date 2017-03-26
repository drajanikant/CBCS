<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="student-profile.aspx.cs" Inherits="winCBCS.student.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
            <li class=""><a href="student-home.aspx">Home</a></li>
        <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
        <li class=""><a href="choose-subject.aspx" >Choose Subject</a></li>
         <li class=""><a href="subject-choices.aspx" >Subject Choices</a></li>
  
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="student_name" runat="server">Student Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="edit-student.aspx">Profile</a></li>
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
        <label id="error_msg" runat="server">Subject Not Added.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Subject Added successful.
    </div>
        </div>
  <div class="col-md-offset-6">
         <div class="panel panel-default " >
  <div class="panel-heading ">Profile</div>
  <div class="panel-body ">
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Roll No"></asp:Label>
        <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" ReadOnly="True" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldRoll" CssClass="text-danger"  runat="server" ErrorMessage="Enter Roll Number !!!" ControlToValidate="txtRoll" Display="Dynamic"></asp:RequiredFieldValidator>

    </div>
      <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="True" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldName" CssClass="text-danger"  runat="server" ErrorMessage="Enter Name !!!" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>

    </div>
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldEmail" CssClass="text-danger"  runat="server" ErrorMessage="Enter Email !!!" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExp" CssClass="text-danger" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
      <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-info" />
   </div>
</div>
  </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
