<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Books.aspx.cs" Inherits="LibraryManagement.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pagetitle" runat="server">
     <asp:TextBox ID="TextBox1" lass="form-control" Enabled="false" runat="server"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentPlaceholder3" runat="server" ClientIDMode="Static">
    <div>
        
     <asp:TextBox ID="TextBox2" class="form-control" Enabled="false" runat="server"></asp:TextBox>

    </div>
    <div class="container">
        <h2>Login</h2>
         <asp:TextBox ID="txtsam" lass="form-control" Enabled="false" runat="server"></asp:TextBox>
        <form class="Books">
            <div class="form-group">
                <label class="control-label col-sm-2">Book ID:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtBookID" lass="form-control" Enabled="false" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="Book Name">Book Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtBookNamr" lass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="Author Name">Author Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAuthor" lass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="Publisher Name">Publisher Name:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtpublisher" lass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="Publisher Name">Category:</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="boocat" runat="server">
                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Sports" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Education" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Technology" Value="3"></asp:ListItem>
                        <asp:ListItem Text="BioPic" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button CssClass="btn btn-primary" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Create"/>
                       <asp:Button CssClass="btn btn-primary" runat="server" Enabled="false" ID="btnUpdate" OnClick="btnUpdate_Click" Text="Update"/>
                       <asp:Button CssClass="btn btn-primary" runat="server" Enabled="false" ID="btnDelete" OnClick="btnDelete_Click" Text="Deleted"/>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
