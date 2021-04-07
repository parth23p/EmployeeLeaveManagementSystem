<%@ Page Title="" Language="C#" MasterPageFile="~/user_master_page.Master" AutoEventWireup="true"
    CodeBehind="profile.aspx.cs" Inherits="Project.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:Repeater ID="r1" runat="server">
        <ItemTemplate>
            <div class="text-left container">
            <div class="card mb-3 bg-white shadow-lg m-5" >
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="Images/xyz.jpg" alt="..." width="100%" height="100%">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h4 class="card-title ui black">Emplyee Name: <%#Eval("uname") %></h4>
                            <h4 class="card-title">Email: <%#Eval("email") %></h4>
                            <h4 class="card-title">Date Of Birth <%#Eval("dob","{0:dd-MM-yyyy}") %></h4>
                            <h4 class="card-title">Contact number: <%#Eval("number") %></h4>
                            <h4 class="card-title">Gender: <%#Eval("gender") %></h4>
                            <asp:Button class="btn btn-lg btn-outline-primary" ID="update" runat="server" OnClick="update_Click"
                                Text="Update" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
