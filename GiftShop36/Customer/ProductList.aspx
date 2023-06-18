<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="Customer_ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>GIFT SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        .tableCustomDesign{
            font-family: 'Cormorant SC', serif;
        }

        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid mb-5">
        <div class="row">
            <div class="col-lg-3 mt-4" style="position: static; top: 5%; font-size:1rem; left: 0; max-height: 100vh;">
                <asp:LinkButton runat="server" ID="allProducts" OnClick="allProducts_Click" Text="All Products"></asp:LinkButton>

                 <asp:GridView runat="server" ID="brandGV" AutoGenerateColumns="false" CssClass="table table-light table-hover border" OnRowCommand="brandGV_RowCommand" Style="margin-top:5rem">
                    <Columns>
                        <asp:TemplateField HeaderText="Please Select Brand">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="text-dark" runat="server" ID="buybrand" Text='<%# Eval("brandName") %>' CommandName="buybrand" CommandArgument='<%# Eval("brandName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="col-lg-9">
                <div class="title text-center text-dark" style="font-size: 2rem;" runat="server" id="displayTitleConditionally"></div>
                <div style="display: flex; justify-content: center;" >

                <hr class="bg-light w-50 pt-1 rounded" />
                </div>
                <asp:DataList ID="DLFilteredProducts" runat="server" RepeatLayout="Flow" CssClass="row" ItemStyle-CssClass="col-lg-3 col-md-6 col-sm-12">
                    <ItemTemplate>
                        <div class="card mt-4 tableCustomDesign" style="width: 12rem;">
                            <asp:Image ImageUrl='<%#"../Assests/Images/" + Eval("ProductImage") %>' CssClass="image-fluid card-img-top" runat="server" Width="" Height="150px" />
                            <div class="card-body" style="background-color:khaki;">
                                <h5 class="card-title text-center" style="font-size: 20px;"> <sup><b>Price:</b> <span class="city"><%# Eval("ProductPrice") %></span></sup><sub>/pkr</sub><br /></h5>
                                <asp:LinkButton runat="server" CssClass="btn btn-outline-primary mt-2 w-100" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnCommand="AddToCartCommand" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

            </div>
        </div>
    </div>

</asp:Content>

