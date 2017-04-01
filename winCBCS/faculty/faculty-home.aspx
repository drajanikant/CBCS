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

    <form id="form1" runat="server">
        <div class="col-md-6 ">
     <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Fail!</strong>
        <label id="error_msg" runat="server">Program Not Added.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Program Added successful.
    </div>

    
        <div>
            <div class="form-group">
                <label for="email">Programe :</label>
                <asp:DropDownList ID="drpprogram" runat="server" CssClass="form-control" Enabled="true" >
                      <asp:ListItem Value="0"></asp:ListItem> 
                   
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldprgm" CssClass="text-danger"  runat="server" InitialValue="0" ErrorMessage="Enter Program !!!" ControlToValidate="drpprogram" Display="Dynamic"></asp:RequiredFieldValidator>

                 </div>
        </div>
        <div class="form-group">
                <label for="email">Semester :</label>
                <asp:DropDownList ID="drpsem" runat="server" CssClass="form-control" Enabled="true" >
                      <asp:ListItem Value="0"></asp:ListItem> 
                   
                </asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" InitialValue="0" ErrorMessage="Enter Semester !!!" ControlToValidate="drpsem" Display="Dynamic"></asp:RequiredFieldValidator>

                 </div>


         <div class="form-group">
            <div class="col-md-2"></div>
               
            <div class="col-md-6">
             <asp:Button ID="btnAdd" runat="server" Text="Show Time Table" CssClass="btn btn-default" OnClick="btnAdd_Click"  />
            </div>
             <div></div>
               <div class="form-group">
            <div class="col-md-2"></div>
               
           
             
            </div>
             </div>   
</div>

    </form>
</asp:Content>
   
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
