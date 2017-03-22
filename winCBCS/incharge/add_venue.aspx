<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="add_venue.aspx.cs" Inherits="winCBCS.incharge.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

     <li class="active"><a href="incharge-home.aspx">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx">Add Course</a></li>
            <li><a href="#">List Course</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Subject <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_subject.aspx">Add Subject</a></li>
            <li><a href="#">List Subject</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Venue <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_venue.aspx">Add Venue</a></li>
            <li><a href="#">List Venue</a></li>
        </ul>
    </li>
    
  <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Settings <span class="caret"></span></a>
        <ul class="dropdown-menu">
             <li><a href="incharge_profile.aspx">Profile</a></li>
            <li><a href="incharge_changepassword.aspx">Forgot Password</a></li>
                         <li><a href="#">Logout</a></li>


           
        </ul>
    </li>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

     <div class="col-md-6">
    <div class="panel panel-default">
  <div class="panel-heading" >Add Venue</div>
  <div class="panel-body">
    
       <div class="form-horizontal ">
        <div class="form-group">
        
         <div class="form-group">
              <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Venue Name">

              </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtVenuename" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldvenuename" CssClass="text-danger" runat="server" ErrorMessage="Enter Venue Name !!!" ControlToValidate="txtVenuename"></asp:RequiredFieldValidator>
             </div>
             </div>
           <div class="form-group">
               <asp:Label ID="Label3" runat="server" CssClass="col-md-4 control-label" Text="Venue Type">
               </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpVenuetype" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">Select Venue Type</asp:ListItem>
                     <asp:ListItem Value="1">Classroom</asp:ListItem>
                     <asp:ListItem Value="2">Labs</asp:ListItem>
                     
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldtype" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Select Venue Type!!!" ControlToValidate="drpVenuetype"></asp:RequiredFieldValidator>
             </div>
             </div>
       </div>
      
           
             
           <div class="form-group">
            <div class="col-md-2"></div>
               
            <div class="col-md-6">
             <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" />
            </div>
               <div class="form-group">
            <div class="col-md-2"></div>
               
           
             <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" />
            </div>
             </div>   
           </div>
      </div>
</div>

    <div class="col-md-6"></div>
    <div class="form-horizontal col-md-6">
        <div class="form-group">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </div>

    </div> 
    </div>
  

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
