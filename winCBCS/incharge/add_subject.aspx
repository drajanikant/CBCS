<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="add_subject.aspx.cs" Inherits="winCBCS.incharge.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    <li ><a href="incharge-home.aspx" class="active">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Course <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx" >Add Course</a></li>
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

    <script type = "text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=cboxLecture.ClientID %>").checked == true || document.getElementById("<%=cboxPractical.ClientID %>").checked == true || document.getElementById("<%=cboxTutorial.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>

   <div class="col-md-6">
    <div class="panel panel-default">
  <div class="panel-heading" >Add Cources</div>
  <div class="panel-body">
    
       <div class="form-horizontal ">
        <div class="form-group">
          <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Academic Year"></asp:Label>
            <div class="col-md-6">
                <asp:DropDownList ID="drpCoursename" runat="server" CssClass="form-control" AutoPostBack="True" >
                    <asp:ListItem Value="0">Select Course</asp:ListItem>
                    <asp:ListItem Value="1">Mechanical Engineering</asp:ListItem>
                    <asp:ListItem Value="2">Electrical Engineering</asp:ListItem>
                    <asp:ListItem Value="3">Electronics &amp; Telecommunication Engineering</asp:ListItem>
                    <asp:ListItem Value="4">Computer Science Engineering</asp:ListItem>
                    <asp:ListItem Value="5">Information Technology</asp:ListItem>
                    <asp:ListItem Value="6">Automobile Engineering</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="requirefieldcourse" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Enter Course Name !!!" ControlToValidate="drpCoursename" ></asp:RequiredFieldValidator>

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
                 <asp:RequiredFieldValidator ID="RequiredFieldsem" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Enter Academic Sem!!!" ControlToValidate="drpAcademicsemester"></asp:RequiredFieldValidator>
             </div>
             </div>
    

       <div class="form-group">
               <asp:Label ID="Label4" runat="server" CssClass="col-md-4 control-label" Text="Subject">
               </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpSubject" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">Select Subject</asp:ListItem>
                   
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" InitialValue="0" runat="server" ErrorMessage="Enter Subject!!!" ControlToValidate="drpSubject"></asp:RequiredFieldValidator>
             </div>
             </div>

       <div class="form-group">
           <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Subject Code">           </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtAcademicsem" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldyear" CssClass="text-danger" runat="server" ErrorMessage="Enter Academic Year !!!" ControlToValidate="txtAcademicsem"></asp:RequiredFieldValidator>
             </div>
             </div>


        <div class="form-group">
              <asp:Label ID="Label5" runat="server" CssClass="col-md-4 control-label" Text="Subject Type">

              </asp:Label>
             <div class="col-md-6">
                 <asp:CheckBox ID="cboxLecture" runat="server" Text="Lecture"/>
                 <asp:CheckBox ID="cboxPractical" runat="server" Text="Practical" />
                 <asp:CheckBox ID="cboxTutorial" runat="server" Text="Tutorial" />

                 <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="text-danger" ErrorMessage="Required !!!" ClientValidationFunction = "ValidateCheckBox"></asp:CustomValidator><br />
             </div>
             </div>

           
        <div class="form-group">
              <asp:Label ID="Label6" runat="server" CssClass="col-md-4 control-label" Text="Maximum Student">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtMaxstudent" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldmax" CssClass="text-danger" runat="server" ErrorMessage="Enter maximum student !!!" ControlToValidate="txtMaxstudent"></asp:RequiredFieldValidator>
        
             </div>
             </div>


           <div class="form-group">
              <asp:Label ID="Label7" runat="server" CssClass="col-md-4 control-label" Text="Minimum Student">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtMinstudent" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldmin" CssClass="text-danger" runat="server" ErrorMessage="Enter minimum student !!!" ControlToValidate="txtMinstudent"></asp:RequiredFieldValidator>
        
             </div>
             </div>

           
           <div class="form-group">
              <asp:Label ID="Label8" runat="server" CssClass="col-md-4 control-label" Text="Credits">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtCredit" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldcredit" CssClass="text-danger" runat="server" ErrorMessage="Enter credit !!!" ControlToValidate="txtCredit"></asp:RequiredFieldValidator>
        
             </div>
             </div>

           <div class="form-group">
              <asp:Label ID="Label9" runat="server" CssClass="col-md-4 control-label" Text="Credits Division">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtCreditdivision" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldCreditdivision" CssClass="text-danger" runat="server" ErrorMessage="Enter credit !!!" ControlToValidate="txtCreditdivision"></asp:RequiredFieldValidator>
        
             </div>
             </div>

         <div class="form-group">
              <asp:Label ID="Label10" runat="server" CssClass="col-md-4 control-label" Text="Prerequisite">

              </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpPrerequisite" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">Select Prerequisite</asp:ListItem>
                     <asp:ListItem Value="1">Yes</asp:ListItem>
                     <asp:ListItem Value="2">No</asp:ListItem>
                     
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldprerequisite" CssClass="text-danger" runat="server" ErrorMessage="Enter credit !!!" InitialValue="0" ControlToValidate="drpPrerequisite"></asp:RequiredFieldValidator>
        
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
       </div>   



      
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
