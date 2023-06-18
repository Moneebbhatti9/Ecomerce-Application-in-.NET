<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="addBrand.aspx.cs" Inherits="Admin_addBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

         <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="container mt-5">
          <div class="col-lg-8">

        <div class="row d-flex justify-content-center align-item-center" style="margin-top: 5rem">

            <h1>GIFT BRANDS</h1>
            <div class=" col-lg-3 col-md-6 col-sm-10">

                <div class="input">
                    <asp:TextBox runat="server" ID="txtBrandName" placeholder="Enter Brand Name" CssClass="form-control"></asp:TextBox>
                </div>

            </div>
            <div class=" col-lg-3 col-md-6 col-sm-10">
                <div class="button">
                    <asp:Button runat="server" ID="addBrand" CssClass="btn btn-primary" Text="Add Brand" OnClick="addBrand_Click" />
                </div>
            </div>

        </div>
        <br />
        <br />


        <asp:GridView runat="server" ID="brandGV" AutoGenerateColumns="false" OnRowCommand="brandGV_RowCommand" CssClass="p-3 table table-bordered" OnRowDeleting="brandGV_RowDeleting">
            <Columns>
                <asp:BoundField DataField="BrandName" HeaderText="Brand" />

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="delBrand" Text="Delete" CommandName="delete" CssClass="btn btn-danger"  CommandArgument='<%# Eval("BrandID")%>' OnClientClick="return confirm('Are you sure you want to delete this brand?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
              </div>
    </div>

</asp:Content>

