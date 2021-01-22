<%@ Page Title="Quản lý đăng nhập" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="QuanLyDangNhap.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.QuanLyDangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .data{
            font-size: 18px;
        }
    </style>
    <h1 style="text-align: center">QUẢN LÝ TÀI KHOẢN ĐĂNG NHẬP HỆ THỐNG</h1>
    <div style="display: flex">
        <div style="width: 50%;display: block">
            <div style="display: block">
                <asp:TextBox CssClass="text"  ID="txtTenDangNhap" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtMatKhau" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtReMatKhau" runat="server" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                <asp:DropDownList CssClass="drop" ID="dropQuyen" runat="server">
                    <asp:ListItem Value="">--Chọn quyền đăng nhập--</asp:ListItem>
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    <asp:ListItem Value="User">User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="display: flex">
                <asp:Button CssClass="btn" ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                <asp:Button CssClass="btn" ID="btnSua" runat="server" Text="Cập nhật" OnClick="btnSua_Click" />
            </div>
            <div style="display: flex;" >
                <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                <asp:Button CssClass="btn" ID="btnUpLoadFile" runat="server" Text="Thêm File Excel" OnClick="btnUpLoadFile_Click" />
            </div>
        </div>
        <div style="width: 50%;display: block">
            <div style="display: flex; margin: auto">
                <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập tài khoản cần tìm"></asp:TextBox>
                <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" />
            </div>
            <asp:GridView CssClass="data" ID="dataDangNhap" runat="server" style="margin: auto; text-align:center; font-size: 18px; text-decoration: none;" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="dataDangNhap_PageIndexChanging" OnRowDeleting="dataDangNhap_RowDeleting" OnSelectedIndexChanged="dataDangNhap_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" />
                    <asp:BoundField DataField="MatKhau" HeaderText="Mật khẩu" />
                    <asp:BoundField DataField="Quyen" HeaderText="Quyền đăng nhập" />
                    <asp:CommandField SelectText="Chỉnh sửa" ControlStyle-CssClass="drop1" ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Xóa" ControlStyle-CssClass="drop1" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
