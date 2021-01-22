<%@ Page Title="Khoa" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="Khoa.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.Khoa" %>
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
        <h1 style="text-align:center">QUẢN LÝ KHOA</h1>
        <div style= "display:flex;">
            <div style="width:50%; display:block;">
                <div style="display: flex;" >
                    <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                    <asp:Button CssClass="btn" ID="btnUpLoadFile" runat="server" Text="Thêm File Excel" OnClick="btnUpLoadFile_Click" />
                </div>
                <asp:TextBox CssClass="text" ID="txtMaKhoa" runat="server" placeholder="Nhập mã khoa"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtTenKhoa" runat="server" placeholder="Nhập tên khoa"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtSDT" runat="server" placeholder="Nhập số điện thoại"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="txtDiaChi" runat="server" placeholder="Nhập địa chỉ"></asp:TextBox>
                <div style="display: flex;">
                    <asp:Button CssClass="btn" ID="btnThemKhoa" runat="server" Text="Thêm" OnClick="btnThemKhoa_Click"/>
                    <asp:Button CssClass="btn" ID="btnCapNhapKhoa" runat="server" Text="Cập nhật" OnClick="btnCapNhapKhoa_Click"/>
                    <asp:Button CssClass="btn" ID="btnLamMoi" runat="server" Text="Làm mới" OnClick="btnLamMoi_Click" />
                </div>
            </div>
            <div style="width:50%; display:block">
                <div style="margin-left: 55px">
                    <div style="display: flex; margin: auto">
                        <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập mã khoa hoặc tên khoa cần tìm"></asp:TextBox>
                        <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" />
                    </div>
                    <asp:GridView CssClass="data" ID="dataKhoa" runat="server" style="text-align: center; margin: auto; text-decoration: none;" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="dataKhoa_PageIndexChanging" OnRowDeleting="dataKhoa_RowDeleting" OnSelectedIndexChanged="dataKhoa_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="3">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaKhoa" HeaderText="Mã Khoa" />
                            <asp:BoundField DataField="TenKhoa" HeaderText="Tên Khoa" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                            <asp:CommandField SelectText="Chỉnh sửa" ShowSelectButton="True" ControlStyle-CssClass="drop1"/>
                            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ControlStyle-CssClass="drop1"/>
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
