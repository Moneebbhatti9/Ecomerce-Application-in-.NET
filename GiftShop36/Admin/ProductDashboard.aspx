<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="ProductDashboard.aspx.cs" Inherits="Admin_ProductDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

         <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div class="container" style="margin-top:5rem">
        <h1>PRODUCT LISTING</h1>

        <asp:GridView runat="server" ID="ProductGV" OnRowCommand="ProductGV_RowCommand"  AutoGenerateColumns="false" OnRowEditing="ProductGV_RowEditing" OnRowDeleting="ProductGV_RowDeleting" CssClass="table table-bordered">
            <Columns>
                <asp:TemplateField  HeaderText="Product Images">
                    <ItemTemplate>
                        <asp:Image ImageUrl='<%# "../Assests/Images/" + Eval("ProductImage") %>' Width="50px"  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="Product Name" DataField="ProductName" />
                 <asp:BoundField HeaderText="Watch Diameter" DataField="WatchDiameter" />
                 <asp:BoundField HeaderText="Fragnance" DataField="Fragnance" />
                 <asp:BoundField HeaderText="Ring Size" DataField="RingSize" />
                 <asp:BoundField HeaderText="Ring COlor" DataField="RingColor" />
                 <asp:BoundField HeaderText="Product Quantity" DataField="ProductQuantity" />
                 <asp:BoundField HeaderText="Product Price" DataField="ProductPrice" />
                <asp:BoundField HeaderText="Brand Name" DataField="brandName" />
                <asp:BoundField HeaderText="Category Name" DataField="categoryName" />

                <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="cmdEdit" Text="Edit" CommandName="edit"  CommandArgument=<%# Eval("ProductID") %> CssClass="btn btn-primary"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="cmdDelete" Text="Delete" CssClass="btn btn-danger" CommandName="delete"  CommandArgument=<%# Eval("ProductID") %> onClientClick="return confirm('Are You Sure You Want To Delete This Product?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
                 

            </Columns>
        </asp:GridView>

    </div>

</asp:Content>

