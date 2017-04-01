<%@ Page Title="Register Faculty" Language="C#" MasterPageFile="~/cbcs.Master" AutoEventWireup="true" CodeBehind="register-faculty.aspx.cs" Inherits="winCBCS.WebForm3" %>

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
            Register Faculty
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtEmpId">Employee Id :</label>
                <asp:TextBox ID="txtEmpId" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldEmpId" CssClass="text-danger"  runat="server" ErrorMessage="Enter Employee id !!!" ControlToValidate="txtEmpId" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <label for="txtName">Name :</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldName" CssClass="text-danger"  runat="server" ErrorMessage="Enter Name !!!" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>

            
            
            </div>
                        <div class="form-group">
                <label for="lblLabel">Label :</label>
                <asp:TextBox ID="txtLabel" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"  runat="server" ErrorMessage="Enter Label !!!" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>

            
            
            </div>
                        <div class="form-group">
                <label for="lblName">Programme :</label>
                <asp:DropDownList ID="drdProgramme" runat="server" CssClass="form-control" AutoPostBack="True">
                   
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger"  runat="server" ErrorMessage="select Programme !!!" ControlToValidate="drdDesignation" Display="Dynamic"></asp:RequiredFieldValidator>
            
            
            
            </div>
            <div class="form-group">
                <label for="txtEmail">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldemail" CssClass="text-danger"  runat="server" ErrorMessage="Enter Email !!!" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txtEmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="email">Designation :</label>
                <asp:DropDownList ID="drdDesignation" runat="server" CssClass="form-control">
                    <asp:ListItem Value=""></asp:ListItem> 
                    <asp:ListItem>H.O.D.</asp:ListItem>
                    <asp:ListItem>Professor</asp:ListItem>
                    <asp:ListItem>Associate Professor </asp:ListItem>
                    <asp:ListItem>Senior Assistant Professor</asp:ListItem>
                    <asp:ListItem>Assistant Professor</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldDesignation" CssClass="text-danger"  runat="server" ErrorMessage="Enter Designation !!!" ControlToValidate="drdDesignation" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="email">Experiance :</label>
                <asp:TextBox ID="txtExperiance" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldexp" CssClass="text-danger"  runat="server" ErrorMessage="Enter Experiance !!!" ControlToValidate="txtExperiance" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidatorExp" runat="server" ErrorMessage="Enter Valid Experiance" ControlToValidate="txtExperiance" CssClass="text-danger" MaximumValue="35" MinimumValue="0" Type="Integer" ></asp:RangeValidator>
            
            </div>
            <div class="form-group">
                <label for="email">Qualification :</label>
                <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldQualification" CssClass="text-danger"  runat="server" ErrorMessage="Enter Qualification !!!" ControlToValidate="txtQualification" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtNewPass">Password :</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldNewPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Password !!!" ControlToValidate="txtNewPass" Display="Dynamic"></asp:RequiredFieldValidator>
                
                 </div>
            <div class="form-group">
                <label for="txtNewPass">Confirm Password :</label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldCPass" CssClass="text-danger"  runat="server" ErrorMessage="Enter Confirm Password !!!" ControlToValidate="txtConfirm" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirm" CssClass="text-danger" ErrorMessage="Password Must Be Same!!!"></asp:CompareValidator>
            
            
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-info" OnClick="btnRegister_Click" />
        </div>



    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
