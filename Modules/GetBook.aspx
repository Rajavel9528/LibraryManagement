<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GetBook.aspx.cs" Inherits="LibraryManagement.Modules.GetBook" %>


<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#gvBook").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#gvBook tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
        function alertMessage(msg) {
            alert(msg);

        }
    </script>
    <div id="mainContainer" class="container">
        <h2>Book Details</h2>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <asp:Button ID="btnCreate" CssClass="btn btn-info" Text="Create Book" runat="server" OnClick="btnCreate_Click" />
            </div>
        </div>
        <div class="shadowBox"  style="margin-top:10px">
            <div class="page-container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <label class="control-label col-sm-12" for="txtauthorname">Author Name</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtauthorname" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group col-lg-3">
                                    <label class="control-label col-sm-12" for="txtBook">Book Name</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtBook" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group col-lg-3">
                                    <label class="control-label col-sm-12" for="txtpib">Publisher Name</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txtpib" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group col-lg-3">
                                    <label class="control-label col-sm-12" for="ddlcat">Publisher Name</label>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddlcat" runat="server">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Sports" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Biography" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Education" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Technology" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                    <asp:Button ID="btnReset" CssClass="btn btn-info" runat="server" Text="Reset" OnClick="btnReset_Click" />
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-12 ">
                            <div class="table-responsive" style="margin-top: 10px">
                                <asp:GridView ID="gvBook" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="BookID,LEND_STATUS" EmptyDataText="There are no data records to display.">
                                    <Columns>
                                        <asp:BoundField HeaderText="Book ID" DataField="BookID"></asp:BoundField>
                                        <asp:BoundField HeaderText="Author Name" DataField="Author_Name"></asp:BoundField>
                                        <asp:BoundField HeaderText="Book Name" DataField="Book_Name"></asp:BoundField>
                                        <asp:BoundField HeaderText="Publisher Name" DataField="Publisher_Name"></asp:BoundField>
                                        <asp:BoundField HeaderText="Category" DataField="CATEGORY_DESCRIPTION"></asp:BoundField>
                                        <asp:BoundField HeaderText="Book Status" DataField="LendStatusDesc"></asp:BoundField>
                                          <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnget" runat="server" Text="Get" OnClick="btnget_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
    </div>
            </div>
        </div>
</asp:Content>