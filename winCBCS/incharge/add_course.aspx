
<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="add_course.aspx.cs" Inherits="winCBCS.incharge.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
    <li><a href="incharge-home.aspx" class="active">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Program <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx">Add Program</a></li>
            <li><a href="incharge_listcourse.aspx">List Program</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_subject.aspx">Add Course</a></li>
            <li><a href="incharge_listsubject.aspx">List Course</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Venue <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_venue.aspx">Add Venue</a></li>
            <li><a href="incharge_listvenue.aspx">List Venue</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="incharge_name" runat="server">Incharge Name</label><span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="incharge_profile.aspx">Profile</a></li>
            <li><a href="incharge_changepassword.aspx">Forgot Password</a></li>
            <li><a href="../logout.aspx">Logout</a></li>



        </ul>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    

    <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Fail!</strong>
        <label id="error_msg" runat="server">Program registration Failed.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Program registration successful.
    </div>



    <div class="col-md-offset-6 ">
        <div class="panel panel-default">
            <div class="panel-heading" style="font-size: 20px; text-align: center;">Add Program</div>
            <div class="panel-body">

                <div id="add_course" runat="server" class="form-horizontal ">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Course Name"></asp:Label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="drpCoursename" runat="server" CssClass="form-control" AutoPostBack="True">
                                <asp:ListItem Value="0">Select Program</asp:ListItem>
                                <asp:ListItem Value="1">Mechanical Engineering</asp:ListItem>
                                <asp:ListItem Value="2">Electrical Engineering</asp:ListItem>
                                <asp:ListItem Value="3">Electronics &amp; Telecommunication Engineering</asp:ListItem>
                                <asp:ListItem Value="4">Computer Science Engineering</asp:ListItem>
                                <asp:ListItem Value="5">Information Technology</asp:ListItem>
                                <asp:ListItem Value="6">Automobile Engineering</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="requirefieldcourse" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Enter Course Name !!!" ControlToValidate="drpCoursename" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Academic Year">

                        </asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtAcademicyear" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldyear" CssClass="text-danger" runat="server" ErrorMessage="Enter Academic Year !!!" ControlToValidate="txtAcademicyear" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" CssClass="col-md-4 control-label" Text="Acedemic Semester">
                        </asp:Label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="drpAcademicsemester" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">Select Semester</asp:ListItem>
                                <asp:ListItem Value="1">Sem - I</asp:ListItem>
                                <asp:ListItem Value="2">Sem - II</asp:ListItem>
                                <asp:ListItem Value="3">Sem - III</asp:ListItem>
                                <asp:ListItem Value="4">Sem - IV</asp:ListItem>
                                <asp:ListItem Value="5">Sem - V</asp:ListItem>
                                <asp:ListItem Value="6">Sem - VI</asp:ListItem>
                                <asp:ListItem Value="7">Sem - VII</asp:ListItem>
                                <asp:ListItem Value="8">Sem - VIII</asp:ListItem>
                                <asp:ListItem Value="9">Sem - IX</asp:ListItem>
                                <asp:ListItem Value="10">Sem - X</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldsem" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Enter Academic Sem!!!" ControlToValidate="drpAcademicsemester" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-md-2"></div>

                    <div class="col-md-6">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                    </div>

                    <div class="form-group">
                        <div class="col-md-2"></div>


                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClear_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
