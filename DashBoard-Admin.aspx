<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DashBoard-Admin.aspx.cs" Inherits="LeaveMangaement.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid row"  >
        
              <div class="card text-white bg-dark  col-3" style="margin:35px;max-height:22rem">
              <div class="card-header">Total Employee</div>
              <div class="card-body">
                <h4 class="card-title" ID="totalEmployees" runat="server"></h4>
                <p class="card-text">
                     <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-primary" NavigateUrl="all-employee-list-admin.aspx">see all employees</asp:HyperLink>
                </p>
              </div>
            </div>
        
            <div class="card text-dark bg-light  col-3" style="margin:35px;max-height:22rem" >
              <div class="card-header ">Pending for approval/denial</div>
              <div class="card-body">
                <h4 class="card-title" ID="totalPendings" runat="server"></h4>
                <p class="card-text" > 
                  <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" runat="server" NavigateUrl="~/leaves-list-admin.aspx">Manage Pending Leaves</asp:HyperLink>
                    </p>
              </div>
            </div>
        
            <div class="card text-white bg-dark  col-3" style="margin:35px;max-height:22rem">
              <div class="card-header">Delete Employee</div>
              <div class="card-body">
                <h5 class="card-title">
                    <asp:HyperLink NavigateUrl="~/RemoveEmployee.aspx" CssClass="btn btn-danger" runat="server">
                        Goto Remove Employee
                    </asp:HyperLink>
                </h5>
                <p class="card-text">You can delete Employees who had left the Department from here</p>
              </div>
            </div>
        </div>

</asp:Content>

