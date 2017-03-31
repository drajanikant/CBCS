<%@ Page Title="Faculty Home" Language="C#" MasterPageFile="~/faculty/faculty.Master" AutoEventWireup="true" CodeBehind="faculty-home.aspx.cs" Inherits="winCBCS.faculty.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
    <li class="active"><a href="faculty-home.aspx">Home</a></li>
    <li class=""><a href="subject-choice.aspx">Course Choice</a></li>
    <li class=""><a href="faculty_profile.aspx">Profile</a></li>
   
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="faculty_name" runat="server"> Faculty Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="change-pass.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Logout</a></li>
        </ul>
    </li>
    
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
