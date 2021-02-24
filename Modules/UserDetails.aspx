<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="UserDetails.aspx.cs" Inherits="LibraryManagement.Modules.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">

    <div id="mainContainer" class="container">

        <h2>User Details</h2>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <asp:Button ID="btnCreate"  CssClass="btn btn-info" T Text="Create User" runat="server" OnClick="btnCreate_Click" />
            </div>
        </div>
        <div class="shadowBox" style="margin-top:10px">
            <div class="page-container">
                <div class="container">
                    <span class="text-info"></span>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="gvUSer" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="UserID" EmptyDataText="There are no data records to display.">
                                    <Columns>
                                        <asp:BoundField HeaderText="User ID" DataField="UserID"></asp:BoundField>
                                        <asp:BoundField HeaderText="User Name" DataField="USER_NAME"></asp:BoundField>
                                        <asp:BoundField HeaderText="User Role" DataField="LOGINROLE"></asp:BoundField>
                                         <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnView" runat="server" Text="View" OnClick="btnView_Click"></asp:LinkButton>
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
    </div>
</asp:Content>
