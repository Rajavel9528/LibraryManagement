<%@ Page Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="LibraryManagement.Modules.Users" %>


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
    <script type="text/javascript">
        function alertMessage(msg) {
            alert(msg);

        }

        $(function () {
            if (typeof ValidatorUpdateDisplay != 'undefined') {
                var originalValidatorUpdateDisplay = ValidatorUpdateDisplay;

                ValidatorUpdateDisplay = function (val) {
                    if (!val.isvalid) {
                        $("#" + val.controltovalidate).closest("div").addClass("form-error");
                    }

                    originalValidatorUpdateDisplay(val);
                }
            }
        });
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
              .forEach(function (form) {
                  form.addEventListener('submit', function (event) {
                      if (!form.checkValidity()) {
                          event.preventDefault()
                          event.stopPropagation()
                      }

                      form.classList.add('was-validated')
                  }, false)
              })
        })()

    </script>
    <div class="container">
        <h2>Create User</h2>

        <div class="container">
            <form class="form-horizontal" action="/action_page.php">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">User ID:</label>
                    <div class="col-sm-4">
                        <input type="UserId" id="UserId" runat="server" name="UserId" required disabled>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">User Name:</label>
                    <div class="col-sm-4">
                        <input type="UserName" id="txtusername" runat="server" name="txtun" required>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="AddUser" CssClass="Required" runat="server" ControlToValidate="txtUserName" ErrorMessage="* User Name Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-4">
                        <input type="password" id="txtpwd" runat="server" name="txtpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="Required" ValidationGroup="AddUser" runat="server" ControlToValidate="txtpwd" ErrorMessage="* Password Required"></asp:RequiredFieldValidator>
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
                    <label class="control-label col-sm-2" for="email">User Name:</label>
                    <div class="col-sm-4">

                        <select id="ddlUserRole" runat="server" name="cars">
                            <option value="0">Select</option>
                            <option value="1">Admin</option>
                            <option value="2">Normal USer</option>
                            <option value="audi">Audi</option>
                        </select>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="AddUser" CssClass="Required" runat="server" ControlToValidate="ddlUserRole" ErrorMessage="* User Role Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:Button ID="btnsubmit" Text="Create" runat="server" ValidationGroup="AddUser" CssClass="btn btn-primary" OnClick="btnsubmit_Click" />
                        <asp:Button ID="btnupdate" Text="Update" runat="server" ValidationGroup="AddUser" CssClass="btn btn-primary" OnClick="btnupdate_Click" />
                        <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-primary" OnClick="btnDelete_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
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
