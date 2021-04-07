<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Approved-list.aspx.cs" Inherits="LeaveMangaement.Approved_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <div class="container-fluid bg-light mt-5" >
         <asp:Panel runat="server" ID="p1">
            <asp:Label ID="i1" runat="server" Class="text-center ml-5 text-danger" Font-Size="xx-Large" Text="You haven't Approved any Leaves yet!"
                Font-Bold="true"></asp:Label><br />
        </asp:Panel>
        <asp:Panel runat="server" ID="Panel1"  HorizontalAlign="center" Font-Size="Medium">
    <table class="table  table-scripted bg-white shadow-lg">
  
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Employee</th>
                        <th scope="col">Email</th>
                        <th scope="col">From Date</th>
                        <th scope="col">To Date</th>
                        <th scope="col">Leave type</th>
                        <th scope="col">Status</th>
                        <th scope="col">Description</th>
                        <th scope="col">Approve</th>
                        <th scope="col">Deny</th>
                    </tr>
                </thead>
                <tbody>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            
                    <tr>
                        <td><%#Eval("uname") %></</td>
                        <td><%#Eval("email") %></td>
                        <td><%#Eval("from_date","{0:dd-MM-yyyy}") %></td>
                        <td><%#Eval("to_date","{0:dd-MM-yyyy}") %></td>
                        <td><%#Eval("type_of_leave") %></td>
                        <td <%# Convert.ToString(Eval("stat")) == "Approved" ? "style='color:lightgreen;font-style:bold;font-size:x-large'" : Convert.ToString(Eval("stat")) == "Denied" ? "style='color:red;font-style:bold;font-size:x-large'":"style='color:orange;font-style:bold;font-size:x-large'" %>><%#Eval("stat") %></td>
                        <td><%#Eval("descrip") %></td>
                        <td><asp:Button ID="approve"  Text="Approve" runat="server" class="btn btn-outline-success" Enabled='<%#Eval("stat").ToString()=="Pending For Approval" %>'  CommandArgument='<%#Eval("leaveId")%>' CommandName="approveLeave" OnClick="action_Approve_Deny_Click"/></td>
                        <td><asp:Button ID="deny" Text="Deny" runat="server" class="btn btn-outline-danger" Enabled='<%#Eval("stat").ToString()=="Pending For Approval" %>'  CommandArgument='<%#Eval("leaveId")%>' CommandName="denyLeave" OnClick="action_Approve_Deny_Click"/></td>
                    </tr>

        </ItemTemplate>
    </asp:Repeater>
                    
                </tbody>
            </table>
            </asp:Panel>
        </div>

</asp:Content>

