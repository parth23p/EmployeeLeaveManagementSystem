<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_page.Master" AutoEventWireup="true"
    CodeBehind="Leave_history.aspx.cs" Inherits="Project.Leave_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5">
        <asp:Label ID="i2" runat="server" Font-Size="XX-Large" Text="Your Leave History"
            Font-Bold="true"></asp:Label><br />
        <br />
        <asp:Panel runat="server" ID="p1">
            <asp:Label ID="i1" runat="server" Font-Size="x-Large" Text="You haven't applied for any leaves yet."
                Font-Bold="false"></asp:Label><br />
        </asp:Panel>
        <asp:Panel runat="server" ID="Panel1"  HorizontalAlign="center" Font-Size="Medium">
            <table class="table shadow-lg bg-white rounded text-center"  >
                <thead class="thead-dark">

                    <tr>
                        <th scope="col">Employee Name</th>
                          <th scope="col">Email</th>
                        <th scope="col">From Date</th>
                        <th scope="col">To Date</th>
                        <th scope="col">Type Of Leave</th>
                        <th scope="col">Status</th>
                        <th scope="col">Description</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>

                                <th scope="row" ><%#Eval("uname") %></th>
                                <td><%#Eval("email") %></td>
                                <td><%#Eval("from_da","{0:dd-MM-yyyy}") %></td>
                                <td><%#Eval("to_da","{0:dd-MM-yyyy}") %></td>
                                <td><%#Eval("type_of_leave") %></td>
                                <td><%#Eval("stat") %></td>
                                <td><%#Eval("descrip") %></td>
                                </tr>
                         

                            </ItemTemplate>
                        </asp:Repeater>


                </tbody>
            </table>
        </asp:Panel>

    </div>
</asp:Content>
