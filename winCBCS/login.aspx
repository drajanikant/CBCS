<%@ Page Title="Login" Language="C#" MasterPageFile="~/cbcs.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="winCBCS.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
    <li class="active"><a href="login.aspx">Login</a></li>


    <li class="dropdown">
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
            <label id="error_msg" runat="server">Login Failed.</label>.
        </div>
        
    </div>
    <div class="col-md-offset-8 panel panel-primary ">
        <div class="panel-heading" style="font-size: 20px; text-align: center;">
            Login
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtEmail">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNewPass">Password:</label>
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="drdRole">Role :</label>
                <asp:DropDownList ID="drdRole" runat="server" CssClass="form-control" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Faculty</asp:ListItem>
                    <asp:ListItem>Incharge</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-check">

                <label class="form-check-label">

                    <asp:CheckBox ID="chbRemember" class="form-check-input" runat="server" Text=" Remember Me" />
                </label>
            </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Login" CssClass="btn btn-info" OnClick="btnUpdate_Click" />
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
