<%@ Page Title="" Language="C#" MasterPageFile="~/faculty/faculty.Master" AutoEventWireup="true" CodeBehind="faculty_timetable.aspx.cs" Inherits="winCBCS.faculty.WebForm5" %>
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

    
        <asp:Panel ID="panel_list" runat="server" class="col-md-12">
           
            <asp:DataList ID="timetable" runat="server" CssClass="table table-striped"  >
                <HeaderTemplate>
                     
                    <th>Time Slot</th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                  <th>Sunday</th>
                    
                        
                </HeaderTemplate>

                <ItemTemplate>
                    <td></td>
                    <td></td>
                </ItemTemplate>

            </asp:DataList>
        </asp:Panel>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
