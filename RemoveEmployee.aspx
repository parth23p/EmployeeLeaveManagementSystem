<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RemoveEmployee.aspx.cs" Inherits="Project.RemoveEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid bg-light mt-5" >
         <asp:Panel runat="server" ID="p1">
            <asp:Label ID="i1" runat="server" Class="text-center ml-5 text-danger" Font-Size="xx-Large" Text="You haven't any Employees!"
                Font-Bold="true"></asp:Label><br />
        </asp:Panel>
        <asp:Panel runat="server" ID="Panel1"  HorizontalAlign="center" Font-Size="Medium">
    <table class="table  table-scripted bg-white shadow-lg">
  
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Employee Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Date of Birth</th>
                        <th scope="col">Contact no.</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Left leaves</th>
                        <th scope="col">Remove</th>

                        
                    </tr>
                </thead>
                <tbody>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            
                    <tr>
                        <td><%#Eval("uname") %></</td>
                        <td><%#Eval("email") %></td>
                        <td><%#Eval("dob","{0:dd-MM-yyyy}") %></td>
                        <td><%#Eval("number") %></td>
                        <td><%#Eval("gender") %></td>
                        <td><%#Eval("leftLeaves") %></td>
                        <td><asp:Button ID="remove" Text="Remove" runat="server" class="btn btn-outline-danger"   CommandArgument='<%#Eval("id")%>' CommandName="removeEmployee" OnClick="remove_employee_on_Click"/></td>
                    </tr>

        </ItemTemplate>
    </asp:Repeater>
                    
                </tbody>
            </table>
            </asp:Panel>
        </div>
</asp:Content>
