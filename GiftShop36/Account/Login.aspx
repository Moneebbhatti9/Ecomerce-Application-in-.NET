<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <meta name="viewport" content="width=device-width , initial-scale=1.0" />
    <link rel="stylesheet" href="../Bootstrap/bootstrap.min.css" />
</head>
<body style="background-color:aqua">
    <form id="form1" runat="server">
        <div class="container mt-5">

            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <h3 class="card-title text-center mb-5">Login Form</h3>

                            <div class="form-floating mb-3">
                                
                                <asp:TextBox required="true" runat="server" style="padding:2em" placeholder="Enter Email" ID="txtEmailAddress" CssClass="form-control"></asp:TextBox>
                                <label for="txtEmailAddress">Email Address</label>
                            </div>
                            <div class="form-floating mb-3">
                                
                                <asp:TextBox required="true" style="padding:2em" runat="server" placeholder="Enter Password" ID="txtPassword" Text="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <label for="txtPassword">Password</label>
                            </div>
                            <hr />
                            <div class="center">
                                <asp:Button CssClass="btn btn-primary text-uppercase" runat="server" ID="CmdLogin" Text="LOGIN" OnClick="CmdLogin_Click"></asp:Button>
                            </div>

                             <asp:Label runat="server" ID="notmatched" ForeColor="Red" CssClass="py-2"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
