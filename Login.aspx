﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" EnableEventValidation="false" CodeBehind="Login.aspx.cs" Inherits="LibraryManagement.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">
    <style>
        /* Style all input fields */
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
        }

            /* Style the submit button */
            input[type=submit] {
                background-color: #4CAF50;
                color: white;
            }

        /* Style the container for inputs */
        .container {
            background-color: #f1f1f1;
            padding: 20px;
        }

        /* The message box is shown when the user clicks on the password field */
        #message {
            display: none;
            background: #f1f1f1;
            color: #000;
            position: relative;
            padding: 20px;
            margin-top: 10px;
                padding-top: 0px;
        }

            #message p {
                padding: 0px 35px;
                font-size: 12px;
                
    margin-bottom: 2px;
            }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: green;
        }

            .valid:before {
                position: relative;
                left: -35px;
                content: "✔";
            }

        /* Add a red text color and an "x" when the requirements are wrong */
        .invalid {
            color: red;
        }

            .invalid:before {
                position: relative;
                left: -35px;
                content: "✖";
            }
    </style>
  
    <div class="container">
        <h2>Login</h2>
        <form class="form-horizontal" action="/action_page.php">
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">User Name:</label>
                <div class="col-sm-4">
                       <input type="UserName" id="txtun" runat="server" name="txtun" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-4">
                    <input type="password" id="txtpwd" runat="server" name="txtpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                </div>
            </div>
            <div id="message">
                <p><b></b>Password must contain the following:<b></b></p>
                <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                <p id="number" class="invalid">A <b>number</b></p>
                <p id="length" class="invalid">Minimum <b>8 characters</b></p>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-4">
                    <asp:Button ID="btnLogin" Text="Login" runat="server" CssClass="btn btn-primary" OnClick="Login_Click" />
                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn btn-primary" OnClick="btnCancel_Click" />
                </div>
            </div>
        </form>
    </div>

      <script>
          function alertMessage(msg) {
              alert(msg);

          }
          var myInput = document.getElementById("txtpwd");
          var letter = document.getElementById("letter");
          var capital = document.getElementById("capital");
          var number = document.getElementById("number");
          var length = document.getElementById("length");

          // When the user clicks on the password field, show the message box
          myInput.onfocus = function () {
              document.getElementById("message").style.display = "block";
          }

          // When the user clicks outside of the password field, hide the message box
          myInput.onblur = function () {
              document.getElementById("message").style.display = "none";
          }

          // When the user starts to type something inside the password field
          myInput.onkeyup = function () {
              // Validate lowercase letters
              var lowerCaseLetters = /[a-z]/g;
              if (myInput.value.match(lowerCaseLetters)) {
                  letter.classList.remove("invalid");
                  letter.classList.add("valid");
              } else {
                  letter.classList.remove("valid");
                  letter.classList.add("invalid");
              }

              // Validate capital letters
              var upperCaseLetters = /[A-Z]/g;
              if (myInput.value.match(upperCaseLetters)) {
                  capital.classList.remove("invalid");
                  capital.classList.add("valid");
              } else {
                  capital.classList.remove("valid");
                  capital.classList.add("invalid");
              }

              // Validate numbers
              var numbers = /[0-9]/g;
              if (myInput.value.match(numbers)) {
                  number.classList.remove("invalid");
                  number.classList.add("valid");
              } else {
                  number.classList.remove("valid");
                  number.classList.add("invalid");
              }

              // Validate length
              if (myInput.value.length >= 8) {
                  length.classList.remove("invalid");
                  length.classList.add("valid");
              } else {
                  length.classList.remove("valid");
                  length.classList.add("invalid");
              }
          }
    </script>
</asp:Content>
