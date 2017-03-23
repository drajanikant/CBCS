<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="incharge_profile.aspx.cs" Inherits="winCBCS.incharge.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    
     <li class="active"><a href="incharge-home.aspx">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx">Add Course</a></li>
            <li><a href="incharge_listcourse.aspx">List Course</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Subject <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_subject.aspx">Add Subject</a></li>
            <li><a href="incharge_listsubject.aspx">List Subject</a></li>
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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">hi... <span id="incharge_name" runat="server"> Incharge Name </span> <span class="caret"></span></a>
        <ul class="dropdown-menu">
             <li><a href="incharge_profile.aspx">Profile</a></li>
            <li><a href="incharge_changepassword.aspx">Forgot Password</a></li>
                         <li><a href="../logout.aspx">Logout</a></li>


           
        </ul>
    </li>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    <div class="col-md-offset-6">
        <div id="alert_error" runat="server" class="alert alert-danger alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Fail!</strong>
            <label id="error_msg" runat="server">Updation Failed.</label>.
        </div>
        <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success!</strong> Faculty profile updation successful.
        </div>
    </div>
     <div class="col-md-offset-6 col-md-6">
    <div class=" panel panel-default">
  <div class="panel-heading" >Profile</div>
  <div class="panel-body">
    
       <div class="form-horizontal ">
        
            


           <div class="form-group">
              <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Name">

              </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtName" CssClass="col-md-2 form-control" runat="server" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Enter Password !!!" ControlToValidate="txtName"></asp:RequiredFieldValidator>
             </div>
             </div>



         <div class="form-group">
              <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Email">

              </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtEmailincharge" CssClass="col-md-2 form-control" runat="server" ReadOnly="True"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldyear" CssClass="text-danger" runat="server" ErrorMessage="Enter Email !!!" ControlToValidate="txtEmailincharge"></asp:RequiredFieldValidator>
             </div>
             </div>
           <div class="form-group">
              <asp:Label ID="Label3" runat="server" CssClass="col-md-4 control-label" Text="Designation">

              </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drdDesignation" runat="server" CssClass="form-control" Enabled="False" >
                      <asp:ListItem></asp:ListItem> 
                    <asp:ListItem>H.O.D.</asp:ListItem>
                    <asp:ListItem>Professor</asp:ListItem>
                    <asp:ListItem>Associate Professor </asp:ListItem>
                    <asp:ListItem>Senior Assistant Professor</asp:ListItem>
                    <asp:ListItem>Assistant Professor</asp:ListItem>
                </asp:DropDownList>
             </div>
             </div>

       </div>
           <div class="form-group">
            <div class="col-md-2"></div>
               
            <div class="col-md-6">
             <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-default" OnClick="btnEdit_Click" />
            </div>
             </div>   


           </div>
      </div>
</div>
    


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
