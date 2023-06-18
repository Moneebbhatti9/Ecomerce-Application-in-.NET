<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeFile="addProduct.aspx.cs" Inherits="Admin_addProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" />

    <link rel="stylesheet" href="../Content/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <link href="jquery/datatables.min.css" rel="stylesheet" />
    <script src="jquery/jquery-3.6.3.js"></script>
    <script src="jquery/datatables.min.js"></script>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
      <section class="vh-100 gradient-custom">      
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-3 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Product Details</h3>
                            <div class="row">
                                <div class="col-md-6 mb-4">

                                    <div class="form-outline">
                                      
                                        <label class="form-label" for="firstName">Product Name</label>
                                        <asp:TextBox runat="server" ID="txtpname" CssClass="form-control form-control-lg" />
                                       <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" runat="server" ControlToValidate="txtpname" ForeColor="Red" ErrorMessage="Product Name Required" ></asp:RequiredFieldValidator>
                                         
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4">

                                    <div class="form-outline">
                                         <label class="form-label select-label">Choose Brand</label>
                                        <asp:DropDownList runat="server" ID="ddbrands" CssClass="select form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" runat="server" ControlToValidate="ddbrands" InitialValue="0" ForeColor="Red" ErrorMessage="Please Chooise Brands" ></asp:RequiredFieldValidator>
                                       
                                    </div>

                                </div>
                            </div>
                            <div class="row">
     
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                         <label class="form-label select-label">Choose category</label>
                                        <asp:DropDownList runat="server" ID="ddcategory" CssClass="select form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" runat="server" ControlToValidate="ddcategory" InitialValue="0" ForeColor="Red" ErrorMessage="Please Chooise category" ></asp:RequiredFieldValidator>
                                       
                                    </div>
                                   

                                </div>
                            </div>
                           
                            <div class="row">
                                <div class="col-md-6 mb-4 pb-2">

                                    <div class="form-outline">
                                       
                                         <label class="form-label" >Enter Watch Diameter(along with unit)</label>

                                        <asp:TextBox runat="server" ID="txtdiameter" CssClass="form-control form-control-lg" />
                                        <asp:CompareValidator SetFocusOnError="true" runat="server" id="cvddiameter" Type="Integer" ControlToValidate="txtdiameter" Operator="DataTypeCheck" ErrorMessage="diameter  must be int" ForeColor="red"></asp:CompareValidator>                                       

                                    </div>

                                </div>
                              
                                </div>


                               

                            </div>
                            <div class="row">
                               
                                <div class="col-md-6 mb-4 pb-2">
                                    <label class="form-label">Enter Band Size</label>
                                    <asp:TextBox runat="server" ID="txtbandsize" CssClass="form-control form-control-lg"></asp:TextBox>
                                    <asp:CompareValidator SetFocusOnError="true" runat="server" id="cvdbandsize" Type="Integer" ControlToValidate="txtbandsize" Operator="DataTypeCheck" ErrorMessage="Band size  must be int" ForeColor="red"></asp:CompareValidator>                                       


                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4 pb-2">

                                    <div class="form-outline">
                                        <label class="form-label select-label">Enter Watch Bands Color Name </label>
                                    <asp:TextBox runat="server" ID="txtbandcolor" CssClass="form-control form-control-lg" />
                                       
                                        </div>

                                </div>
                              

                            </div>
                            


                             <div class="row">
                                <div class="col-md-6 mb-4 pb-2">
                                     <div class="form-outline">
                                   <lable class="form-label"> Enter Ring Width in mm</lable>
                                    <asp:TextBox runat="server" id="txtwidth" CssClass="form-control form-control-lg"  ></asp:TextBox>
                                         <asp:CompareValidator SetFocusOnError="true" runat="server" id="cvdringwidth" Type="Integer" ControlToValidate="txtwidth" Operator="DataTypeCheck" ErrorMessage="Ring Width  must be int " ForeColor="red"></asp:CompareValidator>                                       
                                         <asp:RangeValidator SetFocusOnError="true" runat="server" ID="rvdringwidth" Type="Integer" ControlToValidate="txtwidth" MaximumValue="21" MinimumValue="14" ErrorMessage="invalid ring width size" ForeColor="red" ></asp:RangeValidator>
                                         </div>
                                </div>
                               <div class="col-md-6 mb-4 ">
                                   <div class="form-outline">
                                   <lable class="form-label"> Enter Ring Size</lable>
                                    <asp:TextBox runat="server" id="txtsize" CssClass="form-control form-control-lg"  ></asp:TextBox>
                                       <asp:RangeValidator runat="server" ID="rvdringsize" Type="Integer" ControlToValidate="txtsize" MaximumValue="29" MinimumValue="12" ErrorMessage="invalid ring size range" ForeColor="red"></asp:RangeValidator>
                                         </div>
                                   
                                </div>
                                  
                            </div>
                             <div class="row">
                                <div class="col-md-6 mb-4 pb-2">
                                      <div class="form-outline">
                                        <label class="form-label">Enter Ring Color</label>

                                        <asp:TextBox runat="server" ID="txtringcolor" CssClass="form-control form-control-lg" />
                                       
                                    </div>

                                </div>
                              
                                   <div class="col-md-6 mb-4 pb-2">
                                      <div class="form-outline">
                                        <label class="form-label">Enter Fragrence</label>

                                        <asp:TextBox runat="server" ID="txtfragrance" CssClass="form-control form-control-lg" />
                                       
                                    </div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4 pb-2">
                                     <div class="form-outline">
                                   <lable class="form-label"> Enter Description about product</lable>
                                         <textarea runat="server" id="txtdescription" CssClass="form-control "  ></textarea>
                                    
                                         </div>
                                </div>
                              
                                  
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-4 ">

                                    <div class="form-outline">
                                        <label class="form-label">Enter Total Items in Stock</label>

                                        <asp:TextBox runat="server" ID="txtitemsinstock" CssClass="form-control form-control-lg" />
                                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtitemsinstock"  ForeColor="Red" ErrorMessage="Total Items Required" ></asp:RequiredFieldValidator>
                                        <asp:CompareValidator SetFocusOnError="true" runat="server" id="cvdItemInStock" Type="Integer" ControlToValidate="txtitemsinstock" Operator="DataTypeCheck" ErrorMessage="items must be number " ForeColor="red"></asp:CompareValidator>                                       
                                         
                                    </div>

                                </div>
                                <div class="col-md-6 mb-4 pb-2">

                                    <div class="form-outline">
                                        <label class="form-label">Enter Price per Item</label>
                                    
                                        <asp:TextBox runat="server" ID="Txtprice" CssClass="form-control form-control-lg" />
                                     <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="Txtprice" ForeColor="Red" ErrorMessage="Price Required" ></asp:RequiredFieldValidator>
                                          <asp:CompareValidator SetFocusOnError="true" runat="server" id="cvdprice" Type="Integer" ControlToValidate="Txtprice" Operator="DataTypeCheck" ErrorMessage="Price must be in int " ForeColor="red"></asp:CompareValidator>                                       
                                        
                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12 mb-4 pb-2">

                                    <div class="form-outline">
                                        <asp:ValidationSummary CssClass="border-2" runat="server" />
                                    </div>

                                </div>
                                

                            </div>

                        <div class="row">
                                <div class="col-md-6 mb-4">
                                    <div class="form-outline">
                                        <label class="form-label" runat="server" id="lblpictureuploader" >Choose Product Picture</label>
                                        <asp:FileUpload   runat="server"  ID="pictureuploader" class="btn btn-primary" />
                                        <asp:Image runat="server"  id="imageview" Visible="false" style="width:150px; height:150px" />
                                        </div>

                                </div>
                                <div class="col-md-6 mb-4">
                                        <asp:Button Visible="false" CausesValidation="false" runat="server" ID="btnchangepic" CssClass="btn btn-primary"
                                         OnClick="btnchangepic_Click" Text="Click Here to Change Image" />
                                    </div>
                            </div>

                            <div class="mt-4 pt-2">
                                <asp:Button runat="server" ID="btnsave" CssClass="btn btn-primary btn-lg" Text="Save"  OnClick="btnsave_Click"/>
                                <asp:Button CausesValidation="false" runat="server" ID="btncancel" CssClass="btn btn-primary btn-lg" OnClick="btncancel_Click" Text="Cancel" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
       
    </section>

</asp:Content>

