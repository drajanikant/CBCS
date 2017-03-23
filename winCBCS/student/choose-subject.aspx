﻿<%@ Page Title="" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="choose-subject.aspx.cs" Inherits="winCBCS.student.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    <li class=""><a href="student-home.aspx">Home</a></li>
    <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class="active"><a href="choose-subject.aspx" >Choose Subject</a></li>
     <li class=""><a href="show-time-table.aspx" >Show Time Table</a></li>
  
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="student_name" runat="server">Student Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="edit-student.aspx">Profile</a></li>
            <li><a href="change-pass-student.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Log Out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
   <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Fail!</strong>
        <label id="error_msg" runat="server">Subject registration Failed.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Subject registration successful.
    </div>
    <div class="col-md-6">
        <div class="panel panel-default " >
  <div class="panel-heading ">Choose Subject</div>
  <div class="panel-body ">
    <div class="form-group">
        <div>
         <asp:Label ID="lblCredits" runat="server" Text="Credits Earned :" align="left"></asp:Label>
            </div>
        <asp:Label ID="Email" runat="server" Text="Acadamic Year"></asp:Label>
        <asp:DropDownList ID="drdYear" class="form-control" runat="server" placeholder="select any one" required="required" OnSelectedIndexChanged="drdYear_SelectedIndexChanged" AutoPostBack="True">                      
                     </asp:DropDownList>
    </div>

      <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Semester"></asp:Label>
        <asp:DropDownList ID="drdSem" class="form-control" runat="server" placeholder="select any one" required="required" AutoPostBack="True" OnSelectedIndexChanged="drdSem_SelectedIndexChanged">               
        </asp:DropDownList>
          </div>
      <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label>
        <asp:DropDownList ID="drdCourse" class="form-control" runat="server" placeholder="select any one" required="required" AutoPostBack="True" OnSelectedIndexChanged="drdCourse_SelectedIndexChanged" >               
        </asp:DropDownList>
          </div>

    <div class="form-group">
        <asp:Label runat="server" Text="Core"></asp:Label>
        <div class="form-group">
        <asp:ListBox ID="lbCore" runat="server" CssClass="form-control" SelectionMode="Multiple" >
            
            
        </asp:ListBox>
        </div>
    </div>

          
    </div>
    </div>
  </div>
     <div class="col-md-6">
         
        <div class="panel panel-default " >
  <div class="panel-heading ">Choose Subject</div>
  <div class="panel-body ">
      
      <div class="form-group">
        <asp:Label runat="server" Text="Elective"></asp:Label>
          
           <asp:CheckBoxList ID="cbElective" runat="server" >
              
           </asp:CheckBoxList>
        </div>
      </div></div>
    </div>
    
           <center> <asp:Button ID="btnSubmit" Text="Submit" runat="server" align="center" OnClick="btnSubmit_Click"/></center>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
