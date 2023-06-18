<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="addCategory.aspx.cs" Inherits="Admin_addCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
     <div class="container mt-5">

        <div class="row d-flex justify-content-center align-item-center" style="margin-top: 5rem">

            <h1>GIFT CATEGORIES</h1>
            <div class=" col-lg-3 col-md-6 col-sm-10">

                <div class="input">
                    <asp:TextBox runat="server" ID="txtCatName" placeholder="Enter Category Name" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
            <div class=" col-lg-3 col-md-6 col-sm-10">
                <div class="button">
                    <asp:Button runat="server" ID="addCategory" CssClass="btn btn-primary" Text="Add Category" OnClick="addCategory_Click" />
                </div>
            </div>

        </div>
        <br />
        <br />


        <asp:GridView runat="server" ID="categoryGV" AutoGenerateColumns="false" OnRowCommand="categoryGV_RowCommand" CssClass="p-3 table table-bordered" OnRowDeleting="categoryGV_RowDeleting">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="deleteCat" Text="Delete" CommandName="delete" CssClass="btn btn-danger"  CommandArgument='<%# Eval("CategoryID")%>' OnClientClick="return confirm('Are you sure you want to delete this Category?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


</asp:Content>

