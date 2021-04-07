<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_page.Master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="Project.update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

            <div class="  text-center container mt-5 shadow-lg">
                <p class="display-4 text-center">Upade Information</p>
                            <asp:Label ID="Label_Status" runat="server" Text="" Font-Size="X-Large" ForeColor="Green"></asp:Label><br />
                            <asp:Label class="form-label" ID="Label_Full_Name" runat="server" Font-Size="XX-Large">Full Name</asp:Label>
                            <br />
                            <br />
                            <asp:TextBox type="text" class="form-control" runat="server" Font-Size="Larger" ID="Full_Name"
                                placeholder="Your Full name here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFull_Name" runat="server" ForeColor="Red"
                                ErrorMessage="*Full Name is Required" ControlToValidate="Full_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorFull_Name" runat="server"
                                ForeColor="Red" ErrorMessage="* Please enter valid full name" ValidationExpression="^[a-zA-Z ]+$"
                                ControlToValidate="Full_Name" Display="Dynamic"></asp:RegularExpressionValidator>
     
                            <br />
                            <asp:Label class="form-label" ID="Label_mobile" runat="server" Font-Size="XX-Large">Mobile no:</asp:Label>
                            <br />
                            <br />
                            <asp:TextBox type="tel" class="form-control" runat="server" ID="Mobile" Font-Size="Larger"
                                placeholder="Enter 10 digit mobile no   e.g. 6454226890"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                                ErrorMessage="*Mobile No. is Required" ControlToValidate="Mobile" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMobile" ForeColor="Red"
                                runat="server" ErrorMessage="*Please enter a valid mobile number" ValidationExpression="^[0-9]{10}"
                                ControlToValidate="Mobile" Display="Dynamic"></asp:RegularExpressionValidator>
                      
                            <br />
                            <asp:Label class="form-label" ID="Label_DOB" runat="server" Font-Size="XX-Large">Date Of Birth</asp:Label>
                            <br />
                            <br />
                            <asp:TextBox type="date" class="form-control" runat="server" ID="DOB" Font-Size="Larger"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ForeColor="Red"
                                ErrorMessage="*Date of birth is Required" ControlToValidate="DOB" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="DOBCompare" runat="server" ErrorMessage="* Age must be greater than 23"
                                ControlToValidate="DOB" ForeColor="Red" ValueToCompare="" Operator="GreaterThan"></asp:CompareValidator>
                            <br />
                 <asp:Button class="btn btn-lg btn-outline-primary" ID="updateInfo" runat="server" OnClick="Submit_Click"
                                Text="Update" />
                      </div>

     
</asp:Content>
