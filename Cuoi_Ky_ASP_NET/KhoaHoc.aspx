<%@ Page Title="Khóa học" Language="C#" MasterPageFile="~/TrangChung.Master" AutoEventWireup="true" CodeBehind="KhoaHoc.aspx.cs" Inherits="Cuoi_Ky_ASP_NET.KhoaHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleChung.css"/>
    <style>
        .data{
            font-size: 18px;
            text-align: center;
            margin: auto;
        }
    </style>
    <div>
        <h1 style="text-align:center">QUẢN LÝ KHÓA HỌC</h1>
        <div style= "display:flex;">
            <div style="width:50%; display:block">
                <div style="display: flex;" >
                    <asp:FileUpload CssClass="chonFile" ID="FileUploadExcel" runat="server" />
                    <asp:Button CssClass="btn" ID="btnUpLoadFile" runat="server" Text="Thêm File Excel" OnClick="btnUpLoadFile_Click" />
                </div>
                <asp:TextBox CssClass="text" ID="txtMaKhoaHoc" runat="server" placeholder="Nhập mã khóa học" AutoPostBack="True"></asp:TextBox><br />
                <asp:TextBox CssClass="text" ID="txtNamBatDau" runat="server" placeholder="Nhập năm bắt đầu"></asp:TextBox><br />
                <asp:TextBox CssClass="text" ID="txtNamKetThuc" runat="server" placeholder="Nhập năm kết thúc"></asp:TextBox>
                <div style="display: flex;">
                    <asp:Button CssClass="btn" ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    <asp:Button CssClass="btn" ID="btnSua" runat="server" Text="Cập nhật" OnClick="btnSua_Click" />
                    <asp:Button CssClass="btn" ID="btnLamMoi" runat="server" Text="Làm mới" OnClick="btnLamMoi_Click" />
                </div>
            </div>
            <div style="width:50%; display:block">
                <div style="margin-left: 55px">
                    <div style="display: flex; margin: auto">
                        <asp:TextBox CssClass="textTimKiem" ID="txtTimKiem" runat="server" placeholder="Nhập mã khoa hoặc tên khoa cần tìm"></asp:TextBox>
                        <asp:Button CssClass="btn" ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click" />
                    </div>
                    <asp:GridView CssClass="data" ID="dataKhoaHoc" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="makhoahoc" OnPageIndexChanging="dataKhoaHoc_PageIndexChanging" OnRowDeleting="dataKhoaHoc_RowDeleting" OnSelectedIndexChanged="dataKhoaHoc_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaKhoaHoc" HeaderText="Mã khóa học" />
                            <asp:BoundField DataField="NamBatDau" HeaderText="Năm bắt đầu" />
                            <asp:BoundField DataField="NamKetThuc" HeaderText="Năm kết thúc" />
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
