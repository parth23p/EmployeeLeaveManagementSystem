<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="all-employee-list-admin.aspx.cs" Inherits="LeaveMangaement.all_employee_list_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-light mt-5">
    <table class="table table-scripted bg-white text-center shadow-lg" >
  
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Employee name</th>
                        <th scope="col">Email</th>
                        <th scope="col">DOB</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Contact Number</th>       
                        <th scope="col">Left Leaves</th>   
                    </tr>
                </thead>
                <tbody>
    
                    <asp:Repeater ID="Repeater" runat="server">
                    <ItemTemplate>
            
                    <tr>
                        
                        <td><%#Eval("uname") %></td>
                        <td><%#Eval("email") %></td>
                        <td><%#Eval("dob","{0:dd-MM-yyyy}") %></td>
                        <td><%#Eval("gender") %></td>
                        <td><%#Eval("number") %></td>
                        <td><%#Eval("leftLeaves") %></td>
                        
                    </tr>

        </ItemTemplate>
    </asp:Repeater>
                    
                </tbody>
            </table>
        </div>

</asp:Content>
