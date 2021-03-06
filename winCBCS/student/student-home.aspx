﻿<%@ Page Title="Student Home" Language="C#" MasterPageFile="~/student/student-home.Master" AutoEventWireup="true" CodeBehind="student-home.aspx.cs" Inherits="winCBCS.student.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    <li class="active"><a href="student-home.aspx">Home</a></li>
    <!--<li class=""><a href="edit-student.aspx">Edit Profile</a></li>!-->
    <li class=""><a href="choose-subject.aspx">Choose Course</a></li>
    <li class=""><a href="subject-choices.aspx">Course choices</a></li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="student_name" runat="server">Student Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="student-profile.aspx">Profile</a></li>
            <li><a href="change-pass-student.aspx">Change Password</a></li>
            <li><a href="../logout.aspx">Log Out</a></li>
        </ul>
    </li>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">


    <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Fail!</strong>
        <label id="error_msg" runat="server">Program Not Added.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Program Added successful.
    </div>


    <div class="col-md-5 ">
        <div class="panel panel-default">
            <div class="panel-heading">Time Table</div>
            <div class="panel-body">
                <div class="form-horizontal ">
                    <div class="col-md-6">
                        <div>

                            <div class="form-group">
                                <label for="email">Curriculum :</label>

                                <asp:DropDownList ID="drpCurriculum" runat="server" CssClass="form-control" Enabled="true" OnSelectedIndexChanged="drpCurriculum_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" InitialValue="0" ErrorMessage="Select Curriculum !!!" ControlToValidate="drpCurriculum" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Programe :</label>
                            <asp:DropDownList ID="drpprogram" runat="server" CssClass="form-control" Enabled="true" OnSelectedIndexChanged="drpprogram_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>

                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldprgm" CssClass="text-danger" runat="server" InitialValue="0" ErrorMessage="Enter Program !!!" ControlToValidate="drpprogram" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>

                        <div class="form-group">
                            <label for="email">Academic Year :</label>
                            <asp:DropDownList ID="drpYear" runat="server" CssClass="form-control" Enabled="true" OnSelectedIndexChanged="drpYear_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>

                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" InitialValue="0" ErrorMessage="Select Year!!!" ControlToValidate="drpYear" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>



                        <div class="form-group">
                            <label for="email">Academic Semester :</label>
                            <asp:DropDownList ID="drpsem" runat="server" CssClass="form-control" Enabled="true" OnSelectedIndexChanged="drpsem_SelectedIndexChanged1">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>

                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" InitialValue="0" ErrorMessage="Enter Semester !!!" ControlToValidate="drpsem" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>


                        <div class="form-group">
                            <div class="col-md-2"></div>

                            <div class="col-md-6">
                                <asp:Button ID="btnAdd" runat="server" Text="Show Time Table" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                            </div>
                            <div></div>
                            <div class="form-group">
                                <div class="col-md-2"></div>



                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-7">

        <asp:DataList ID="timetable" runat="server" CssClass="table table-striped"  >
                <HeaderTemplate>
                     
                    <th>class_room</th>
                    <th>day</th>
                    <th>time_slot</th>
                    <th>course_name</th>
                    <th>faculty_name</th>
                    
                 
                    
                        
                </HeaderTemplate>

                <ItemTemplate>
                     <th><%# Eval("class_room") %></th>
                    <th><%# Eval("day") %></th>
                    <th><%# Eval("time_slot") %></th>
                    <th><%# Eval("course_name") %></th>
                    <th><%# Eval("faculty_name") %></th>
                </ItemTemplate>

            </asp:DataList>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
