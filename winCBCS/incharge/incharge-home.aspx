<%@ Page Title="Incharge Home" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="incharge-home.aspx.cs" Inherits="winCBCS.incharge.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">
    <li class="active"><a href="incharge-home.aspx">Home</a></li>
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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View Time Table <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="facultytimetable.aspx">For Faculty</a></li>
            <li><a href="studenttimetable.aspx">For Student</a></li>
        </ul>
    </li>

  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi...<label id="incharge_name" runat="server">Incharge Name</label> <span class="caret"></span></a>
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
        <label id="error_msg" runat="server">Program Not Added.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Program Added successful.
    </div>
            

            <div class="col-md-6 ">
     <div class="panel panel-default">
  <div class="panel-heading" >Time Table</div>
    <div class="panel-body">
        <div class="form-horizontal ">
    <div class="col-md-6">
        <div>

            <div class="form-group">
            

            <div class="form-group">
                <label for="email">Programe :</label>
                <asp:DropDownList ID="drpprogram" runat="server" CssClass="form-control" Enabled="true" OnSelectedIndexChanged="drpprogram_SelectedIndexChanged" AutoPostBack="True" >
                      <asp:ListItem Value="0">--Select--</asp:ListItem> 
                   
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldprgm" CssClass="text-danger"  runat="server" InitialValue="0" ErrorMessage="Enter Program !!!" ControlToValidate="drpprogram" Display="Dynamic"></asp:RequiredFieldValidator>

                 </div>
        
             <div class="form-group">
                <label for="email">Academic Year :</label>
                <asp:DropDownList ID="drpYear" runat="server" CssClass="form-control" Enabled="true" AutoPostBack="True" >
                      <asp:ListItem Value="0">--Select--</asp:ListItem> 
                   
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger"  runat="server" InitialValue="0" ErrorMessage="Select Year!!!" ControlToValidate="drpYear" Display="Dynamic"></asp:RequiredFieldValidator>

                 </div>

         <div class="form-group">
            <div class="col-md-2"></div>
               
            <div class="col-md-6">
             <asp:Button ID="btnAdd" runat="server" Text="Faculty Choice" CssClass="btn btn-default" OnClick="btnAdd_Click"   />
            </div>
             <div></div>
               <div class="form-group">
            <div class="col-md-2"></div>
               
           </div>
             </div>
              <div class="form-group">
            <div class="col-md-2"></div>
               
            <div class="col-md-6">
             <asp:Button ID="btnStud" runat="server" Text="Student Choice" CssClass="btn btn-default" OnClick="btnStud_Click"    />
            </div>
             <div></div>
               <div class="form-group">
            <div class="col-md-2"></div>
               
           </div>
             </div>
            </div>
             </div>   
   
</div>
   </div></div>
        </div>
        </div>
    
     <div class="col-md-6">
        <asp:DataList ID="data_cources" runat="server" CssClass="table table-striped" >
            <HeaderTemplate>

                <th>Faculty Name</th>
                <th>Total Credits</th>
                
               
            </HeaderTemplate>
            <ItemTemplate>
                <td><%# Eval("faculty_name") %></td>
                <td><%# Eval("totalcredit") %></td>
               
               
            </ItemTemplate>
        </asp:DataList>

         <asp:DataList ID="datastud" runat="server" CssClass="table table-striped" >
            <HeaderTemplate>

                <th>Student Name</th>
                
                <th>Total Credits</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td><%# Eval("student_name") %></td>
                <td><%# Eval("credits") %></td>
               
               
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
