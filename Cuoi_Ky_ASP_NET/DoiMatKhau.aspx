<%@ Page Title="Đổi mật khẩu" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <h1 style="text-align: center">ĐỔI MẬT KHẨU</h1>
    <div style="display: block">
        <asp:TextBox CssClass="text"  ID="txtTenDangNhap" runat="server"></asp:TextBox>
        <asp:TextBox CssClass="text" ID="txtMatKhauMoi" runat="server" placeholder="Nhập mật khẩu mới" TextMode="Password"></asp:TextBox>
        <asp:TextBox CssClass="text" ID="txtNhapLaiMatKhau" runat="server" placeholder="Nhập lại mật khẩu mới" TextMode="Password"></asp:TextBox>
        <asp:Button CssClass="btn" ID="btnSua" runat="server" Text="Đổi mật khẩu" OnClick="btnSua_Click" />
    </div>
</asp:Content>
