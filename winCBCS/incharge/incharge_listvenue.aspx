<%@ Page Title="Venue List" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="incharge_listvenue.aspx.cs" Inherits="winCBCS.incharge.WebForm8" %>
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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="incharge_name" runat="server">Incharge Name</label>  <span class="caret"></span></a>
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
        <label id="error_msg" runat="server">Venue Not Deleted.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Venue Deleted.
    </div>

       
    <div class="col-md-12">
        <asp:DataList ID="data_cources" runat="server" CssClass="table table-striped" OnItemCommand="data_cources_ItemCommand" OnSelectedIndexChanged="data_cources_SelectedIndexChanged">
            <HeaderTemplate>

                <th>Venue Name</th>
                <th>Venue Type</th>
                
                <th>Operations</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td><%# Eval("venue_name") %></td>
                <td><%# Eval("venue_type") %></td>
                
                <td>
                    <asp:Button ID="btnDelete" runat="server" CommandName="data_delete" CommandArgument='<%# Eval("vanue_id") %>' Text="Delete" CssClass="btn btn-danger" />
                </td>
            </ItemTemplate>
        </asp:DataList>


    </div>







</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
