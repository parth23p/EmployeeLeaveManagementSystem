<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign_up.aspx.cs" Inherits="Project.sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <style>
        *{
            font-family: 'Poppins', sans-serif;
        }
        .icon{
            width:20px;
        }
    </style>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />
    <script>
        function show(event)
        {
            var btn = document.getElementById("Password");
            
            if (btn.type == 'text') {
                btn.type='password';
                $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');  
            }
           else {
                btn.type = 'text';
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');  
            }
            event.preventDefault = true;
        }

    </script>
</head>
<body  style="background-color:#ced4da;">
    <form id="form1" runat="server">
      
            <div class="container text-center mt-5 bg-white col-7 shadow-lg" style="border: 2px solid whitesmoke; border-radius:8px">
                <p class="display-4 text-center text-success">Sign-Up Form</p>
                <div class="col-12 row">

                    <div class="col-6 col-md-6 col-sm-12">
                        <div class="mb-1">
                            <br />
                            <br />
                            <asp:Label class="form-label" ID="Label_Full_Name" runat="server" Font-Size="XX-Large">Full Name</asp:Label>
                            <br />
                            <br />
                             <div class="input-group">
                                 <div class="input-group-prepend">  
                                 <button id="username" class="btn btn-success" type="button">  
                                        <span class="fa fa-font icon"></span>  
                                 </button>  
                        </div> 
                           <asp:TextBox type="text" class="form-control" runat="server" Font-Size="Larger" ID="Full_Name"
                                placeholder="Your Full name here"></asp:TextBox>
                        </div>
                             
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFull_Name" runat="server" ForeColor="Red"
                                ErrorMessage="*Full Name is Required" ControlToValidate="Full_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorFull_Name" runat="server"
                                ForeColor="Red" ErrorMessage="* Please enter valid full name" ValidationExpression="^[a-zA-Z ]+$"
                                ControlToValidate="Full_Name" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>

                        <div class="mb-1">
                            <br />
                            <br />
                            <asp:Label class="form-label" ID="Label_Email" runat="server" Font-Size="XX-Large">Email</asp:Label>
                            <br />
                            <br />
                             <div class="input-group">
                                 <div class="input-group-prepend">  
                                 <button id="usereamil" class="btn btn-success" type="button">  
                                        <span class="fa fa-user-circle icon"></span>  
                                 </button>  
                        </div> 
                            <asp:TextBox type="email" class="form-control" ID="Email" Font-Size="Larger" placeholder="e.g max12@gmail.com"
                                runat="server" aria-describedby="emailHelp"></asp:TextBox>
                                  </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                ErrorMessage="*Email is Required" ControlToValidate="Email" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                                ErrorMessage="*Please enter valid email" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
                                ControlToValidate="Email" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                           
                        <br />
                        <div class="mb-1">
                            <br />
                            <asp:Label class="form-label" ID="Label_Password" runat="server" Font-Size="XX-Large">Password</asp:Label>
                            <br />
                            <br />
                            <div class="input-group">
                                 <div class="input-group-prepend">  
                                 <button id="userpass" class="btn btn-success" type="button">  
                                        <span class="fa fa-unlock-alt icon"></span>  
                                 </button>  
                        </div> 
                            <asp:TextBox type="password" class="form-control" runat="server" Font-Size="Larger"
                                ID="password" placeholder="your password here"></asp:TextBox>
                            
                            
                            <div class="input-group-append">  
                            <button id="show_password" class="btn btn-success" type="button" onclick="show(event)">  
                                <span id="eye-btn" class="fa fa-eye-slash icon"></span>  
                            </button>  
                      </div> 
                                  </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"
                                ErrorMessage="*Password is Required" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red"
                                ErrorMessage="Password must contain atleast one uppercase letter,one lower case letter,one number and one special character and length of password must be at least 8 char"
                                Display="Dynamic" ControlToValidate="Password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"></asp:RegularExpressionValidator>
                            
                        
                        </div>
                        <br />


                    </div>
                    <div class="col-6 col-md-6 col-sm-12">
                        <div class="mb-1">
                            <br />
                            <br />
                            <asp:Label class="form-label" ID="Label_mobile" runat="server" Font-Size="XX-Large">Contact no.</asp:Label>
                            <br />
                            <br />
                            <div class="input-group">
                                 <div class="input-group-prepend">  
                                 <button id="usermobile" class="btn btn-success" type="button">  
                                        <span class="fa fa-phone icon"></span>  
                                 </button>  
                        </div> 
                            <asp:TextBox type="tel" class="form-control" runat="server" ID="Mobile" Font-Size="Larger"
                                placeholder="e.g. 6454226890"></asp:TextBox>
                                </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                ErrorMessage="*Mobile No. is Required" ControlToValidate="Mobile" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" ForeColor="Red"
                                runat="server" ErrorMessage="*Please enter a valid mobile number" ValidationExpression="^[0-9]{10}"
                                ControlToValidate="Mobile" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                            
                        <br />
                        <div class="mb-1">
                            <br />
                            <asp:Label class="form-label" ID="Label_DOB" runat="server" Font-Size="XX-Large">Date Of Birth</asp:Label>
                            <br />
                            <br />
                            <div class="input-group">
                                 <div class="input-group-prepend">  
                                 <button id="userdob" class="btn btn-success" type="button">  
                                        <span class="fa fa-calendar icon"></span>  
                                 </button>  
                        </div> 
                            <asp:TextBox type="date" class="form-control" runat="server" ID="DOB" Font-Size="Larger"></asp:TextBox>
                                </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ForeColor="Red"
                                ErrorMessage="*Date of birth is Required" ControlToValidate="DOB" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="DOBCompare" runat="server" ErrorMessage="* Age must be greater than 23"
                                ControlToValidate="DOB" ForeColor="Red" ValueToCompare="10/10/2021" Operator="LessThan"
                                Type="Date" Display="Dynamic"></asp:CompareValidator>
                        
                        <br />
                        <div class="mb-1">
                            <br />
                            <asp:Label class="form-label" ID="Label_Gender" runat="server" Font-Size="XX-Large">Gender</asp:Label>
                            <br />
                            <br />
                            <asp:RadioButtonList ID="Gender" runat="server" Font-Size="Larger" RepeatDirection="Horizontal" >
                                <asp:ListItem Text="Male" >&nbsp;&nbsp;&nbsp;&nbsp;Male&nbsp;&nbsp;</asp:ListItem>

                                <asp:ListItem Text="Female" >&nbsp;&nbsp;&nbsp;&nbsp;Female&nbsp;&nbsp;</asp:ListItem>

                                <asp:ListItem Text="Other" >&nbsp;&nbsp;&nbsp;&nbsp;Other&nbsp;&nbsp;</asp:ListItem>
                            </asp:RadioButtonList>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" ForeColor="Red" runat="server"
                                ErrorMessage="*Gender field is required" ControlToValidate="Gender"></asp:RequiredFieldValidator>

                        

                    </div>

                </div>

                
                <br />
                <br />
                <br />
            </div>
            <asp:Label ID="Label_Status" runat="server" Text="" Font-Size="Larger"></asp:Label><br />
            <div class="mb-1 text-center">
                    <br />
                    <asp:Button ID="Submit" Class="btn btn-outline-success w-50 btn-lg text-center" runat="server"
                        Text="Submit" Width="250px" OnClick="Submit_Click" />
                </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
