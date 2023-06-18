<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="CartProductList.aspx.cs" Inherits="Customer_CartProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <style>
        .tableCustomDesign {
            font-family: 'Cormorant SC', serif;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="text-dark">

        <div class="container tableCustomDesign">
            <div class="row text-center">
                <p style="font-size: 3rem;">Your Cart Items</p>
                <hr />

            </div>
            <asp:GridView runat="server" ID="GVCartItem" AutoGenerateColumns="false" CssClass="table table-bordered text-dark" OnRowDeleting="GVCartItem_RowDeleting" OnRowCommand="GVCartItem_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%#"../Assests/Images/" + Eval("ProductImage") %>' Width="50px" CssClass="imageDesing" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductPrice" HeaderText="Price" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="cmdDelete" Text="Delete" CssClass="text-danger" CommandName="delete" CommandArgument='<%# Eval("ProductID") %>' OnClientClick="return confirm('Are you sure you want to delete this Product ?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
            <div class="d-flex justify-content-end align-items-center">
                <p class="mx-4 text-dark mt-3" style="font-size: 1.5rem;">Total Amount:<span runat="server" id="total_text"></span></p>
                <asp:Button runat="server" CssClass="btn btn-info" Text="Checkout" Style="padding: 10px 25px;" OnCommand="moveToCheckout" />
            </div>
        </div>

    </div>


</asp:Content>

