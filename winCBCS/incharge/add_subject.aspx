<%@ Page Title="" Language="C#" MasterPageFile="~/incharge/incharge.Master" AutoEventWireup="true" CodeBehind="add_subject.aspx.cs" Inherits="winCBCS.incharge.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentNavItems" runat="server">

    <li ><a href="incharge-home.aspx" class="active">Home</a></li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Program <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="add_course.aspx" >Add Program</a></li>
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
        <label id="error_msg" runat="server">Program Not Added.</label>.
    </div>
    <div id="alert_success" runat="server" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Program Added successful.
    </div>

    <script type = "text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=cboxLecture.ClientID %>").checked == true || document.getElementById("<%=cboxPractical.ClientID %>").checked == true || document.getElementById("<%=cboxTutorial.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>

   <div class="col-md-6 ">
    <div class="panel panel-default">
  <div class="panel-heading" style="font-size: 20px; text-align: center;">Add Program</div>
  <div class="panel-body">
    
       <div class="form-horizontal ">
        <div class="form-group">
          <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Academic Year"></asp:Label>
            <div class="col-md-6">
                <asp:DropDownList ID="drpAcademicyear" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpAcademicyear_SelectedIndexChanged" >
                    <asp:ListItem Value="0">Select Year</asp:ListItem>
                   
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="requirefieldcourse" CssClass="text-danger" InitialValue="" runat="server" ErrorMessage="Enter Academic Year !!!" ControlToValidate="drpAcademicyear" Display="Dynamic" ></asp:RequiredFieldValidator>

            </div>
            </div>

            <div class="form-group">
               <asp:Label ID="Label13" runat="server" CssClass="col-md-4 control-label" Text="Course Name">
               </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpCourse" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="drpCourse_SelectedIndexChanged">
                     <asp:ListItem Value="0">Select Program Name</asp:ListItem>
                 
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" InitialValue="" runat="server" ErrorMessage="Enter Program Name!!!" ControlToValidate="drpCourse" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>
             </div>



           <div class="form-group">
               <asp:Label ID="Label3" runat="server" CssClass="col-md-4 control-label" Text="Acedemic Semester">
               </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpAcademicsemester" runat="server" CssClass="form-control">
                     <asp:ListItem Value="0">Select Semester</asp:ListItem>
                   
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldsem" CssClass="text-danger" InitialValue="" runat="server" ErrorMessage="Enter Academic Sem!!!" ControlToValidate="drpAcademicsemester" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>
             </div>
    

       <div class="form-group">
               <asp:Label ID="Label4" runat="server" CssClass="col-md-4 control-label" Text="Course">
               </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtSubject" runat="server" CssClass="col-mod-4 form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"  runat="server" ErrorMessage="Enter Course!!!" ControlToValidate="txtSubject" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>
             </div>

           <div class="form-group">
               <asp:Label ID="Label5" runat="server" CssClass="col-md-4 control-label" Text="Course Type">
               </asp:Label>
             <div class="col-md-6">
                 <asp:DropDownList ID="drpSubjectType" runat="server" CssClass="form-control" AutoPostBack="True" >
                     <asp:ListItem Value="">-- Select --</asp:ListItem>
                 
                     <asp:ListItem Value="1">Core Course</asp:ListItem>
                     <asp:ListItem Value="2">Elective Course</asp:ListItem>
                 
                 </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" InitialValue="" runat="server" ErrorMessage="Select Course type!!!" ControlToValidate="drpSubjectType" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>
             </div>


       <div class="form-group">
           <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Course Code">           </asp:Label>
             <div class="col-md-6">
                 <asp:TextBox ID="txtSubjectCode" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldyear" CssClass="text-danger" runat="server" ErrorMessage="Enter Course Code !!!" ControlToValidate="txtSubjectCode" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>
             </div>



           
        <div class="form-group">
              <asp:Label ID="Label6" runat="server" CssClass="col-md-4 control-label" Text="Maximum Student">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtMaxstudent" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldmax" CssClass="text-danger" runat="server" ErrorMessage="Enter maximum student !!!" ControlToValidate="txtMaxstudent" Display="Dynamic"></asp:RequiredFieldValidator>
        
             </div>
             </div>


           <div class="form-group">
              <asp:Label ID="Label7" runat="server" CssClass="col-md-4 control-label" Text="Minimum Student">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtMinstudent" CssClass="col-md-2 form-control" runat="server" OnTextChanged="txtMinstudent_TextChanged"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldmin" CssClass="text-danger" runat="server" ErrorMessage="Enter minimum student !!!" ControlToValidate="txtMinstudent" Display="Dynamic"></asp:RequiredFieldValidator>
        
             </div>
             </div>


           


             
           
           
               
            
             
           </div>
      </div>

     </div>
       </div>   

    <div class="col-md-6">
    <div class="panel panel-default">
  <div class="panel-heading" >Add Course Credit</div>
  <div class="panel-body">
    
       <div class="form-horizontal ">
        
                   <div class="form-group">
              <asp:Label ID="Label20" runat="server" CssClass="col-md-4 control-label" Text="Course Type">

              </asp:Label>
             <div class="col-md-6">
                 <asp:CheckBox ID="cboxLecture" runat="server" Text="Lecture" AutoPostBack="True" OnCheckedChanged="cboxLecture_CheckedChanged"/>
                 <asp:CheckBox ID="cboxPractical" runat="server" Text="Practical" AutoPostBack="True" OnCheckedChanged="cboxPractical_CheckedChanged" />
                 <asp:CheckBox ID="cboxTutorial" runat="server" Text="Tutorial" AutoPostBack="True" OnCheckedChanged="cboxTutorial_CheckedChanged" />

                 <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="text-danger" ErrorMessage="Required !!!" ClientValidationFunction = "ValidateCheckBox" Display="Dynamic"></asp:CustomValidator><br />
             </div>
             </div>

           
           <div class="form-group">
              <asp:Label ID="Label21" runat="server" CssClass="col-md-4 control-label" Text="Credits">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtCredit" CssClass="col-md-2 form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" CssClass="text-danger" runat="server" ErrorMessage="Enter credit !!!" ControlToValidate="txtCredit" Display="Dynamic"></asp:RequiredFieldValidator>
        
             </div>
             </div>

           <div class="form-group">
              <asp:Label ID="Label22" runat="server" CssClass="col-md-4 control-label" Text="Lecture Credits">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtLecturecredit" CssClass="col-md-2 form-control" runat="server" ReadOnly="True">0</asp:TextBox>
        
             </div>
             </div>


             <div class="form-group">
              <asp:Label ID="Label23" runat="server" CssClass="col-md-4 control-label" Text="Practical Credits">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtpracticalcredit" CssClass="col-md-2 form-control" runat="server" ReadOnly="True">0</asp:TextBox>
        
             </div>
             </div>

           <div class="form-group">
              <asp:Label ID="Label24" runat="server" CssClass="col-md-4 control-label" Text="Tutorial Credits">

              </asp:Label>
             <div class="col-md-6">
                <asp:TextBox ID="txtTutorialcredit" CssClass="col-md-2 form-control" runat="server" ReadOnly="True">0</asp:TextBox>
        
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
       </div>  

      
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
</asp:Content>
