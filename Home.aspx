<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagement.Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">


        <div id="mainContainer" class="container">
            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <span class="text-info">Books</span>
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvBook" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="BookID" EmptyDataText="There are no data records to display.">
                                        <Columns>
                                            <asp:BoundField HeaderText="Book ID" DataField="BookID"></asp:BoundField>
                                            <asp:BoundField HeaderText="Author Name" DataField="Author_Name"></asp:BoundField>
                                            <asp:BoundField HeaderText="Book Name" DataField="Book_Name"></asp:BoundField>
                                            <asp:BoundField HeaderText="Publisher Name" DataField="Publisher_Name"></asp:BoundField>
                                            <asp:BoundField HeaderText="Category" DataField="CATEGORY_DESCRIPTION"></asp:BoundField>
                                            <asp:BoundField HeaderText="Book Status" DataField="LendStatusDesc"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="shadowBox">
                <div class="page-container">
                    <div class="container">
                        <span class="text-info">Users</span>
                        <div class="row">
                            <div class="col-lg-12 ">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvUSer" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="UserID" EmptyDataText="There are no data records to display.">
                                        <Columns>
                                            <asp:BoundField HeaderText="User ID" DataField="UserID"></asp:BoundField>
                                            <asp:BoundField HeaderText="User Name" DataField="USER_NAME"></asp:BoundField>
                                            <asp:BoundField HeaderText="User Role" DataField="LOGINROLE"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <%--    <div class="container">
        <h2>Dash Board</h2>

        <asp:GridView ID="gvBook" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="false"
            EditRowStyle-HorizontalAlign="NotSet" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" DataKeyNames="BookID"
            CssClass="mydatagrid dt-responsive gvSerach" HeaderStyle-CssClass="header" PagerStyle-CssClass="pager"
            RowStyle-CssClass="rows" EmptyDataRowStyle-HorizontalAlign="Center">
            <Columns>
                <asp:BoundField HeaderText="Book ID" DataField="BookID"></asp:BoundField>
                <asp:BoundField HeaderText="Autho _Name" DataField="Author_Name"></asp:BoundField>
                <asp:BoundField HeaderText="Book Name" DataField="Book_Name"></asp:BoundField>
                <asp:BoundField HeaderText="Publisher Name" DataField="Publisher_Name"></asp:BoundField>
                <asp:BoundField HeaderText="Category" DataField="CATEGORY_DESCRIPTION"></asp:BoundField>
                <asp:BoundField HeaderText="Book Status" DataField="LendStatusDesc"></asp:BoundField>
            </Columns>
            <EmptyDataRowStyle HorizontalAlign="Center" />
            <HeaderStyle CssClass="header" />
            <PagerStyle CssClass="pager" />
            <RowStyle CssClass="rows" />
            <AlternatingRowStyle CssClass="row-alt" />
        </asp:GridView>


    </div>--%>
</asp:Content>

