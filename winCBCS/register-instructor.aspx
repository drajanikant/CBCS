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
    <div class="col-md-offset-6 panel panel-primary ">
        <div class="panel-heading" style="font-size: 20px; text-align: center;">
            Register Instructor
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtEmpId">Employee Id :</label>
                <asp:TextBox ID="txtEmpId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtName">Name :</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="email">Designation :</label>
                <asp:DropDownList ID="drdDesignation" runat="server" CssClass="form-control">
                     <asp:ListItem></asp:ListItem> 
                    <asp:ListItem>H.O.D.</asp:ListItem>
                    <asp:ListItem>Professor</asp:ListItem>
                    <asp:ListItem>Associate Professor </asp:ListItem>
                    <asp:ListItem>Senior Assistant Professor</asp:ListItem>
                    <asp:ListItem>Assistant Professor</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label for="txtNewPass">Password :</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNewPass">Confirm Password :</label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-info" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
