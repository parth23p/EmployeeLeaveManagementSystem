<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script>
        function show(event)
        {
            var btn = document.getElementById("Password");
            console.log("hii");
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
<body style="background-color:#ced4da;">
    <form id="form1" runat="server" >
        <div>

            <div class="container text-center mt-5 bg-white col-4 shadow-lg" style="border: 2px solid whitesmoke; border-radius:8px">
                <br />
                <br />
                <h2 class="display-5 text-success text-center">Welcome To ELMS</h2>
            
                <h2 class="display-6 text-success text-center ">Login</h2>
                <br />
           
                <asp:Label ID="Label1" runat="server" Text="Email" AssociatedControlID="Email" Font-Size="X-Large"></asp:Label>
                <div class="input-group">
                    <div class="input-group-prepend">  
                            <button id="userEmail" class="btn btn-success" type="button">  
                                <span class="fa fa-user-circle icon"></span>  
                            </button>  
                        </div> 

                     
                    <asp:TextBox ID="Email" type="email" class="form-control w-50" runat="server" placeholder="Email address"
                        Font-Size="Larger"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ForeColor="Red"
                        ErrorMessage="*Email is Required" ControlToValidate="Email" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                        ForeColor="Red" ErrorMessage="*Please enter valid email" ValidationExpression="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
                        ControlToValidate="Email"></asp:RegularExpressionValidator>
                     
                    <br />
                   
                
              

                <asp:Label ID="Label4" runat="server" Text="Password" AssociatedControlID="Password"
                    Font-Size="X-Large"></asp:Label>
                <div class="input-group">
                    <div class="input-group-prepend">  
                            <button id="password" class="btn btn-success" type="button">  
                                <span class="fa fa-unlock-alt icon fa-lg"></span>  
                            </button>  
                        </div> 

                <asp:TextBox ID="Password" type="password" class="form-control " runat="server" placeholder="Password"
                    Font-Size="Larger"></asp:TextBox>
                
                    <div class="input-group-append">  
                            <button id="show_password" class="btn btn-success" type="button" onclick="show(event)">  
                                <span id="eye-btn" class="fa fa-eye-slash icon"></span>  
                            </button>  
                        </div> 

                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ForeColor="Red"
                    ErrorMessage="*Password is Required" ControlToValidate="Password" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server"
                    ForeColor="Red" ErrorMessage="Password must contain atleast one uppercase letter,one lower case letter,one number and one special character and length of password must be at least 8 to 10 letters"
                    Display="Dynamic" ControlToValidate="Password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"></asp:RegularExpressionValidator>
                <br />
             
                <br />
                <asp:Button ID="Login" class="w-100  btn btn-lg btn-outline-success" runat="server" Text="Login"
                    OnClick="Login_Click" />
                <br />
                <br />
                <asp:Button ID="SignUp" class="w-100  btn btn-lg btn-outline-success" runat="server" Text="Goto SignUp"
                    OnClick="SignUp_Click" CausesValidation="false" />
               
                <br />
                  <br />
            </div>
            


        </div>


    </form>
    
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
