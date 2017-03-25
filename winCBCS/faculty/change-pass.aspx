<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/faculty/faculty.Master" AutoEventWireup="true" CodeBehind="change-pass.aspx.cs" Inherits="winCBCS.faculty.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
    <li class=""><a href="faculty-home.aspx">Home</a></li>
    <li class=""><a href="subject-choice.aspx">Subject Choice</a></li>
    <li class=""><a href="faculty_profile.aspx">Profile</a></li>
   
    <li class="dropdown active">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="faculty_name" runat="server"> Faculty Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="change-pass.aspx">Change Password</a></li>
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
            <strong>Success!</strong> Faculty registration successful.
        </div>
    </div>
    <div class="col-md-6"></div>
     <form id="form_changePass" runat="server" class="panel panel-success col-md-6">
        <div class="panel-body">
             <div class="form-group">
                <label for="email">Current Password:</label>
                <asp:TextBox ID="txtCurrentPass" runat="server" CssClass="form-control" OnTextChanged="txtCurrentPass_TextChanged" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="requirefieldCurrentPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Current Password !!!" ControlToValidate="txtCurrentPass" Display="Dynamic"></asp:RequiredFieldValidator>  
             </div>
            <div class="form-group">
                <label for="email">New Password:</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control"  TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldNewPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter New Password !!!" ControlToValidate="txtNewPass" Display="Dynamic"></asp:RequiredFieldValidator>  
                
               </div>
            <div class="form-group">
                <label for="email">Confirm Password :</label>
                <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control"  TextMode="Password" ></asp:TextBox>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both passwords not match" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" CssClass="text-danger"></asp:CompareValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldCpass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Password !!!" ControlToValidate="txtConfirmPass" Display="Dynamic"></asp:RequiredFieldValidator>  
            </div>
           
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnUpdate_Click" />
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
