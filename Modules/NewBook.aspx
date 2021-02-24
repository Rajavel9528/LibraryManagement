<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="NewBook.aspx.cs" Inherits="LibraryManagement.Modules.NewBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">
    <style type="text/css">
        /* style all input elements with a required attribute */
        input:required {
            box-shadow: 4px 4px 20px rgba(200, 0, 0, 0.85);
        }

            /**
 * style input elements that have a required
 * attribute and a focus state
 */
            input:required:focus {
                border: 1px solid red;
                outline: none;
            }
            .hide{
                display:none;
            }
    </style>
    <script type="text/javascript">
        function alertMessage(msg) {
            alert(msg);

        }
        function fnsubmit() {
            var tab = $("#AddBook").find(".haserror");

            if (tab.length > 0) {
                return false;
            }
            else {
                return true;
            }
        }
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUpload.ClientID %>").click();
            }
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
        <h2>Create Book</h2>
        <div class="row">
            <div class="col-lg-6" style="margin-top: 15px">
                <div class="control-label" style="color: #008000; font-weight: 600">
                    <asp:Label runat="server" ID="lblresultmsg"></asp:Label>
                </div>
            </div>
        </div>
        <div class="page-content" id="AddBook">
            <div class="content">
                <div class="form-horizontal nomargin" style="display: block;">
                    <div class="col-md-10 col-md-offset-1 empwrapper rowborder">
                        <div class="col-md-12">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-lg4 col-md-4 col-sm-4 col-xs-4">

                                        <div class="col-md-12">
                                            <label for="txtBookId" class="form-label">Book ID</label>
                                            <asp:TextBox ID="txtBookId" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="txtBookName" class="form-label">Book Name</label>
                                            <asp:TextBox ID="txtBookName"  CssClass="form-control" runat="server" required></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="Required" runat="server" ControlToValidate="txtBookName" ErrorMessage="* Book Name Required"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="txtAuthorName" class="form-label">Author Name</label>
                                            <asp:TextBox ID="txtAuthorName"  CssClass="form-control" runat="server" required></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  CssClass="Required"  runat="server" ControlToValidate="txtBookName" ErrorMessage="* Book Name Required"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-md-12">
                                            <label for="txtAuthorName" class="form-label">Publisher Name</label>
                                            <asp:TextBox ID="txtpublisherName"  CssClass="form-control" runat="server" required></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="Required"  runat="server" ControlToValidate="txtpublisherName" ErrorMessage="* Publisher Name Required"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-md-12">
                                            <label for="txtAuthorName" class="form-label">Category</label>
                                            <asp:DropDownList ID="ddlcat"   CssClass="form-control" runat="server" data-toggle="tooltip" data-placement="top">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Sports" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Biography" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Education" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Technology" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  CssClass="Required"  InitialValue="0" runat="server" ControlToValidate="ddlcat" ErrorMessage="*Category Required"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        
                                        <asp:Image ID="Image1" runat="server" Height="100" Width="100" />
                                        <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.PNG,.bmp,.BMP,.jpeg,.JPEG,.jpg,.JPG"></asp:FileUpload>
                                        <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" CssClass="hide"/>
                                    </div>
                                    <div>
                                        <asp:HiddenField ID="hdnimg" runat="server" />
                                    </div>
                                    <div class="col-12">
                                        <asp:Button ID="Submit" Text="Create" runat="server" CssClass="btn btn-primary" OnClick="Submit_Click" />
                                        <asp:Button ID="btnupdate" Text="Update" runat="server" CssClass="btn btn-primary" OnClick="btnupdate_Click" />
                                        <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-primary" OnClick="btnDelete_Click" />
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
