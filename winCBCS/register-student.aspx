<%@ Page Title="Register Student" Language="C#" MasterPageFile="~/cbcs.Master" AutoEventWireup="true" CodeBehind="register-student.aspx.cs" Inherits="winCBCS.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
     <li class=""><a href="login.aspx">Login</a></li>
 
   
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Registration <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="register-student.aspx">Student</a></li>
             <li><a href="register-faculty.aspx">Faculty</a></li>
            <li><a href="register-instructor.aspx">Incharge</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="col-md-offset-6">
        <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
             <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             <strong>Fail!</strong> <label id="error_msg" runat="server">Registration Failed.</label>.
         </div>
         <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
             <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             <strong>Success!</strong> Student registration successful.
         </div>
    </div> 
    <div class="col-md-offset-6 panel panel-primary ">

         
         <div class="panel-heading" style="font-size:20px;text-align:center;">
             Register Student
         </div>
        <div class="panel-body">
             <div class="form-group">
                <label for="txtRoll">Roll Number :</label>
                <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Roll number required" ControlToValidate="txtRoll" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRoll" CssClass="text-danger" Display="Dynamic" ErrorMessage="Student roll must be digits" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
               </div>
             <div class="form-group">
                <label for="txtName">Name :</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student name is required" ControlToValidate="txtName"  CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
               </div>
             <div class="form-group">
                <label for="txtEmail">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email address is required" ControlToValidate="txtEmail"  CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the valid email address"  CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>

             </div>
            <div class="form-group">
                <label for="txtNewPass">Password :</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control"  TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password field is required" ControlToValidate="txtNewPass" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
               </div>
               <div class="form-group">
                <label for="txtNewPass">Confirm Password :</label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control"  TextMode="Password" ></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm password field is required." ControlToValidate="txtConfirm" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password must be same." ControlToCompare="txtNewPass" ControlToValidate="txtConfirm" CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
               </div>
           
           
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-info" OnClick="btnRegister_Click" />
        </div>
         </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
