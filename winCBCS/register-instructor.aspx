<%@ Page Title="Register Incharge" Language="C#" MasterPageFile="~/cbcs.Master" AutoEventWireup="true" CodeBehind="register-instructor.aspx.cs" Inherits="winCBCS.WebForm2" %>
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
            <strong>Fail!</strong>
            <label id="error_msg" runat="server">Registration Failed.</label>.
        </div>
        <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> Student registration successful.
        </div>
    </div>
    <div class="col-md-offset-6 panel panel-primary ">
        <div class="panel-heading" style="font-size: 20px; text-align: center;">
            Register Instructor
        </div>
        <div class="panel-body">
            
            <div class="form-group">
                <label for="txtName">Name :</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldName" CssClass="text-danger"  runat="server" ErrorMessage="Enter Name !!!" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
            
            
            </div>
            <div class="form-group">
                <label for="txtEmail">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="required"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldEmail" CssClass="text-danger"  runat="server" ErrorMessage="Enter Email !!!" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email!!!" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                
                
                 </div>

            <div class="form-group">
                <label for="email">Designation :</label>
                <asp:DropDownList ID="drdDesignation" runat="server" CssClass="form-control" required="required">
                     <asp:ListItem Value=""></asp:ListItem> 
                    <asp:ListItem>H.O.D.</asp:ListItem>
                    <asp:ListItem>Professor</asp:ListItem>
                    <asp:ListItem>Associate Professor </asp:ListItem>
                    <asp:ListItem>Senior Assistant Professor</asp:ListItem>
                    <asp:ListItem>Assistant Professor</asp:ListItem>
                </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" InitialValue="" runat="server" ErrorMessage="Enter Designation !!!" ControlToValidate="drdDesignation" Display="Dynamic"></asp:RequiredFieldValidator>
                
                
                
                 </div>
            
            <div class="form-group">
                <label for="txtNewPass">Password :</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldNewPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter New Password !!!" ControlToValidate="txtNewPass" Display="Dynamic"></asp:RequiredFieldValidator>
                
              
            
            </div>
            <div class="form-group">
                <label for="txtNewPass">Confirm Password :</label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtNewPass" ControlToValidate="txtConfirm" CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldCPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Confirm Password !!!" ControlToValidate="txtConfirm" Display="Dynamic"></asp:RequiredFieldValidator>
            
            
            
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-info" OnClick="btnRegister_Click" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
