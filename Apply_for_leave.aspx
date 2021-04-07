<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_page.Master" AutoEventWireup="true"
    CodeBehind="Apply_for_leave.aspx.cs" Inherits="Project.Apply_for_leave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .abc:focus {
            border-color: blue;
            box-shadow: 0px 0px 9px rgb(0, 148, 255);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center mt-5 bg-white col-6 shadow-lg" style="border: 2px solid whitesmoke; border-radius:8px" >
        
        <br />
        <asp:Label ID="Label5" runat="server" cssClass="mt-5 text-success text-center display-4" Text="Apply For Leave"
            Font-Bold="True" Font-Size="XX-Large"> </asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="" ForeColor="" CssClass="text-center"
            Font-Bold="True" Font-Size="X-Large"> </asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Select leave type:" AssociatedControlID="DropDownList1"
            Font-Size="X-Large"></asp:Label><br />
        <asp:DropDownList class="form-select col-4 abc text-center" ID="DropDownList1" runat="server"
            Font-Size="Larger">
            <asp:ListItem Text="Select your leave type" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Casual Leave"></asp:ListItem>
            <asp:ListItem Text="Medical Leave"></asp:ListItem>
            <asp:ListItem Text="Other"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLeave" runat="server"
            ErrorMessage="Select leave type" ControlToValidate="DropDownList1" ForeColor="red"
            InitialValue="-1"></asp:RequiredFieldValidator>
        <br />
        <br />

        <asp:Label ID="Label2" runat="server" Text="From Date:" AssociatedControlID="From"
            Font-Size="x-Large"></asp:Label><br />
        <asp:TextBox class="text-center abc col-4" ID="From" runat="server" TextMode="Date"
            Font-Size="Larger"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFrom" runat="server" Display="Dynamic"
            ErrorMessage="Select From Date" ControlToValidate="From" ForeColor="red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter date greater than equal today"
            ControlToValidate="From"
            Display="Dynamic" ForeColor="Red" ValueToCompare="" Type="Date" Operator="GreaterThanEqual"></asp:CompareValidator><br />
        <br />

        <asp:Label ID="Label3" runat="server" Text="To date:" AssociatedControlID="To" Font-Size="XX-Large"></asp:Label><br />
        <asp:TextBox class="text-center abc col-4" ID="To" runat="server" TextMode="Date"
            Font-Size="x-Large"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTo" runat="server"
            ErrorMessage="Select To Date" ControlToValidate="To" ForeColor="red" class="text-center"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Enter date greater than from date"
            ControlToValidate="To"
            Display="Dynamic" ForeColor="Red" ControlToCompare="From" Type="Date" Operator="GreaterThanEqual"></asp:CompareValidator>
        <asp:Label ID="i1" runat="server" Text="" ForeColor="red" CssClass="text-center"> </asp:Label><br />
        <br />


        <asp:Label ID="Label4" runat="server" Text="Description:" AssociatedControlID="desc"
            Font-Size="X-Large"></asp:Label><br />
        <asp:TextBox ID="desc" class="text-center abc col-4" Font-Size="Larger" runat="server"
            TextMode="MultiLine"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesc" runat="server" Display="Dynamic"
            ErrorMessage="Plz Write a small description" ControlToValidate="desc" ForeColor="red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="desc" ID="RegularExpressionValidator1" ForeColor="Red"
            ValidationExpression="^[\s\S]{0,15}$" runat="server" ErrorMessage="Maximum 15 characters allowed."></asp:RegularExpressionValidator>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" class="w-50 btn btn-outline-success btn-lg" Text="Apply for leave"
            OnClick="Button1_Click" CausesValidation="false" />
        <br />
        <br />
    </div>



</asp:Content>
