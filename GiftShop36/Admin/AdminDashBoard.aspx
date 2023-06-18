<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminDashBoard.aspx.cs" Inherits="Admin_AdminDashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        .backgroundcolor{
            background-color:ivory;
        }
        .navbarcolor{
            background-color:paleturquoise;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container mt-5">
     <%--<div style="text-align:right; margin-bottom:10px ; display:inline;"><a href="Logout">LOGOUT</a></div>--%>
    <div style="text-align:right; margin-bottom:10px">
        <asp:Button runat="server" ID="addUser" CssClass="btn btn-primary" Text="Add New User" OnClick="addUser_Click"/>
    </div>

    <asp:GridView runat="server" ID="GV" AutoGenerateColumns="false" OnRowCommand="GV_RowCommand" OnRowEditing="GV_RowEditing" OnRowDeleting="GV_RowDeleting" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField HeaderText="First Name" DataField="FirstName" />
            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
            <asp:BoundField HeaderText="Email" DataField="Email" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="cmdEdit" Text="Edit" CommandName="edit"  CommandArgument=<%# Eval("UserID") %> CssClass="btn btn-primary"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="cmdDelete" Text="Delete" CssClass="btn btn-danger" CommandName="delete"  CommandArgument=<%# Eval("UserID") %> onClientClick="return confirm('Are You Sure You Want To Delete This User?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>

</asp:Content>

