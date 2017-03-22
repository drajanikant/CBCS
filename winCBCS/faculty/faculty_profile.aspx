<%@ Page Title="Faculty Profile" Language="C#" MasterPageFile="~/faculty/faculty.Master" AutoEventWireup="true" CodeBehind="faculty_profile.aspx.cs" Inherits="winCBCS.faculty.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
     <li class=""><a href="faculty-home.aspx">Home</a></li>
    <li class=""><a href="subject-choice.aspx">Subject Choice</a></li>
    <li class="active"><a href="faculty_profile.aspx">Profile</a></li>
   
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="faculty_name" runat="server"> Faculty Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Change Password</a></li>
            <li><a href="../logout.aspx">Logout</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="panel panel-success col-md-6">
        <div class="panel-body">
             <div class="form-group">
                <label for="email">Employee Id:</label>
                <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>
            <div class="form-group">
                <label for="email">Employee Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>
            <div class="form-group">
                <label for="email">Designation :</label>
                <asp:DropDownList ID="drdDesignation" runat="server" CssClass="form-control" >
                      <asp:ListItem></asp:ListItem> 
                    <asp:ListItem>H.O.D.</asp:ListItem>
                    <asp:ListItem>Professor</asp:ListItem>
                    <asp:ListItem>Associate Professor </asp:ListItem>
                    <asp:ListItem>Senior Assistant Professor</asp:ListItem>
                    <asp:ListItem>Assistant Professor</asp:ListItem>
                </asp:DropDownList>
                 </div>
            <div class="form-group">
                <label for="email">Experiance :</label>
                <asp:TextBox ID="txtExperiance" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>
             <div class="form-group">
                <label for="email">Qualification :</label>
                 <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-info" />
        </div>

    </div>

   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
