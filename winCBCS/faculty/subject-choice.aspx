<%@ Page Title="Subject Choice" Language="C#" MasterPageFile="~/faculty/faculty.Master" AutoEventWireup="true" CodeBehind="subject-choice.aspx.cs" Inherits="winCBCS.faculty.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
     <li class=""><a href="faculty-home.aspx">Home</a></li>
    <li class="active"><a href="subject-choice.aspx">Subject Choice</a></li>
    <li class=""><a href="faculty_profile.aspx">Profile</a></li>
   
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="faculty_name" runat="server"> Faculty Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Change Password</a></li>
            <li><a href="../logout.aspx">Logout</a></li>
        </ul>
    </li>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="col-md-6">
        <div class=" panel panel-primary">
            <div class="panel-body">
                <div class="panel-body">
                     <div class="form-group">
                        <label for="email">Academic Year:</label>
                        <asp:DropDownList ID="drdAcademicYear" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                     <div class="form-group">
                        <label for="email">Course Name:</label>
                        <asp:DropDownList ID="drdCourseName" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                     <div class="form-group">
                        <label for="email">Semester:</label>
                        <asp:DropDownList ID="drdSemester" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="email">Subject Name:</label>
                        <asp:DropDownList ID="drdSubjetName" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="email">Priority:</label>
                        <asp:DropDownList ID="drdProirity" runat="server" CssClass="form-control" required="required">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="email">Experiance :</label>
                        <asp:TextBox ID="txtSubExperiance" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" CssClass="btn btn-info" />
                </div>

            </div>
        </div>
       
    </div>
    <div class="col-md-6">

        <asp:DataList ID="dataSubjectChoice" runat="server"></asp:DataList>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
