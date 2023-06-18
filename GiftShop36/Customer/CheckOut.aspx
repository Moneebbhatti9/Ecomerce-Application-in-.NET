<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Customer_CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia"/>
</head>
<body>
    <form id="form1" runat="server">
         <div class="text-dark">
        <div class="container tableCustomDesign">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 px-4">
                    <p style="font-size: 20px; margin-bottom: 5px;">Please fill the form to Proceed</p>
                    <hr class="mb-5 mt-0" />

                    <div class="form-group">
                        <asp:TextBox runat="server" ID="firstname" CssClass="form-control" placeholder="Enter your First Name" />
                        <asp:RequiredFieldValidator runat="server" ID="RFV1" SetFocusOnError="true" ControlToValidate="firstname" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                    </div>

                    <div class="form-group">
                        <asp:TextBox runat="server" ID="lastName" CssClass="form-control mt-2" placeholder="Enter your Last Name" />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="lastName" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                    </div>

                    <div class="form-group">
                        <asp:TextBox runat="server" ID="email" CssClass="form-control mt-2" placeholder="Enter your email" />
                        <asp:RequiredFieldValidator runat="server" ID="RFV3" SetFocusOnError="true" ControlToValidate="email" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                    </div>

                    <div class="form-group">
                        <asp:TextBox runat="server" ID="address" CssClass="form-control mt-2" placeholder="Enter your Address" />
                        <asp:RequiredFieldValidator runat="server" ID="RFV2" SetFocusOnError="true" ControlToValidate="address" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                    </div>

                      <div class="form-group">
                        <asp:TextBox runat="server" ID="phoneNo" CssClass="form-control mt-2" placeholder="Enter your Phone no." />
                        <asp:RequiredFieldValidator runat="server" ID="RFV4" SetFocusOnError="true" ControlToValidate="phoneNo" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                    </div>

                    <asp:Button runat="server" ID="checkoutButton" Text="Confirm Order" CssClass="btn btn-outline-primary mt-4 w-100" OnClick="checkoutButton_Click" />

                </div>
                <asp:Label ID="displaySuccessNotification" runat="server" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
