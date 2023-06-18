<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="Admin_addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .signUpContainer {
            width: 100%;
            display: flex;
            min-width: 100%;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            font-family: "Trirong", serif;
        }

        .signUpContainer .formShadow {
                width: 50%;
                padding: 50px;
                box-shadow: 20px;
                border-radius: 20px;
                box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
         }

        .signUpContainer .title {
                font-size: 35px;
         }

        .signUpContainer .formShadow .inputDesign {
                border: none;
                width: 350px;
                font-size: 15px;
                margin-top: 25px;
                padding: 8px 2px;
                border-bottom: 2px solid #F5F5F5;
         }

        .signUpContainer .formShadow .checkBoxFlex {
                display: flex;
                margin-top: 20px;
         }

        .signUpContainer .formShadow .checkBoxFlex .checkBoxDesign {
                margin-right: 12px;
         }

        .input:focus-visible {
            outline: none;
        }

        @media screen and (max-width: 767px) {
            .signUpContainer .formShadow .inputDesign {
                width: 100%;
            }
        }

        @media screen and (max-width: 992px) {
            .signUpContainer .formShadow {
                width: 80%;
            }
        }

        @media screen and (max-width: 767px) {
            .signUpContainer .formShadow {
                width: 80%;
            }
        }

        @media screen and (max-width: 576px) {
            .signUpContainer .formShadow {
                width: 100%;
            }
        }

        @media screen and (max-width: 480px) {
            .signUpContainer .formShadow {
                width: 60%;
            }
        }

        @media screen and (max-width: 576px) {
            .signUpContainer .formShadow .checkBoxFlex .paragraphDesign {
                font-size: 12px;
            }
        }

        .buttons {
            margin-top: 20px;
        }

        .btn-hover {
            width: 150px;
            height: 35px;
            color: #fff;
            border: none;
            font-size: 16px;
            cursor: pointer;
            font-weight: 600;
            text-align: center;
            background-size: 300% 100%;
            border-radius: 50px;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        .btn-hover:hover {
                background-position: 100% 0;
                -o-transition: all .4s ease-in-out;
                -webkit-transition: all .4s ease-in-out;
                transition: all .4s ease-in-out;
         }

        .btn-hover:focus {
                outline: none;
         }

        .btn-hover.color-3 {
                background-image: linear-gradient(to right, #667eea, #764ba2, #6B8DD6, #8E37D7);
                box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
         }

        .errorMessageSize {
                font-size: 15px;
         }
        .cancelButtonDesign {
                margin-top: 15px;
         }
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="signUpContainer">
            <div class="formShadow">

                <div class="title" runat="server" id="displayTitleConditionally">User Registration </div>
                <hr class="mt-0 pt-0 mb-3" />

                <asp:TextBox runat="server" ID="firstName" CssClass="inputDesign" PlaceHolder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RFV1" SetFocusOnError="true" ControlToValidate="firstName" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />

                <asp:TextBox runat="server" ID="lastName" CssClass="inputDesign" PlaceHolder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="lastName" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />

                <asp:TextBox runat="server" ID="emailAddress" CssClass="inputDesign" PlaceHolder="Emial"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="emailAddress" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />
                   <br /> 
                   <asp:Label runat="server" ID="emailExistsNotification" CssClass="text-danger" ></asp:Label>

                <asp:TextBox runat="server" ID="password" CssClass="inputDesign" PlaceHolder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" SetFocusOnError="true" ControlToValidate="password" ErrorMessage="* Required" foreColor="Red" CssClass="errorMessageSize" />

                <asp:TextBox runat="server" ID="confirmPassword" CssClass="inputDesign" PlaceHolder="Confrim Password" TextMode="Password"></asp:TextBox>
                <br />
                <asp:CompareValidator runat="server" ID="CompareValidator1" SetFocusOnError="true" ControlToValidate="password" ControlToCompare="confirmPassword" Text="Password didn't Match" ForeColor="Red" CssClass="errorMessageSize" />

                <div class="buttons">
                    <asp:Button runat="server" class="btn-hover color-3 mt-4 px-5" Text="Add Admin" ID="cmdSave" OnClick="cmdSave_Click" />
                    <a href="./AdminDashboard.aspx" class="text-danger mx-4 cancelButtonDesign">Cancel</a>
                </div>


            </div>
        </div>


</asp:Content>

