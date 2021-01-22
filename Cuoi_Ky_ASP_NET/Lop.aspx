<%@ Page Title="Lớp sinh hoạt" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="Lop.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.Lop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .data{
            font-size: 18px;
        }
    </style>
    <div>
        <h1 style="text-align:center">QUẢN LÝ LỚP SINH HOẠT</h1>
        <div style="display:flex;" >
            <div style="width:40%; display:block;">
                <div style="display: flex;">
                    <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                    <asp:Button CssClass="btn" ID="btnUploadFile" runat="server" Text="Thêm file excel" OnClick="btnUploadFile_Click" />
                </div>
                <asp:DropDownList CssClass="drop" ID="dropKhoa" runat="server" OnSelectedIndexChanged="dropKhoa_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>--Chọn khoa--</asp:ListItem>
                </asp:DropDownList><br />
                <asp:DropDownList CssClass="drop" ID="dropNganh" runat="server">
                    <asp:ListItem>--Chọn ngành học--</asp:ListItem>
                </asp:DropDownList><br />
                <asp:DropDownList CssClass="drop" ID="dropKhoaHoc" runat="server">
                    <asp:ListItem>--Chọn khóa học--</asp:ListItem>
                </asp:DropDownList><br />
                <asp:TextBox CssClass="text" ID="txtMaLop" runat="server" placeholder="Nhập mã lớp"></asp:TextBox><br />
                <asp:TextBox CssClass="text" ID="txtTenLop" runat="server" placeholder="Nhập tên lớp"></asp:TextBox>
                <div style="display: flex;">
                    <asp:Button CssClass="btn" ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    <asp:Button CssClass="btn" ID="btnSua" runat="server" Text="Cập nhật" OnClick="btnSua_Click" />
                    <asp:Button CssClass="btn" ID="btnLamMoi" runat="server" Text="Làm mới" OnClick="btnLamMoi_Click" />
                </div>
            </div>
            <div style="width:60%; display:flex">
                <div style="margin-left: 45px; margin-top:10px">
                    <div style="display: flex; margin: auto">
                        <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập mã khoa hoặc tên khoa cần tìm"></asp:TextBox>
                        <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" />
                    </div>
                    <asp:GridView CssClass="data" ID="dataLop" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="dataLop_PageIndexChanging" OnRowDeleting="dataLop_RowDeleting" OnSelectedIndexChanged="dataLop_SelectedIndexChanged" DataKeyNames="malop" PageSize="5">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaKhoa" HeaderText="Mã khoa" />
                            <asp:BoundField DataField="TenKhoa" HeaderText="Tên khoa" />
                            <asp:BoundField DataField="MaNganh" HeaderText="Mã ngành" />
                            <asp:BoundField DataField="TenNganh" HeaderText="Tên ngành" />
                            <asp:BoundField DataField="MaKhoaHoc" HeaderText="Mã khóa học" />
                            <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" />
                            <asp:BoundField DataField="TenLop" HeaderText="Tên lớp" />
                            <asp:CommandField HeaderText="Chỉnh sửa" SelectText="Chỉnh sửa" ShowSelectButton="True" ControlStyle-CssClass="drop1"/>
                            <asp:CommandField DeleteText="Xóa" HeaderText="Xóa" ShowDeleteButton="True" ControlStyle-CssClass="drop1"/>
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
        </div>
    </div>
</asp:Content>
